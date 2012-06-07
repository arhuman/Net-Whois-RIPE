package Net::Whois::Object::PeeringSet;

use base qw/Net::Whois::Object/;

# http://www.ripe.net/data-tools/support/documentation/update-ref-manual#section-19
# http://www.apnic.net/apnic-info/whois_search/using-whois/guide/peering-set
#
# peering-set:   [mandatory]  [single]     [primary/look-up key]
# descr:         [mandatory]  [multiple]   [ ]
# peering:       [mandatory]  [multiple]   [ ]
# remarks:       [optional]   [multiple]   [ ]
# tech-c:        [mandatory]  [multiple]   [inverse key]
# admin-c:       [mandatory]  [multiple]   [inverse key]
# notify:        [optional]   [multiple]   [inverse key]
# mnt-by:        [mandatory]  [multiple]   [inverse key]
# changed:       [mandatory]  [multiple]   [ ]
# source:        [mandatory]  [single]     [ ]

# From http://www.apnic.net/apnic-info/whois_search/using-whois/guide/peering-set
#
# mp-peering:     [optional]   [multiple]   [ ]
# mnt-lower:      [optional]   [multiple]   [inverse key]


=head1 NAME

Net::Whois::Object::PeeringSet - an object representation of the RPSL PeeringSet block

=head1 DESCRIPTION

A peering-set object defines a set of peerings that are listed in its
"peering:" attributes.  The "peering-set:" attribute defines the name
of the set.  It is an RPSL name that starts with "prng-".

=head1 METHODS

=head2 B<new( %options )>

Constructor for the Net::Whois::Object::PeeringSet class

=cut

sub new {
    my ( $class, %options ) = @_;

    my $self = bless {}, $class;

    for my $key ( keys %options ) {
        $self->$key( $options{$key} );
    }

    return $self;
}

=head2 B<peering_set( [$peering_set] )>

Accessor to the peering_set attribute (the name of the filter set).
Accepts an optional peering_set, always return the current peering_set.

The peering_set must begin with 'PRNG-'.

=cut

sub peering_set {
    my ( $self, $peering_set ) = @_;
    $self->{peering_set} = $peering_set if defined $peering_set;
    return $self->{peering_set};
}

=head2 B<descr( [$descr] )>

Accessor to the descr attribute.
Accepts an optional descr line to be added to the descr array,
always return the current descr array.

=cut

sub descr {
    my ( $self, $descr ) = @_;
    push @{ $self->{descr} }, $descr if defined $descr;
    return \@{ $self->{descr} };
}

=head2 B<peering( [$peering] )>

Accessor to the peering attribute.
Accepts an optional peering value to be added to the peering array,
always return the current peering array.

=cut

sub peering {
    my ( $self, $peering ) = @_;
    push @{ $self->{peering} }, $peering if defined $peering;
    return \@{ $self->{peering} };
}

=head2 B<remarks( [$remark] )>

Accessor to the remarks attribute.
Accepts an optional remark to be added to the remarks array,
always return the current remarks array.

=cut

sub remarks {
    my ( $self, $remark ) = @_;
    push @{ $self->{remarks} }, $remark if defined $remark;
    return \@{ $self->{remarks} };
}

=head2 B<tech_c( [$contact] )>

Accessor to the tech_c attribute.
Accepts an optional contact to be added to the tech_c array,
always return the current tech_c array.

=cut

sub tech_c {
    my ( $self, $contact ) = @_;
    push @{ $self->{tech_c} }, $contact if defined $contact;
    return \@{ $self->{tech_c} };
}

=head2 B<admin_c( [$contact] )>

Accessor to the admin_c attribute.
Accepts an optional contact to be added to the admin_c array,
always return the current admin_c array.

=cut

sub admin_c {
    my ( $self, $contact ) = @_;
    push @{ $self->{admin_c} }, $contact if defined $contact;
    return \@{ $self->{admin_c} };
}

=head2 B<notify( [$notify] )>

Accessor to the notify attribute.
Accepts an optional notify value to be added to the notify array,
always return the current notify array.

=cut

sub notify {
    my ( $self, $notify ) = @_;
    push @{ $self->{notify} }, $notify if defined $notify;
    return \@{ $self->{notify} };
}

=head2 B<mnt_by( [$mnt_by] )>

Accessor to the mnt_by attribute.
Accepts an optional mnt_by value to be added to the mnt_by array,
        always return the current 'mnt_by' array.

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

=head2 B<mp_peering( [$mp_peering] )>

Accessor to the mp_peering attribute.
Accepts an optional mp_peering value to be added to the mp_peering array,
always return the current mp_peering array.

=cut

sub mp_peering {
    my ( $self, $mp_peering ) = @_;
    push @{ $self->{mp_peering} }, $mp_peering if defined $mp_peering;
    return \@{ $self->{mp_peering} };
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

1;
