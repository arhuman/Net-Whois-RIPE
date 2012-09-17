package Net::Whois::Object::KeyCert;

use base qw/Net::Whois::Object/;

# http://www.ripe.net/data-tools/support/documentation/update-ref-manual#section-16
# http://www.apnic.net/apnic-info/whois_search/using-whois/guide/key-cert
#
# key-cert:      [mandatory]  [single]     [primary/look-up key]
# method:        [generated]  [single]     [ ]
# owner:         [generated]  [multiple]   [ ]
# fingerpr:      [generated]  [single]     [ ]
# certif:        [mandatory]  [multiple]   [ ]
# org:           [optional]   [multiple]   [inverse key]
# remarks:       [optional]   [multiple]   [ ]
# notify:        [optional]   [multiple]   [inverse key]
# admin-c:       [optional]   [multiple]   [inverse key]
# tech-c:        [optional]   [multiple]   [inverse key]
# mnt-by:        [mandatory]  [multiple]   [inverse key]
# changed:       [mandatory]  [multiple]   [ ]
# source:        [mandatory]  [single]     [ ]

=head1 NAME

Net::Whois::Object::KeyCert - an object representation of the RPSL KeyCert block

=head1 DESCRIPTION

A key-cert object is a database public key certificate that is stored
on the server and may be used with a mntner object for authentication
when performing updates. Currently only PGP keys are supported.

=head1 METHODS

=head2 B<new( %options )>

Constructor for the Net::Whois::Object::InetRtr class

=cut

sub new {
    my ( $class, @options ) = @_;

    my $self = bless {}, $class;
    $self->_init(@options);

    $self->attributes( 'primary',   ['key_cert'] );
    $self->attributes( 'mandatory', [ 'key_cert', 'certif', 'mnt_by', 'changed', 'source' ] );
    $self->attributes( 'optional', [ 'org', 'remarks', 'notify', 'admin_c', 'tech_c' ] );
    $self->attributes( 'single', [ 'key_cert', 'method', 'fingerpr', 'source' ] );
    $self->attributes( 'multiple', [ 'owner', 'certif', 'org', 'remarks', 'tech_c', 'admin_c', 'notify', 'mnt_by', 'changed' ] );

    return $self;
}

=head2 B<key_cert( [$key_cert] )>

Accessor to the key_cert attribute.
Accepts an optional key_cert value, always return the current key_cert value.

For PGP KeyCert objects, the value of the key_cert attribute must be
PGP-"key-id". These keys are compliant with the Open PGP Internet Standard.

For X.509 KeyCert objects, the database software assigns this value as
X.509-n. Here, 'n' is the next available number assigned by the software. If
you want to create an X.509 KeyCert object, you should specify the value as
AUTO-xx. If you delete an X.509 KeyCert object, it is not possible to
recreate it with the same name.

=cut

sub key_cert {
    my ( $self, $key_cert ) = @_;

    return $self->_single_attribute_setget( 'key_cert', $key_cert );
}

=head2 B<method( [$method] )>

Accessor to the method attribute.
Accepts an optional method, always return the current method value.

The method attribute is generated by the software. 
It is not necessary to include this attribute when you create or
modify this object. If it is supplied, the software will check the value.
If necessary the software will replace the supplied value with generated
value. In this case a warning is returned to the user.

=cut

sub method {
    my ( $self, $method ) = @_;

    return $self->_single_attribute_setget( 'method', $method );
}

=head2 B<owner( [$owner] )>

Accessor to the owner attribute.
Accepts an optional owner to be added to the owner array,
always return the current owner array.

The owner attribute is generated by the software. 
It is not necessary to include this attribute when you create or
modify this object. If it is supplied, the software will check the value.
If necessary the software will replace the supplied value with generated
value. In this case a warning is returned to the user.

=cut

sub owner {
    my ( $self, $owner ) = @_;

    return $self->_multiple_attribute_setget( 'owner', $owner );
}

=head2 B<fingerpr( [$fingerpr] )>

Accessor to the fingerpr attribute.
Accepts an optional fingerpr, always return the current fingerpr.

The fingerpr attribute is generated by the software. 
It is not necessary to include this attribute when you create or
modify this object. If it is supplied, the software will check the value.
If necessary the software will replace the supplied value with generated
value. In this case a warning is returned to the user.

=cut

sub fingerpr {
    my ( $self, $fingerpr ) = @_;

    return $self->_single_attribute_setget( 'fingerpr', $fingerpr );
}

=head2 B<certif( [$certif] )>

Accessor to the certif attribute.
Accepts an optional certif to be added to the certif array,
always return the current certif array.

The certif attribute contains the public key. The value of the public key
should be supplied either using multiple certif attributes, or in one
certif attribute split over several lines. In the first case, this is
easily done by exporting the key from your local key ring in ASCII armored
format and adding the string certif to the start of each line of the key.
In the second case, line continuation should be used to represent an ASCII
armored format of the key. All the lines of the exported key must be included,
as well as the start/end markers and the empty line which separates the header
from the key body.

=cut

sub certif {
    my ( $self, $certif ) = @_;

    return $self->_multiple_attribute_setget( 'certif', $certif );
}

=head2 B<remarks( [$remark] )>

Accessor to the remarks attribute.
Accepts an optional remark to be added to the remarks array,
always return the current remarks array.

General remarks. May include a URL or email address.

=cut

sub remarks {
    my ( $self, $remark ) = @_;

    return $self->_multiple_attribute_setget( 'remarks', $remark );
}

=head2 B<org( [$org] )>

Accessor to the org attribute.
Accepts an optional org value to be added to the org array,
always return the current org array.

The organisation entity this object is bound to.

=cut

sub org {
    my ( $self, $org ) = @_;

    return $self->_multiple_attribute_setget( 'org', $org );
}

=head2 B<notify( [$notify] )>

Accessor to the notify attribute.
Accepts an optional notify value to be added to the notify array,
always return the current notify array.

The email address to which notifications of changes to this object should be
sent.

=cut

sub notify {
    my ( $self, $notify ) = @_;

    return $self->_multiple_attribute_setget( 'notify', $notify );
}

=head2 B<admin_c( [$contact] )>

Accessor to the admin_c attribute.
Accepts an optional contact to be added to the admin_c array,
always return the current admin_c array.

The NIC-handle of an on-site contact Person object. As more than one person
often fulfills a role function, there may be more than one admin_c listed.

An administrative contact (admin_c) must be someone who is physically
located at the site of the network.

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

=head2 B<mnt_by( [$mnt_by] )>

Accessor to the mnt_by attribute.
Accepts an optional mnt_by value to be added to the mnt_by array,
always return the current mnt_by array.

Lists a registered Mntner used to authorize and authenticate changes to this
object.

=cut

sub mnt_by {
    my ( $self, $mnt_by ) = @_;

    return $self->_multiple_attribute_setget( 'mnt_by', $mnt_by );
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

The database where the object is registered.

=cut

sub source {
    my ( $self, $source ) = @_;

    return $self->_single_attribute_setget( 'source', $source );
}

1;
