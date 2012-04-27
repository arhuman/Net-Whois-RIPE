package Net::Whois::Object::Mntner;

use base qw/Net::Whois::Object/;

# From ripe-223 
#
# mntner:        [mandatory]  [single]     [primary/look-up key]
# descr:         [mandatory]  [multiple]   [ ]
# admin-c:       [mandatory]  [multiple]   [inverse key]
# tech-c:        [optional]   [multiple]   [inverse key]
# upd-to:        [mandatory]  [multiple]   [inverse key]
# mnt-nfy:       [optional]   [multiple]   [inverse key]
# auth:          [mandatory]  [multiple]   [ ]
# remarks:       [optional]   [multiple]   [ ]
# notify:        [optional]   [multiple]   [inverse key]
# mnt-by:        [mandatory]  [multiple]   [inverse key]
# auth-override: [optional]   [single]     [ ]
# referral-by:   [mandatory]  [single]     [inverse key]
# changed:       [mandatory]  [multiple]   [ ]
# source:        [mandatory]  [single]     [ ]

# From http://www.apnic.net/apnic-info/whois_search/using-whois/guide/mntner
# country:        [optional]   [single]     [ ]
# abuse-mailbox:  [optional]   [multiple]   [inverse key]

=head1 NAME

Net::Whois::Object::Mntner - an object representation of the RPSL Mntner block

=head1 DESCRIPTION

Objects in the RIPE Database may be protected using mntner (pronounced
"maintainer") objects.  A mntner object specifies authentication
information required to authorise creation, deletion or modification
of the objects protected by the mntner.

=head1 METHODS

=head2 B<new( %options )>

Constructor for the Net::Whois::Object::Mntner class

=cut

sub new {
    my ( $class, %options ) = @_;

    my $self = bless {}, $class;

    for my $key ( keys %options ) {
        $self->$key( $options{$key} );
    }

    return $self;
}

=head2 B<mntner( [$mntner] )>

Accessor to the mntner attribute.
Accepts an optional mntner value to be added to the mntner array,
always return the current mntner.

=cut

sub mntner {
    my ( $self, $mntner ) = @_;
    $self->{mntner} = $mntner if defined $mntner;
    return $self->{mntner};
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

=head2 B<upd_to( [$upd_to] )>

Accessor to the upd_to attribute.
Accepts an optional upd_to value to be added to the upd_to array,
always return the current upd_to array.

=cut

sub upd_to {
    my ( $self, $upd_to ) = @_;
    push @{ $self->{upd_to} }, $upd_to if defined $upd_to;
    return \@{ $self->{upd_to} };
}

=head2 B<mnt_nfy( [$mnt_nfy] )>

Accessor to the mnt_nfy attribute.
Accepts an optional mnt_nfy value to be added to the mnt_nfy array,
always return the current mnt_nfy array.

=cut

sub mnt_nfy {
    my ( $self, $mnt_nfy ) = @_;
    push @{ $self->{mnt_nfy} }, $mnt_nfy if defined $mnt_nfy;
    return \@{ $self->{mnt_nfy} };
}

=head2 B<auth( [$auth] )>

Accessor to the auth attribute.
Accepts an optional auth value to be added to the auth array,
always return the current auth array.

=cut

sub auth {
    my ( $self, $auth ) = @_;
    push @{ $self->{auth} }, $auth if defined $auth;
    return \@{ $self->{auth} };
}

=head2 B<remarks( [$remark] )>

Accessor to the remarks attribute.
Accepts an optional remark to be addedt to the remarks array,
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

=head2 B<auth_override( [$auth_override] )>

Accessor to the auth_override attribute.
Accepts an optional auth_override, always return the current auth_override.

=cut

sub auth_override {
    my ( $self, $auth_override ) = @_;
    $self->{auth_override} = $auth_override if defined $auth_override;
    return $self->{auth_override};
}

=head2 B<referral_by( [$referral_by] )>

Accessor to the referral_by attribute.
Accepts an optional referral_by, always return the current referral_by.

=cut

sub referral_by {
    my ( $self, $referral_by ) = @_;
    $self->{referral_by} = $referral_by if defined $referral_by;
    return $self->{referral_by};
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

=head2 B<country( [$country] )>

Accessor to the country attribute.
Accepts an optional value, always return the current 'country'.
Two letter ISO 3166 code of the country or economy where the admin-c is based.

Please use UPPERCASE letters.

=cut

sub country {
    my ( $self, $country ) = @_;
    $self->{country} = $country if defined $country;
    return $self->{country};
}

=head2 B<abuse_mailbox( [$abuse_mailbox] )>

Accessor to the abuse_mailbox attribute.
Accepts an optional abuse_mailbox value to be added to the abuse_mailbox array,
always return the current abuse_mailbox array.

=cut

sub abuse_mailbox {
    my ( $self, $abuse_mailbox ) = @_;
    push @{ $self->{abuse_mailbox} }, $abuse_mailbox if defined $abuse_mailbox;
    return \@{ $self->{abuse_mailbox} };
}

1;
