package Net::Whois::Object;
use strict;
use warnings;

use Carp;
use Net::Whois::RIPE;
use Data::Dumper;

our $LWP;
BEGIN {
    $LWP    = do {
        eval {
            require LWP::UserAgent;
        };
        ($@) ? 0 : 1;
    };
}

=head1 NAME

Net::Whois::Object - Object encapsulating RPSL data returned by Whois queries

=head1 SYNOPSIS

    use Net::Whois::RIPE;
    use Net::Whois::Object;

    my $whois = Net::Whois::RIPE->new( %options );
    $iterator = $whois->query('AS30781');

    push @objects, Net::Whois::Object->new($iterator);

    for my $object (@objects) {
        # process the Net::Whois::Object::xxx objects... 
        # Type of object is available via class() method
    }

=head1 USAGE

=head2 Get the data

    # Get the Class we want to modify
    my $whois = Net::Whois::RIPE->new( %options );
    $iterator = $whois->query('POLK-RIPE');

=head2 Filter the objects

Currently the only crude way to filter objects is to use the class() method.

    # To only get the Person object (and ignore the Information objects)
    my ($person) = grep {$_->class() eq 'Person'} Net::Whois::Object->new($iterator);

=head2 Modify the data

    # Add a phone number
    $person->phone(' +33 4 88 00 65 15')

=head2 Dump the current state of the data

The dump() method, permit to print the object under the classic
text form, made of 'attribute:  value' lines.
This may seem useless now, but will come handy to make update through
email.

    # Dump the modified data
    my $to_be_mailed = $person->dump();

=head2 Update the RIPE database

The RIPE database update is currently under heavy development.
*The update code is to be considered as experimental.*

We plan to offer several ways to update the RIPE database

=head3 Update through the web interface.

RIPE provides several web interfaces

=head4 SyncUpdates (*Experimental*)

Although not the latest one, this simple interface is the first to be wrapped
by this module.

B<CAUTION: SyncUpdates features require LWP::UserAgent to be installed.>

=head4 Create

Once the object has been modified, locally, you can create it in the database
calling the syncupdates_create() method.
The only parameter being the associated maintener's password.
(Certificates are planned to be used in a near future)

    $object->person('John Doe');
    ...
    my $primary_key = $object->syncupdates_create($password);

The primary key of the object created is returned.
The attribute used as primary key can be obtained through 
$object->attribute('primary') 

=head4 Update

An object existing in the RIPE database, can be retrived, modified locally
and the updated through the syncupdates_update() method.
The only parameter being the associated maintener's password.
(Certificates are planned to be used in a near future)

    $object->person('John Doe');
    ...
    $object->syncupdates_update($password);

=head4 Delete

An object existing in the RIPE database, can be retrived, and deleted in
the databased through the syncupdates_delete() method.
The only required parameter being the associated maintener's password.
(Certificates are planned to be used in a near future)

    $object->syncupdates_update($password);

An additional parameter can be used as a reason for the deletion.

    $object->syncupdates_update($password,'Obsoleted by XXX');

If no reason is provided, a default one ('Not needed anymore') is used.
    
=head3 Update through email.

Not implemented yet.

=head1 SUBROUTINES/METHODS

=head2 B<new( @lines|$iterator )>

The constructor is a factory returning the appropriate Net::Whois::Objects
based on the first attribute of the block.
You can pass an array of lines or an iterator returned by Net::Whois::RIPE
as argument.

The two following ways of using the constructor are possible
     
    my $whois = Net::Whois::RIPE->new( %options );
    $iterator = $whois->query('AS30781');

    # Using the iterator way
    
    push @objects, Net::Whois::Object->new($iterator);

or

    # Using the previous (more circonvoluted) @lines way

    while ( ! $iterator->is_exhausted() ) {
        my @lines = map { "$_\n"} split '\n',  $iterator->value();
        push @objects, Net::Whois::Object->new(@lines,"\n");
    }

=cut

sub new {
    my ( $class, @lines ) = @_;

    # If an iterator is passed as argument convert it to lines.
    if ( ref $lines[0] eq 'Iterator' ) {
        my $iterator = shift @lines;
        while ( !$iterator->is_exhausted() ) {
            push @lines, map {"$_\n"} split '\n', $iterator->value();
            push @lines, $/;
        }
    }

    my ( $attribute, $block, $object, @results, $value );

    for my $line (@lines) {

        if ( $line =~ /^%(\S+)/ ) {

            $block = 'response' unless $block;

            # Response line
            $attribute = 'response';
            $value     = $1;

        }
        elsif ( $line =~ /^(\S+):\s+(.*)/ ) {

            # Attribute line
            $attribute = $1;
            $value     = $2;

        }
        elsif ( $line =~ /^%\s+(.*)/ ) {

            $block = 'comment' unless $block;

            # Comment line
            $attribute = "comment";
            $value     = $1;

        }
        elsif ( $line =~ /^[^%]\s*(.+)/ ) {

            # Continuation line
            $value = $1;

        }
        elsif ( $line =~ /^$/ ) {

            # Blank line
            push @results, $object;
            $attribute = undef;
            $block     = undef;
            $object    = undef;
            next;

        }

        # Normalize attribute to Perl's sub name standards
        $attribute =~ s/-/_/g if $attribute;

        # First attribute determine the block
        $block = $attribute unless $block;

        if ( !$object ) {
            $object = _object_factory( $block, $value ) unless $object;
        }
        elsif ($attribute) {
            $object->$attribute($value);
        }

    }

    return @results;
}

=head2 B<attributes( [$type [, \@attributes]] )>

Accessor to the attributes of the object. 
$type can be 

    'primary'   Primary/Lookup key
    'mandatory' Required for update creation
    'optionnal' Optionnal for update/creation
    'multiple'  Can have multiple values
    'single'    Have only one value
    'all'       You can't specify attributes for this special type
                which provides all the attributes which have a type

If no $type is specified, 'all' is assumed.
Returns a list of attributes of the required type.

=cut

sub attributes {
    my ( $self, $type, $ra_attributes ) = @_;
    if ( not defined $type or $type =~ /all/i ) {
        return ( $self->attributes('mandatory'), $self->attributes('optionnal') );
    }
    croak "Invalid attribute's type ($type)" unless $type =~ m/(all|primary|mandatory|optionnal|single|multiple)/i;
    if ($ra_attributes) {
        for my $a ( @{$ra_attributes} ) {
            $self->{TYPE}{$type}{$a} = 1;
        }
    }
    return sort keys %{ $self->{TYPE}{$type} };
}

=head2 B<class ( )>

This method return the RIPE class associated to the current object.

=cut

sub class {
    my ( $self, $value ) = @_;

    return $self->_single_attribute_setget( 'class', $value );
}

=head2 B<attribute_is ( $attribute, $type )>

This method return true if $attribute is of type $type.

=cut

sub attribute_is {
    my ( $self, $attribute, $type ) = @_;

    return defined $self->{TYPE}{$type}{$attribute} ? 1 : 0;

    # for my $att ( $self->attributes( $type )) {
    #     if ($att eq $attribute) { return 1; }
    # }
    # return 0 ;
}

=head2 B<hidden_attributes( $attribute )>

Accessor to the filtered_attributes attribute (attributes to be hidden)
Accepts an optional attribute to be added to the filtered_attributes array,
always return the current filtered_attributes array.

=cut

sub filtered_attributes {
    my ( $self, $filtered_attributes ) = @_;
    push @{ $self->{filtered_attributes} }, $filtered_attributes if defined $filtered_attributes;
    return @{ $self->{filtered_attributes} };
}

=head2 B<displayed_attributes( $attribute )>

Accessor to the displayed_attributes attribute which should be displayed.
Accepts an optional attribute to be added to the displayed_attributes array,
always return the current displayed_attributes array.

=cut

sub displayed_attributes {
    my ( $self, $displayed_attributes ) = @_;
    push @{ $self->{displayed_attributes} }, $displayed_attributes if defined $displayed_attributes;
    return @{ $self->{displayed_attributes} };
}

=head2 B<dump( )>

Simple naive way to display a text form of the class.
Try to be as close as possible as the submited text.

=cut

sub dump {
    my ($self) = @_;

    my %current_index;
    my $result;

    for my $line ( @{ $self->{order} } ) {
        my $attribute = $line;
        $attribute =~ s/_/-/g;

        my $val = $self->$line();

        if ( ref $val eq 'ARRAY' ) {

            # If multi value get the lines in order
            $val = $val->[ $current_index{$line}++ ];
        }

        $val = '' unless $val;

        my $output = "$attribute:    $val\n";

        # Process the comment
        $output =~ s/comment:\s+/\% /;

        $result .= $output;
    }

    return $result;
}

=head2 B<syncupdates_update( $password )>

Update the RIPE database through the web syncupdates interface.
Use the password passed as parameter to authenticate.

=cut

sub syncupdates_update {
    my ( $self, $password ) = @_;

    my ($key)  = $self->attributes('primary');
    my $value = $self->_single_attribute_setget($key);

    my $html = $self->_syncupdates_submit( $self->dump(), $password );
    
    if ( $html =~ /Modify SUCCEEDED:.*$value/m ) {
        return $value;
    }
    else {
        croak "Update not confirmed ($html)";
    }
}

=head2 B<syncupdates_delete( $password, [$reason] )>

Delete the object in the RIPE database through the web syncupdates interface.
Use the password passed as parameter to authenticate.
The optionnal parmeter reason is used to explain why the object is deleted.

=cut

sub syncupdates_delete {
    my ( $self, $password, $reason ) = @_;

    my ($key)  = $self->attributes('primary');
    my $value = $self->_single_attribute_setget($key);

    my $text = $self->dump();
    $reason = 'Not needed anymore' unless $reason;
    $text .= "delete: $reason\n";

    my $html = $self->_syncupdates_submit( $text, $password );

    if ( $html =~ /Delete SUCCEEDED:.*$value/m ) {
        return $value;
    }
    else {
        croak "Deletion not confirmed ($html)";
    }
}

=head2 B<syncupdates_create( $password )>

Create an object in the the RIPE database through the web syncupdates interface.
Use the password passed as parameter to authenticate.

Return the primary key of the object created.

=cut

sub syncupdates_create {
    my ( $self, $password ) = @_;

    my ($key)  = $self->attributes('primary');

    my $html = $self->_syncupdates_submit( $self->dump(), $password );

    if ( $html =~ /\*\*\*Info:\s+Authorisation for\s+\[.+\]\s+(\S+)\s*$/m ) {
        my $value = $1;
        $self->_single_attribute_setget( $key, $value );
        return $value;
    }
    else {
        croak "No object KEY found ($html)";
    }
}

=begin UNDOCUMENTED

=head2 B<_object_factory( $type => $value )>

Private method. Shouldn't be used from other modules.

Simple factory, creating Net::Whois::Objet::XXXX from
the type passed as parameter.


=cut

sub _object_factory {
    my $type  = shift;
    my $value = shift;

    my %class = ( as_block     => 'AsBlock',
                  as_set       => 'AsSet',
                  aut_num      => 'AutNum',
                  comment      => 'Information',
                  domain       => 'Domain',
                  filter_set   => 'FilterSet',
                  inet6num     => 'Inet6Num',
                  inetnum      => 'InetNum',
                  inet_rtr     => 'InetRtr',
                  irt          => 'Irt',
                  key_cert     => 'KeyCert',
                  limerick     => 'Limerick',
                  mntner       => 'Mntner',
                  organisation => 'Organisation',
                  organisation => 'Organisation',
                  peering_set  => 'PeeringSet',
                  person       => 'Person',
                  poem         => 'Poem',
                  poetic_form  => 'PoeticForm',
                  response     => 'Response',
                  role         => 'Role',
                  route6       => 'Route6',
                  route        => 'Route',
                  route_set    => 'RouteSet',
                  rtr_set      => 'RtrSet',
    );

    die "Unrecognized Object (first attribute: $type = $value)" unless $class{$type};

    my $class = "Net::Whois::Object::" . $class{$type};

    eval "require $class" or die "Can't require $class ($!)";

    # my $object = $class->new( $type => $value );
    my $object = $class->new( class => $class{$type} );

    # First attribute is always single valued, except for comments
    if ( $type eq 'comment' ) {
        $object->_multiple_attribute_setget( $type => $value );
    }
    else {
        $object->_single_attribute_setget( $type => $value );
    }

    # return $class->new( $type => $value );
    return $object;

}

=head2 B<_single_attribute_setget( $attribute )>

Generic setter/getter for singlevalue attribute.

=cut

sub _single_attribute_setget {
    my ( $self, $attribute, $value ) = @_;

    if ( defined $value ) {

        # Store attribute order for dump, unless this attribute as already been set
        #
        push @{ $self->{order} }, $attribute    unless $self->{$attribute} or $attribute eq 'class';

        $self->{$attribute} = $value;
    }
    return $self->{$attribute};
}

=head2 B<_multiple_attribute_setget( $attribute )>

Generic setter/getter for multivalue attribute.

=cut

sub _multiple_attribute_setget {
    my ( $self, $attribute, $value ) = @_;

    if ( defined $value ) {

        # Store attribute order for dump
        push @{ $self->{order} }, $attribute;    

        push @{ $self->{$attribute} }, $value;
    }

    croak "$attribute $self" unless ref $self;
    return $self->{$attribute};
}

=head2 B<_syncupdates_submit( $text, $password )>

Interact with the RIPE database through the web syncupdates interface.
Submit the text passed as parameter.
Use the password passed as parameter to authenticate.
The database used is chosen based on the 'source' attribute.

Return the HTML code of the returned page.
(This will change in a near future)

=end UNDOCUMENTED

=cut

sub _syncupdates_submit {
    my ( $self, $text, $password ) = @_;

    croak "LWP::UserAgent required for updates" unless $LWP;    

    my $url = $self->source eq 'RIPE'
            ? 'http://syncupdates.db.ripe.net/'
            : 'http://syncupdates-test.db.ripe.net';

    $text .= "password: $password\n" if $password;

    my $ua = LWP::UserAgent->new;

    my $response      = $ua->post($url, { DATA => $text  });
    my $response_text = $response->decoded_content;

    unless ($response->is_success) {
        croak "Can't sync object with RIPE database: $response_text" 
    }

    return $response_text;
}

=head1 TODO

The update part (in RIPE database) still needs a lot of work.

=head1 AUTHOR

Arnaud "Arhuman" Assad, C<< <arhuman at gmail.com> >>

=head1 ACKNOWLEDGEMENTS

Thanks to Jaguar Network for allowing me to work on this during some of my office
hours.

Thanks to Luis Motta Campos for his trust when allowing me to publish this
release.

=cut

1;
