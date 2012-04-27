package Net::Whois::Object::AsBlock;

use base qw/Net::Whois::Object/;

# From ripe-223 
#
# as-block:      [mandatory]  [single]     [primary/look-up key]
# descr:         [optional]   [multiple]   [ ]
# remarks:       [optional]   [multiple]   [ ]
# tech-c:        [mandatory]  [multiple]   [inverse key]
# admin-c:       [mandatory]  [multiple]   [inverse key]
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

=cut

sub as_block {
    my ( $self, $as_block ) = @_;
    $self->{as_block} = $as_block if defined $as_block;
    return $self->{as_block};
}

=head2 B<descr( [$descr] )>

Accessor to the descr attribute.
Accepts an optional descr, always return the current descr value.

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

=cut

sub changed {
    my ( $self, $changed ) = @_;
    push @{ $self->{changed} }, $changed if defined $changed;
    return \@{ $self->{changed} };
}

=head2 B<source( [$source] )>

Accessor to the source attribute.
Accepts an optional source, always return the current source.

=cut

sub source {
    my ( $self, $source ) = @_;
    $self->{source} = $source if defined $source;
    return $self->{source};
}

=head2 B<org( [$org] )>

Accessor to the org attribute.
Accepts an optional org, always return the current org.

=cut

sub org {
    my ( $self, $org ) = @_;
    $self->{org} = $org if defined $org;
    return $self->{org};
}

1;
