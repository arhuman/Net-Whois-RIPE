package Net::Whois::Object::Irt;

use base qw/Net::Whois::Object/;

# From http://www.apnic.net/apnic-info/whois_search/using-whois/guide/irt
#
# irt:            [mandatory]  [single]     [primary/lookup key]
# address:        [mandatory]  [multiple]   [ ]
# phone:          [optional]   [multiple]   [ ]
# fax-no:         [optional]   [multiple]   [ ]
# e-mail:         [mandatory]  [multiple]   [lookup key]
# abuse-mailbox:  [mandatory]  [multiple]   [inverse key]
# signature:      [optional]   [multiple]   [ ]
# encryption:     [optional]   [multiple]   [ ]
# admin-c:        [mandatory]  [multiple]   [inverse key]
# tech-c:         [mandatory]  [multiple]   [inverse key]
# auth:           [mandatory]  [multiple]   [inverse key]
# remarks:        [optional]   [multiple]   [ ]
# irt-nfy:        [optional]   [multiple]   [inverse key]
# notify:         [optional]   [multiple]   [inverse key]
# mnt-by:         [mandatory]  [multiple]   [inverse key]
# changed:        [mandatory]  [multiple]   [ ]
# source:         [mandatory]  [single]     [ ]


=head1 NAME

Net::Whois::Object::Irt - an object representation of the RPSL Irt block

=head1 DESCRIPTION

The irt object is used to provide information about a Computer Security
Incident Response Team (CSIRT).  IRTs or CSIRTs specifically respond to
computer security incident reports and activity.

They are dedicated abuse handling teams, (as distinct from network operational
departments) which review and respond to abuse reports.

=head1 METHODS

=head2 B<new( %options )>

Constructor for the Net::Whois::Object::Irt class

=cut

sub new {
    my ( $class, %options ) = @_;

    my $self = bless {}, $class;

    for my $key ( keys %options ) {
        $self->$key( $options{$key} );
    }

    return $self;
}

=head2 B<irt( [$irt] )>

Accessor to the irt attribute.
Accepts an optional irt, always return the current irt.

=cut

sub irt {
    my ( $self, $irt ) = @_;
    $self->{irt} = $irt if defined $irt;
    return $self->{irt};
}

=head2 B<address( [$address] )>

Accessor to the address attribute.
Accepts an optional address to be added to the address array,
always return the current address array.

=cut

sub address {
    my ( $self, $address ) = @_;
    push @{ $self->{address} }, $address if defined $address;
    return \@{ $self->{address} };
}

=head2 B<phone( [$phone] )>

Accessor to the phone attribute.
Accepts an optional phone number to be added to the phone array,
always return the current phone array.

=cut

sub phone {
    my ( $self, $phone ) = @_;
    push @{ $self->{phone} }, $phone if defined $phone;
    return \@{ $self->{phone} };
}

=head2 B<fax_no( [$fax_no] )>

Accessor to the fax_no attribute.
Accepts an optional fax_no to be added to the fax_no array,
always return the current fax_no array.

=cut

sub fax_no {
    my ( $self, $fax_no ) = @_;
    push @{ $self->{fax_no} }, $fax_no if defined $fax_no;
    return \@{ $self->{fax_no} };
}

=head2 B<e_mail( [$e_mail] )>

Accessor to the e_mail attribute.
Accepts an optional e_mail to be added to the e_mail array,
always return the current e_mail array.

=cut

sub e_mail {
    my ( $self, $e_mail ) = @_;
    push @{ $self->{e_mail} }, $e_mail if defined $e_mail;
    return \@{ $self->{e_mail} };
}

=head2 B<abuse_mailbox( [$abuse_mailbox] )>

Accessor to the abuse_mailbox attribute.
Accepts an optional abuse_mailbox to be added to the abuse_mailbox array,
always return the current abuse_mailbox array.

=cut

sub abuse_mailbox {
    my ( $self, $abuse_mailbox ) = @_;
    push @{ $self->{abuse_mailbox} }, $abuse_mailbox if defined $abuse_mailbox;
    return \@{ $self->{abuse_mailbox} };
}

=head2 B<signature( [$signature] )>

Accessor to the signature attribute.
Accepts an optional signature to be added to the signature array,
always return the current signature array.

=cut

sub signature {
    my ( $self, $signature ) = @_;
    push @{ $self->{signature} }, $signature if defined $signature;
    return \@{ $self->{signature} };
}

=head2 B<encryption( [$encryption] )>

Accessor to the encryption attribute.
Accepts an optional encryption to be added to the encryption array,
always return the current encryption array.

=cut

sub encryption {
    my ( $self, $encryption ) = @_;
    push @{ $self->{encryption} }, $encryption if defined $encryption;
    return \@{ $self->{encryption} };
}

=head2 B<auth( [$auth] )>

Accessor to the auth attribute.
Accepts an optional auth to be added to the auth array,
always return the current auth array.

=cut

sub auth {
    my ( $self, $auth ) = @_;
    push @{ $self->{auth} }, $auth if defined $auth;
    return \@{ $self->{auth} };
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

=head2 B<irt_nfy( [$irt_nfy] )>

Accessor to the irt_nfy attribute.
Accepts an optional irt_nfy value to be added to the irt_nfy array,
always return the current irt_nfy array.

=cut

sub irt_nfy {
    my ( $self, $irt_nfy ) = @_;
    push @{ $self->{irt_nfy} }, $irt_nfy if defined $irt_nfy;
    return \@{ $self->{irt_nfy} };
}

1;
