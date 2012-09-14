package Net::Whois::Object::Mntner;

use base qw/Net::Whois::Object/;

# http://www.ripe.net/data-tools/support/documentation/update-ref-manual#section-17
# http://www.apnic.net/apnic-info/whois_search/using-whois/guide/mntner
#
# mntner:        [mandatory]  [single]     [primary/look-up key]
# descr:         [mandatory]  [multiple]   [ ]
# org:           [optional]   [multiple]   [inverse key]
# admin-c:       [mandatory]  [multiple]   [inverse key]
# tech-c:        [optional]   [multiple]   [inverse key]
# upd-to:        [mandatory]  [multiple]   [inverse key]
# mnt-nfy:       [optional]   [multiple]   [inverse key]
# auth:          [mandatory]  [multiple]   [ ]
# remarks:       [optional]   [multiple]   [ ]
# notify:        [optional]   [multiple]   [inverse key]
# abuse-mailbox: [optional]   [multiple]   [inverse key]
# mnt-by:        [mandatory]  [multiple]   [inverse key]
# auth-override: [optional]   [single]     [ ]
# referral-by:   [mandatory]  [single]     [inverse key]
# changed:       [mandatory]  [multiple]   [ ]
# source:        [mandatory]  [single]     [ ]

=head1 NAME

Net::Whois::Object::Mntner - an object representation of the RPSL Mntner block

=head1 DESCRIPTION

Objects in the RIPE Database may be protected using Mntner (pronounced
"maintainer") objects.  A Mntner object specifies authentication
information required to authorise creation, deletion or modification
of the objects protected by the Mntner.

Objects are protected by a Mntner, if they contain a reference to the Mntner
in the object. This is done by including a mnt-by attribute. Other
attributes offer hierarchical protection. The mnt-by attribute is mandatory
in all object types. Most users set the mnt-by value in a Mntner to
reference itself.

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

    $self->attributes( 'primary', ['mntner'] );
    $self->attributes( 'mandatory', [ 'mntner', 'descr', 'admin_c', 'auth', 'mnt_by', 'referral_by', 'changed', 'source' ] );
    $self->attributes( 'optional', [ 'org', 'tech_c', 'mnt_nfy', 'remarks', 'notify', 'abuse_mailbox', 'auth_override' ] );
    $self->attributes( 'single', [ 'mntner', 'auth_override', 'auth', 'referral_by', 'source' ] );
    $self->attributes( 'multiple', [ 'descr', 'admin_c', 'mnt_by', 'changed', 'org', 'tech_c', 'mnt_nfy', 'remarks', 'notify', 'abuse_mailbox' ] );

    return $self;
}

=head2 B<mntner( [$mntner] )>

Accessor to the mntner attribute.
Accepts an optional mntner value to be added to the mntner array,
always return the current mntner.

The unique name of a mntner object. APNIC recommends the following formats:

Maintainer for resource registrations:

<maint>-<iso3166-code>-<organization>

 EXAMPLE 
 MAINT-WF-SPARKYNET

=cut

sub mntner {
    my ( $self, $mntner ) = @_;

    return $self->_single_attribute_setget( 'mntner', $mntner );
}

=head2 B<descr( [$descr] )>

Accessor to the descr attribute.
Accepts an optional descr line to be added to the descr array,
always return the current descr array.

A short description of the mntner object and the name of the organization
associated with it.

=cut

sub descr {
    my ( $self, $descr ) = @_;

    return $self->_multiple_attribute_setget( 'descr', $descr );
}

=head2 B<org( [$org] )>

Accessor to the org attribute.
Accepts an optional org value to be added to the org array,
always return the current org array.

The organisation this object is bound to.

=cut

sub org {
    my ( $self, $org ) = @_;

    return $self->_multiple_attribute_setget( 'org', $org );
}

=head2 B<admin_c( [$contact] )>

Accessor to the admin_c attribute.
Accepts an optional contact to be added to the admin_c array,
always return the current admin_c array.

The NIC-handle of an on-site contact Person object. As more than one
person often fulfills a role function, there may be more than one admin_c
listed.

An administrative contact (admin_c) must be someone who is
physically located at the site of the network.

=cut

sub admin_c {
    my ( $self, $contact ) = @_;

    return $self->_multiple_attribute_setget( 'admin_c', $contact );
}

=head2 B<tech_c( [$contact] )>

Accessor to the tech_c attribute.
Accepts an optional contact to be added to the tech_c array,
always return the current tech_c array.

The NIC-handle of a technical contact Person or Role object.  As more than
one person often fulfills a role function, there may be more than one tech_c
listed.

A technical contact (tech_c) must be a person responsible for the
day-to-day operation of the network, but does not need to be
physically located at the site of the network.

=cut

sub tech_c {
    my ( $self, $contact ) = @_;

    return $self->_multiple_attribute_setget( 'tech_c', $contact );
}

=head2 B<upd_to( [$upd_to] )>

Accessor to the upd_to attribute.
Accepts an optional upd_to value to be added to the upd_to array,
always return the current upd_to array.

The upd_to attribute specifies the email address to be notified when an
attempt to update an object protected by this Mntner is unsuccessful.

=cut

sub upd_to {
    my ( $self, $upd_to ) = @_;

    return $self->_multiple_attribute_setget( 'upd_to', $upd_to );
}

=head2 B<mnt_nfy( [$mnt_nfy] )>

Accessor to the mnt_nfy attribute.
Accepts an optional mnt_nfy value to be added to the mnt_nfy array,
always return the current mnt_nfy array.

The mnt_nfy attribute specifies the email address to be notified when an
object protected by this Mntner is successfully updated.

=cut

sub mnt_nfy {
    my ( $self, $mnt_nfy ) = @_;

    return $self->_multiple_attribute_setget( 'mnt_nfy', $mnt_nfy );
}

=head2 B<auth( [$auth] )>

Accessor to the auth attribute.
Accepts an optional auth value to be added to the auth array,
always return the current auth array.

The auth attribute defines an authentication scheme to be used. . Any of
the current authentication schemes used by the RIPE Database are allowed.

=cut

sub auth {
    my ( $self, $auth ) = @_;

    return $self->_multiple_attribute_setget( 'auth', $auth );
}

=head2 B<remarks( [$remark] )>

Accessor to the remarks attribute.
Accepts an optional remark to be addedt to the remarks array,
always return the current remarks array.

General remarks. May include a URL or email address.

=cut

sub remarks {
    my ( $self, $remark ) = @_;

    return $self->_multiple_attribute_setget( 'remarks', $remark );
}

=head2 B<notify( [$notify] )>

Accessor to the notify attribute.
Accepts an optional notify value to be added to the notify array,
always return the current notify array.

The email address to which notifications of changes to this object should
be sent.

=cut

sub notify {
    my ( $self, $notify ) = @_;

    return $self->_multiple_attribute_setget( 'notify', $notify );
}

=head2 B<mnt_by( [$mnt_by] )>

Accessor to the mnt_by attribute.
Accepts an optional mnt_by value to be added to the mnt_by array,
always return the current mnt_by array.

Lists a registered Mntner used to authorize and authenticate changes to
this object.

Most users set the mnt-by value in a Mntner to reference itself.

=cut

sub mnt_by {
    my ( $self, $mnt_by ) = @_;

    return $self->_multiple_attribute_setget( 'mnt_by', $mnt_by );
}

=head2 B<auth_override( [$auth_override] )>

Accessor to the auth_override attribute.
Accepts an optional auth_override, always return the current auth_override.

Routing Policy System Security specification defines an auth_override attribute
in the Mntner object template. Together with referral-by attribute, they allow 
for a Mntner to be modified if it becomes unresponsive. 
As this is not part of the core functionality of the RIPE Database, 
it has not been implemented in the current version of the database.

=cut

sub auth_override {
    my ( $self, $auth_override ) = @_;

    return $self->_single_attribute_setget( 'auth_override', $auth_override );
}

=head2 B<referral_by( [$referral_by] )>

Accessor to the referral_by attribute.
Accepts an optional referral_by, always return the current referral_by.

Routing Policy System Security specification defines an auth_override attribute
in the Mntner object template. Together with referral-by attribute, they allow 
for a Mntner to be modified if it becomes unresponsive. 
As this is not part of the core functionality of the RIPE Database, 
it has not been implemented in the current version of the database.

=cut

sub referral_by {
    my ( $self, $referral_by ) = @_;

    return $self->_single_attribute_setget( 'referral_by', $referral_by );
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

    return $self->_multiple_attribute_setget( 'changed', $changed );
}

=head2 B<source( [$source] )>

Accessor to the source attribute.
Accepts an optional source, always return the current source.

The name of the database from which the data was obtained.

=cut

sub source {
    my ( $self, $source ) = @_;

    return $self->_single_attribute_setget( 'source', $source );
}

=head2 B<country( [$country] )>

Accessor to the country attribute.
Accepts an optional value, always return the current 'country'.
Two letter ISO 3166 code of the country or economy where the admin-c is based.

Please use UPPERCASE letters.

=cut

sub country {
    my ( $self, $country ) = @_;

    return $self->_single_attribute_setget( 'country', $country );
}

=head2 B<abuse_mailbox( [$abuse_mailbox] )>

Accessor to the abuse_mailbox attribute.
Accepts an optional abuse_mailbox value to be added to the abuse_mailbox array,
always return the current abuse_mailbox array.

=cut

sub abuse_mailbox {
    my ( $self, $abuse_mailbox ) = @_;

    return $self->_multiple_attribute_setget( 'abuse_mailbox', $abuse_mailbox );
}

1;
