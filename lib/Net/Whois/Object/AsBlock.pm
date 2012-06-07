package Net::Whois::Object::AsBlock;

use base qw/Net::Whois::Object/;

# http://www.ripe.net/data-tools/support/documentation/update-ref-manual#section-7
# http://www.apnic.net/apnic-info/whois_search/using-whois/guide/as-block
#
# as-block:      [mandatory]  [single]     [primary/look-up key]
# descr:         [optional]   [multiple]   [ ]
# remarks:       [optional]   [multiple]   [ ]
# org:           [optional]   [multiple]   [inverse key]
# admin-c:       [mandatory]  [multiple]   [inverse key]
# tech-c:        [mandatory]  [multiple]   [inverse key]
# notify:        [optional]   [multiple]   [inverse key]
# mnt-lower:     [optional]   [multiple]   [inverse key]
# mnt-by:        [mandatory]  [multiple]   [inverse key]
# changed:       [mandatory]  [multiple]   [ ]
# source:        [mandatory]  [single]     [ ]

# Found in the wild
# org:

=head1 NAME

Net::Whois::Object::AsBlock - an object representation of the RPSL AsBlock block

=head1 DESCRIPTION

An as-block object is needed to delegate a range of AS numbers to a
given repository.  This object may be used for authorisation of the
creation of aut-num objects within the range specified by the
"as-block:" attribute.

=head1 METHODS

=head2 B<new( %options )>

Constructor for the Net::Whois::Object::AsBlock class

=cut

sub new {
    my ( $class, %options ) = @_;

    my $self = bless {}, $class;

    for my $key ( keys %options ) {
        $self->$key( $options{$key} );
    }

    return $self;
}

=head2 B<as_block( [$as_block] )>

Accessor to the as_block attribute.
Accepts an optional as_block, always return the current as_block value.

An as_block is a range of AS numbers delegated to a Regional or National Internet Registry
(NIR).

The AS numbers in the range are subsequently assigned by the registry to
members or end-users in the region.
Information on individual AS numbers within an as-block object are
stored in the appropriate Internet Registry's Whois Database.

=cut

sub as_block {
    my ( $self, $as_block ) = @_;
    $self->{as_block} = $as_block if defined $as_block;
    return $self->{as_block};
}

=head2 B<descr( [$descr] )>

Accessor to the descr attribute.
Accepts an optional descr, always return the current descr value.

Description of the Internet Registry delegated the range of AS numbers shown
in the as-block.

=cut

sub descr {
    my ( $self, $descr ) = @_;
    push @{ $self->{descr} }, $descr if defined $descr;
    return \@{ $self->{descr} };
}

=head2 B<remarks( [$remarks] )>

Accessor to the remarks attribute.
Accepts an optional remarks to be added to the remarks array,
always return the current remarks array.

Information on the registry that maintains details of AS numbers assigned from
the as-block.

Also includes where to direct a whois client to find further information on
the AS numbers.

=cut

sub remarks {
    my ( $self, $remarks ) = @_;
    push @{ $self->{remarks} }, $remarks if defined $remarks;
    return \@{ $self->{remarks} };
}

=head2 B<tech_c( [$tech_c] )>

Accessor to the tech_c attribute.
Accepts an optional tech_c to be added to the tech_c array,
always return the current tech_c array.

The NIC-handle of a technical contact 'person' or 'role' object.  As more than
one person often fulfills a role function, there may be more than one tech-c
listed.

A technical contact (tech-c) must be a person responsible for the
day-to-day operation of the network, but does not need to be
physically located at the site of the network.


=cut

sub tech_c {
    my ( $self, $tech_c ) = @_;
    push @{ $self->{tech_c} }, $tech_c if defined $tech_c;
    return \@{ $self->{tech_c} };
}

=head2 B<admin_c( [$admin_c])>

Accessor to the admin_c attribute.
Accepts an optional admin_c to be added to the admin_c array,
always return the current admin_c array.

The NIC-handle of an on-site contact 'person' object. As more than one person
often fulfills a role function, there may be more than one admin-c listed.

An administrative contact(admin-c) must be someone who is physically
located at the site of the network.

=cut

sub admin_c {
    my ( $self, $admin_c ) = @_;
    push @{ $self->{admin_c} }, $admin_c if defined $admin_c;
    return \@{ $self->{admin_c} };
}

=head2 B<notify( [$notify] )>

Accessor to the notify attribute.
Accepts an optional value to be added notify array,
        always return the current notify array.

The email address to which notifications of changes 
to the object should be sent.

=cut

sub notify {
    my ( $self, $notify ) = @_;
    push @{ $self->{notify} }, $notify if defined $notify;
    return \@{ $self->{notify} };
}

=head2 B<mnt_lower( [$mnt_lower] )>

Accessor to the mnt_lower attribute.
Accepts an optional mnt_lower value to be added to the mnt_lower array,
always return the current mnt_lower array.

The identifier of a registered 'mntner' object used to authorize the creation
of 'aut-num' objects within the range specified by the as-block.

If no 'mnt-lower' is specified, the 'mnt-by' attribute is used for
authorization.

=cut

sub mnt_lower {
    my ( $self, $mnt_lower ) = @_;
    push @{ $self->{mnt_lower} }, $mnt_lower if defined $mnt_lower;
    return \@{ $self->{mnt_lower} };
}

=head2 B<mnt_by( [$mnt_by] )>

Accessor to the mnt_by attribute.
Accepts an optional mnt_by value to be added to the mnt_by array,
always return the current mnt_by array.

Lists a registered 'mntner' used to authorize and authenticate changes to this
object.

When your database details are protected by a 'mntner' object, then
only persons with access to the security information of that 'mntner'
object will be able to change details.

=cut

sub mnt_by {
    my ( $self, $mnt_by ) = @_;
    push @{ $self->{mnt_by} }, $mnt_by if defined $mnt_by;
    return \@{ $self->{mnt_by} };
}

=head2 B<changed( [$changed] )>

Accessor to the changed attribute.
Accepts an optional changed value to be added to the changed array,
always return the current changed array.

The email address of who last updated the database object and the date it
occurred.

Every time a change is made to a database object, this attribute will show
the email address of the person who made those changes.
Please use the address format specified in RFC 822 - Standard for
the Format of ARPA Internet Text Message and provide the date
format using one of the following two formats: YYYYMMDD or YYMMDD.

=cut

sub changed {
    my ( $self, $changed ) = @_;
    push @{ $self->{changed} }, $changed if defined $changed;
    return \@{ $self->{changed} };
}

=head2 B<source( [$source] )>

Accessor to the source attribute.
Accepts an optional source, always return the current source.

The database where the object is registered.

=cut

sub source {
    my ( $self, $source ) = @_;
    $self->{source} = $source if defined $source;
    return $self->{source};
}

=head2 B<org( [$org] )>

Accessor to the org attribute.
Accepts an optional org, always return the current org.

The organisation entity this object is bound to.

=cut

sub org {
    my ( $self, $org ) = @_;
    $self->{org} = $org if defined $org;
    return $self->{org};
}

1;
