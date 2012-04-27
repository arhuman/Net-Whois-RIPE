package Net::Whois::Object::InetRtr;

use base qw/Net::Whois::Object/;

# From ripe-223 
#
# inet-rtr:      [mandatory]  [single]     [primary/look-up key]
# descr:         [mandatory]  [multiple]   [ ]
# alias:         [optional]   [multiple]   [ ]
# local-as:      [mandatory]  [single]     [inverse key]
# ifaddr:        [mandatory]  [multiple]   [lookup key]
# peer:          [optional]   [multiple]   [ ]
# member-of:     [optional]   [multiple]   [inverse key]
# remarks:       [optional]   [multiple]   [ ]
# admin-c:       [mandatory]  [multiple]   [inverse key]
# tech-c:        [mandatory]  [multiple]   [inverse key]
# notify:        [optional]   [multiple]   [inverse key]
# mnt-by:        [mandatory]  [multiple]   [inverse key]
# changed:       [mandatory]  [multiple]   [ ]
# source:        [mandatory]  [single]     [ ]

# http://www.apnic.net/apnic-info/whois_search/using-whois/guide/inet-rtr
# mp-peer:        [optional]   [multiple]   [ ]
# interface:      [optional]   [multiple]   [lookup key]

=head1 NAME

Net::Whois::Object::InetRtr - an object representation of a RPSL InetRtr block

=head1 DESCRIPTION

Routers are specified using the inet-rtr class.  The attributes of the
inet-rtr class are shown in Figure 1.2.8.  The "inet-rtr:" attribute
is a valid DNS name of the router described. Each "alias:" attribute,
if present, is a canonical DNS name for the router.  The "local-as:"
attribute specifies the AS number of the AS that owns/operates this
router.

=head1 METHODS

=head2 new ( %options )

Constructor for the Net::Whois::Object::InetRtr class

=cut

sub new {
    my ( $class, %options ) = @_;

    my $self = bless {}, $class;

    for my $key ( keys %options ) {
        $self->$key( $options{$key} );
    }

    return $self;
}

=head2 B<inet_rtr( [$inet_rtr] )>

Accessor to the inet_rtr attribute.
Accepts an optional inet_rtr, always return the current inet_rtr value.

=cut

sub inet_rtr {
    my ( $self, $inet_rtr ) = @_;
    $self->{inet_rtr} = $inet_rtr if defined $inet_rtr;
    return $self->{inet_rtr};
}

=head2 B<descr( [$descr] )>

Accessor to the descr attribute.
Accepts an optional descr value to be added to the descr array,
always return the current descr array.

=cut

sub descr {
    my ( $self, $descr ) = @_;
    push @{ $self->{descr} }, $descr if defined $descr;
    return \@{ $self->{descr} };
}

=head2 B<alias( [$alias] )>

Accessor to the alias attribute.
Accepts an optional alias to be added to the alias array,
always return the current alias array.

=cut

sub alias {
    my ( $self, $alias ) = @_;
    push @{ $self->{alias} }, $alias if defined $alias;
    return \@{ $self->{alias} };
}

=head2 B<local_as( [$local_as] )>

Accessor to the local_as attribute.
Accepts an optional local_as, always return the current local_as.

=cut

sub local_as {
    my ( $self, $local_as ) = @_;
    $self->{local_as} = $local_as if defined $local_as;
    return $self->{local_as};
}

=head2 B<ifaddr( [$ifaddr] )>

Accessor to the ifaddr attribute.
Accepts an optional ifaddr value to be added to the ifaddr array,
always return the current ifaddr array.

=cut

sub ifaddr {
    my ( $self, $ifaddr ) = @_;
    push @{ $self->{ifaddr} }, $ifaddr if defined $ifaddr;
    return \@{ $self->{ifaddr} };
}

=head2 B<peer( [$peer] )>

Accessor to the peer attribute.
Accepts an optional peer to be added to the peer array,
always return the current peer array.

=cut

sub peer {
    my ( $self, $peer ) = @_;
    push @{ $self->{peer} }, $peer if defined $peer;
    return \@{ $self->{peer} };
}

=head2 B<member_of( [$member_of] )>

Accessor to the member_of attribute.
Accepts an optional member_of value to be be added to the member_of array,
always return the current member_of array.

=cut

sub member_of {
    my ( $self, $member_of ) = @_;
    push @{ $self->{member_of} }, $member_of if defined $member_of;
    return \@{ $self->{member_of} };
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
    my ( $self, $contact ) = @_;
    push @{ $self->{tech_c} }, $contact if defined $contact;
    return \@{ $self->{tech_c} };
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

=head2 B<mp_peer( [$peer] )>

Accessor to the mp_peer attribute.
Accepts an optional peer to be added to the mp_peer array,
always return the current mp_peer array.

This attribute performs the same function as the 'peer' attribute above. The
difference is that mp-peer allows both IPv4 and IPv6 address families to be
specified.

=cut

sub mp_peer {
    my ( $self, $mp_peer ) = @_;
    push @{ $self->{mp_peer} }, $mp_peer if defined $mp_peer;
    return \@{ $self->{mp_peer} };
}

=head2 B<interface( [$interface] )>

Accessor to the interface attribute.
Accepts an optional interface to be added to the interface array,
always return the current interface array.

This attribute performs the same function as the 'ifaddr' attribute above. The
difference is that interface allows both IPv4 and IPv6 address families to be
specified.

Describes all the inter-router serial port interfaces for all the line cards.

=cut

sub interface {
    my ( $self, $interface ) = @_;
    push @{ $self->{interface} }, $interface if defined $interface;
    return \@{ $self->{interface} };
}

1;
