package Net::Whois::Object::RtrSet;

use base qw/Net::Whois::Object/;

# http://www.ripe.net/data-tools/support/documentation/update-ref-manual#section-27
# http://www.apnic.net/apnic-info/whois_search/using-whois/guide/rtr-set
#
# rtr-set:       [mandatory]  [single]     [primary/look-up key]
# descr:         [mandatory]  [multiple]   [ ]
# members:       [optional]   [multiple]   [ ]
# mbrs-by-ref:   [optional]   [multiple]   [inverse key]
# remarks:       [optional]   [multiple]   [ ]
# tech-c:        [mandatory]  [multiple]   [inverse key]
# admin-c:       [mandatory]  [multiple]   [inverse key]
# notify:        [optional]   [multiple]   [inverse key]
# mnt-by:        [mandatory]  [multiple]   [inverse key]
# changed:       [mandatory]  [multiple]   [ ]
# source:        [mandatory]  [single]     [ ]

# From http://www.apnic.net/apnic-info/whois_search/using-whois/guide/rtr-set
# mp-members:    [optional]   [multiple]   [ ]

=head1 NAME

Net::Whois::Object::RtrSet - an object representation of the RPSL RtrSet block

=head1 DESCRIPTION

A rtr-set object defines a set of routers. A set may be described by
the "members:" attribute, which is a list of inet-rtr names, IPv4
addresses or other rtr-set names. A set may also be populated by means
of the "mbrs-by-ref:" attribute, in which case it is represented by
inet-rtr objects.

=head1 METHODS

=head2 B<new( %options )>

Constructor for the Net::Whois::Object::RtrSet class

=cut

sub new {
    my ( $class, %options ) = @_;

    my $self = bless {}, $class;

    for my $key ( keys %options ) {
        $self->$key( $options{$key} );
    }

    return $self;
}

=head2 B<rtr_set( [$rtr_set] )>

Accessor to the rtr_set attribute.
Accepts an optional rtr_set, always return the current rtr_set.

=cut

sub rtr_set {
    my ( $self, $rtr_set ) = @_;
    $self->{rtr_set} = $rtr_set if defined $rtr_set;
    return $self->{rtr_set};
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

=head2 B<members( [$member] )>

Accessor to the members attribute.
Accepts an optional member to be added to the members array,
always return the current members array.

=cut

sub members {
    my ( $self, $member ) = @_;
    push @{ $self->{members} }, $member if defined $member;
    return \@{ $self->{members} };
}

=head2 B<mbrs_by_ref( [$mbrs_by_ref] )>

Accessor to the mbrs_by_ref attribute.
Accepts an optional mbrs_by_ref value to be added to the mbrs_by_ref array,
always return the current mbrs_by_ref array.

=cut

sub mbrs_by_ref {
    my ( $self, $mbrs_by_ref ) = @_;
    push @{ $self->{mbrs_by_ref} }, $mbrs_by_ref if defined $mbrs_by_ref;
    return \@{ $self->{mbrs_by_ref} };
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

=head2 B<mnt_by( [$mnt_by])>

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

=head2 B<mp_members( [$mp_member] )>

Accessor to the mp_members attribute.
Accepts an optional mp_member to be added to the mp_members array,
always return the current mp_members array.

This attribute performs the same function as the members attribute above.
The difference is that mp-members allows both IPv4 and IPv6 address families
to be specified.

Explicitly lists IPv4 or IPv6 'members' of the rtr-set can be:

    * inet-rtr objects
    * other rtr-set objects
    * ipv4 address
    * ipv6 address

=cut

sub mp_members {
    my ( $self, $mp_member ) = @_;
    push @{ $self->{mp_members} }, $mp_member if defined $mp_member;
    return \@{ $self->{mp_members} };
}

1;
