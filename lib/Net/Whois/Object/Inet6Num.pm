package Net::Whois::Object::Inet6Num;

use base qw/Net::Whois::Object/;

# From ripe-223 
#
# inet6num:      [mandatory]  [single]     [primary/look-up key]
# netname:       [mandatory]  [single]     [lookup key]
# descr:         [mandatory]  [multiple]   [ ]
# country:       [mandatory]  [multiple]   [ ]
# admin-c:       [mandatory]  [multiple]   [inverse key]
# tech-c:        [mandatory]  [multiple]   [inverse key]
# rev-srv:       [optional]   [multiple]   [inverse key]
# status:        [generated]  [single]     [ ]
# remarks:       [optional]   [multiple]   [ ]
# notify:        [optional]   [multiple]   [inverse key]
# mnt-by:        [mandatory]  [multiple]   [inverse key]
# mnt-lower:     [optional]   [multiple]   [inverse key]
# mnt-routes:    [optional]   [multiple]   [inverse key]
# changed:       [mandatory]  [multiple]   [ ]
# source:        [mandatory]  [single]     [ ]

# From  http://www.apnic.net/apnic-info/whois_search/using-whois/guide/inet6num?view=text-only
#
# mnt-irt:       [mandatory]  [single]     [inverse key]

=head1 NAME

Net::Whois::Object::Inet6Num - an object representation of a RPSL Inet6Num block

=head1 DESCRIPTION

An inet6num object contains information on allocations and assignments
of IPv6 address space.

=head1 METHODS

=head2 new ( %options )

Constructor for the Net::Whois::Object::Inet6Num class

=cut

sub new {
    my ( $class, %options ) = @_;

    my $self = bless {}, $class;

    for my $key ( keys %options ) {
        $self->$key( $options{$key} );
    }

    return $self;
}

=head2 B<inet6num( [$inet6num] )>

Accessor to the inet6num attribute.
Accepts an optional inet6num value, always return the current inet6num value.

=cut

sub inet6num {
    my ( $self, $inet6num ) = @_;
    $self->{inet6num} = $inet6num if defined $inet6num;
    return $self->{inet6num};
}

=head2 B<netname( [$netname] )>

Accessor to the netname attribute.
Accepts an optional netname, always return the current netname.

=cut

sub netname {
    my ( $self, $netname ) = @_;
    $self->{netname} = $netname if defined $netname;
    return $self->{netname};
}

=head2 B<descr( [$descr] )>

Accessor to the descr attribute.
Accepts an optional descr to be added to the descr array,
always return the current descr array.

=cut

sub descr {
    my ( $self, $descr ) = @_;
    push @{ $self->{descr} }, $descr if defined $descr;
    return \@{ $self->{descr} };
}

=head2 B<country( [$country] )>

Accessor to the country attribute.
Accepts an optional country to be added to the country array,
always return the current country array.

=cut

sub country {
    my ( $self, $country ) = @_;
    push @{ $self->{country} }, $country if defined $country;
    return \@{ $self->{country} };
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

=head2 B<tech_c( [$contact] )>

Accessor to the tech_c attribute.
Accepts an optional contact to be added to the tech_c array,
always return the current tech_c array.

=cut

sub tech_c {
    my ( $self, $tech_c ) = @_;
    push @{ $self->{tech_c} }, $tech_c if defined $tech_c;
    return \@{ $self->{tech_c} };
}

=head2 B<rev_srv( [$serv] )>

Accessor to the rev_srv attribute.
Accepts an optional serv to be added to the rev_srv array,
always return the current rev_srv array.

=cut

sub rev_srv {
    my ( $self, $serv ) = @_;
    push @{ $self->{rev_srv} }, $serv if defined $serv;
    return \@{ $self->{rev_srv} };
}

=head2 B<status( [$status] )>

Accessor to the status attribute.
Accepts an optional status, always return the current status.

=cut

sub status {
    my ( $self, $status ) = @_;
    $self->{status} = $status if defined $status;
    return $self->{status};
}

=head2 B<remarks( [$remark] )>

Accessor to the remarks attribute.
Accepts an optional remark to be added to the remarks array,
always return the current remarks array.

=cut

sub remarks {
    my ( $self, $remarks ) = @_;
    push @{ $self->{remarks} }, $remarks if defined $remarks;
    return \@{ $self->{remarks} };
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
always return the current mnt_by array.

=cut

sub mnt_by {
    my ( $self, $mnt_by ) = @_;
    push @{ $self->{mnt_by} }, $mnt_by if defined $mnt_by;
    return \@{ $self->{mnt_by} };
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

=head2 B<mnt_routes( [$mnt_route] )>

Accessor to the mnt_routes attribute.
Accepts an optional mnt_route to be added to the mnt_routes array,
always return the current mnt_routes array.

=cut

sub mnt_routes {
    my ( $self, $mnt_route ) = @_;
    push @{ $self->{mnt_routes} }, $mnt_route if defined $mnt_route;
    return \@{ $self->{mnt_routes} };
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

=head2 B<mnt_irt( [$mnt_irt] )>

Accessor to the mnt_irt attribute.
Accepts an optional mnt_irt, always return the current mnt_irt.
The identifier of a registered 'mntner' object used to provide information
about a Computer Security Incident Response Team (CSIRT).

=cut

sub mnt_irt {
    my ( $self, $mnt_irt ) = @_;
    $self->{mnt_irt} = $mnt_irt if defined $mnt_irt;
    return $self->{mnt_irt};
}

1;
