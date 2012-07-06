package Net::Whois::Object::AsSet;

use base qw/Net::Whois::Object/;

# http://www.ripe.net/data-tools/support/documentation/update-ref-manual#section-8
# http://www.apnic.net/apnic-info/whois_search/using-whois/guide/as-set
#
# as-set:       [mandatory]  [single]     [primary/look-up key]
# descr:        [mandatory]  [multiple]   [ ]
# members:      [optional]   [multiple]   [ ]
# mbrs-by-ref:  [optional]   [multiple]   [inverse key]
# remarks:      [optional]   [multiple]   [ ]
# tech-c:       [mandatory]  [multiple]   [inverse key]
# admin-c:      [mandatory]  [multiple]   [inverse key]
# notify:       [optional]   [multiple]   [inverse key]
# mnt-by:       [mandatory]  [multiple]   [inverse key]
# changed:      [mandatory]  [multiple]   [ ]
# source:       [mandatory]  [single]     [ ]

=head1 NAME

Net::Whois::Object::AsSet - an object representation of a RPSL AsSet block

=head1 DESCRIPTION

An as-set object defines a set of aut-num objects. 
It defines a group of Autonomous Systems with the same routing policies.

=head1 METHODS

=head2 new ( %options )

Constructor for the Net::Whois::Object::AsSet class

=cut

sub new {
    my ( $class, %options ) = @_;

    my $self = bless {}, $class;

    for my $key ( keys %options ) {
        $self->$key( $options{$key} );
    }

    $self->attributes( 'primary', ['as_set'] );
    $self->attributes( 'mandatory', [ 'as_set', 'descr', 'tech_c', 'admin_c', 'mnt_by', 'changed', 'source' ] );
    $self->attributes( 'optionnal', [ 'members', 'mbrs_by_ref', 'remarks', 'notify' ] );
    $self->attributes( 'single', [ 'as_set', 'source' ] );
    $self->attributes( 'multiple', [ 'descr', 'members', 'mbrs_by_ref', 'remarks', 'tech_c', 'admin_c', 'notify', 'mnt_by', 'changed' ] );

    return $self;
}

=head2 B<as_set( [$as_set])>

Accessor to the as_set attribute.
Accepts an optional as_set, always return the current as_set value.

The as_set attribute defines the name of the set. It is an RPSL name that
starts with "as-" or as_set names and AS numbers separated by colon (':').
The later form is called Hierarchical form, the former non-hierarchical.
There must be at least one set-name within the hierarchical form that starts 
with 'as-'.

=cut

sub as_set {
    my ( $self, $as_set ) = @_;

    return $self->_single_attribute_setget( 'as_set', $as_set );
}

=head2 B<descr( [$descr] )>

Accessor to the descr attribute.
Accepts an optional descr to be added to the descr array, 
always return the current descr array.

A short description related to the object's purpose.

=cut

sub descr {
    my ( $self, $descr ) = @_;

    return $self->_multiple_attribute_setget( 'descr', $descr );
}

=head2 B<members( [$member] )>

Accessor to the members attribute.
Accepts an optional member to be added to the members array,
always return the current 'members' array.

The members attribute lists the members of the set. It can be either a list
of AS Numbers, or other as-set names.

=cut

sub members {
    my ( $self, $member ) = @_;

    return $self->_multiple_attribute_setget( 'member', $member );
}

=head2 B<mbrs_by_ref( [$mbr] )>

Accessor to the mbrs_by_ref attribute.
Accepts an optional mbr to be added to the mbrs_by_ref array,
always return the current mbrs_by_ref array.

The identifier of a registered 'mntner' object that can be used to add members
to the as-set indirectly.

The mbrs_by_ref attribute can be used in all "set" objects; it allows
indirect population of a set. If this attribute is used, the set also includes
objects of the corresponding type (aut-num objects for as-set, for example)
that are protected by one of these maintainers and whose "member-of:"
attributes refer to the name of the set. If the value of a mbrs_by_ref
attribute is ANY, any object of the corresponding type referring to the set is
a member of the set. If the mbrs_by_ref attribute is missing, the set is
defined explicitly by the members attribute.

=cut

sub mbrs_by_ref {
    my ( $self, $mbr ) = @_;

    return $self->_multiple_attribute_setget( 'mbr', $mbr );
}

=head2 B<remarks( [$remark] )>

Accessor to the remarks attribute.
Accepts an optional remark to be added to the remarks array,
always return the current remarks array.

Information about the object that cannot be stated in other attributes.
May include a URL or email address.

=cut

sub remarks {
    my ( $self, $remark ) = @_;

    return $self->_multiple_attribute_setget( 'remarks', $remark );
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

    return $self->_multiple_attribute_setget( 'tech_c', $tech_c );
}

=head2 B<admin_c( [$admin_c] )>

Accessor to the admin_c attribute.
Accepts an optional admin_c to be added to the admin_c array,
always return the current admin_c array.

The NIC-handle of an on-site contact 'person' object. As more than one person
often fulfills a role function, there may be more than one admin-c listed.

An administrative contact (admin-c) must be someone who is physically
located at the site of the network.

=cut

sub admin_c {
    my ( $self, $admin_c ) = @_;

    return $self->_multiple_attribute_setget( 'admin_c', $admin_c );
}

=head2 B<notify( [$notify] )>

Accessor to the notify attribute.
Accepts an optional notify value to be added to the notify array,
always return the current notify array.

The email address to which notifications of changes to this object will be
sent.

=cut

sub notify {
    my ( $self, $notify ) = @_;

    return $self->_multiple_attribute_setget( 'notify', $notify );
}

=head2 B<mnt_by( [$mnt] )>

Accessor to the mnt_by attribute.
Accepts an optional mnt to be added to the mnt_by array,
always return the current mnt_by array.

Lists a registered 'mntner' used to authorize and authenticate changes to this
object.

When your database details are protected by a 'mntner' object, then
only persons with access to the security information of that 'mntner'
object will be able to change details.

=cut

sub mnt_by {
    my ( $self, $mnt ) = @_;

    return $self->_multiple_attribute_setget( 'mnt', $mnt );
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
