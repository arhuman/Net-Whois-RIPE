package Net::Whois::Object::Person;

use base qw/Net::Whois::Object/;

# http://www.ripe.net/data-tools/support/documentation/update-ref-manual#section-20
# http://www.apnic.net/apnic-info/whois_search/using-whois/guide/person
#
# person:        [mandatory]  [single]     [lookup key]
# address:       [mandatory]  [multiple]   [ ]
# phone:         [mandatory]  [multiple]   [ ]
# fax-no:        [optional]   [multiple]   [ ]
# e-mail:        [optional]   [multiple]   [lookup key]
# nic-hdl:       [mandatory]  [single]     [primary/look-up key]
# remarks:       [optional]   [multiple]   [ ]
# notify:        [optional]   [multiple]   [inverse key]
# mnt-by:        [optional]   [multiple]   [inverse key]
# changed:       [mandatory]  [multiple]   [ ]
# source:        [mandatory]  [single]     [ ]
BEGIN {
    __PACKAGE__->attributes( 'primary', ['nic_hdl'] );
    __PACKAGE__->attributes( 'mandatory', [ 'person', 'address', 'phone', 'nic_hdl', 'changed', 'source' ] );
    __PACKAGE__->attributes( 'optional', [ 'fax_no', 'e_mail', 'remarks', 'notify', 'mnt_by' ] );
    __PACKAGE__->attributes( 'single', [ 'person', 'nic_hdl', 'source' ] );
    __PACKAGE__->attributes( 'multiple', [ 'address', 'phone', 'changed', 'fax_no', 'e_mail', 'remarks', 'notify', 'mnt_by' ] );
}


=head1 NAME

Net::Whois::Object::Person - an object representation of the RPSL Person block

=head1 DESCRIPTION

A person object contains information about technical or administrative
contact responsible for the object where it is referenced. Once the
object is created, the value of the "person:" attribute cannot be
changed.

=head1 METHODS

=head2 B<new( %options )>

Constructor for the Net::Whois::Object::Person class

=cut

sub new {
    my ( $class, @options ) = @_;

    my $self = bless {}, $class;
    $self->_init(@options);

    return $self;
}

=head2 B<person( [$person] )>

Accessor to the person attribute.
Accepts an optional person, always return the current person.

=cut

sub person {
    my ( $self, $person ) = @_;

    return $self->_single_attribute_setget( 'person', $person );
}

=head2 B<address( [$address] )>

Accessor to the address attribute.
Accepts an optional address line to be added to the address array,
always return the current address array.

=cut

sub address {
    my ( $self, $address ) = @_;

    return $self->_multiple_attribute_setget( 'address', $address );
}

=head2 B<phone( [$phone] )>

Accessor to the phone attribute.
Accepts an optional phone number to be added to the phone array,
always return the current phone array.

=cut

sub phone {
    my ( $self, $phone ) = @_;

    return $self->_multiple_attribute_setget( 'phone', $phone );
}

=head2 B<fax_no( [$fax_no] )>

Accessor to the fax_no attribute.
Accepts an optional fax_no to be added to the fax_no array,
always return the current fax_no array.

=cut

sub fax_no {
    my ( $self, $fax_no ) = @_;

    return $self->_multiple_attribute_setget( 'fax_no', $fax_no );
}

=head2 B<e_mail( [$e_mail] )>

Accessor to the e_mail attribute.
Accepts an optional e_mail to be added to the e_mail array,
always return the current e_mail array.

=cut

sub e_mail {
    my ( $self, $e_mail ) = @_;

    return $self->_multiple_attribute_setget( 'e_mail', $e_mail );
}

=head2 B<nic_hdl( [$nic_hdl] )>

Accessor to the nic_hdl attribute.
Accepts an optional nic_hdl, always return the current nic_hdl.

=cut

sub nic_hdl {
    my ( $self, $nic_hdl ) = @_;

    return $self->_single_attribute_setget( 'nic_hdl', $nic_hdl );
}

=head2 B<remarks( [$remark] )>

Accessor to the remarks attribute.
Accepts an optional remark to be added to the remarks array,
always return the current remarks array.

=cut

sub remarks {
    my ( $self, $remark ) = @_;

    return $self->_multiple_attribute_setget( 'remarks', $remark );
}

=head2 B<notify( [$notify] )>

Accessor to the notify attribute.
Accepts an optional notify value to be added to the notify array,
always return the current notify array.

=cut

sub notify {
    my ( $self, $notify ) = @_;

    return $self->_multiple_attribute_setget( 'notify', $notify );
}

=head2 B<mnt_by( [$mnt_by] )>

Accessor to the mnt_by attribute.
Accepts an optional mnt_by value to be added to the mnt_by array,
always return the current mnt_by array.

=cut

sub mnt_by {
    my ( $self, $mnt_by ) = @_;

    return $self->_multiple_attribute_setget( 'mnt_by', $mnt_by );
}

=head2 B<changed( [$changed] )>

Accessor to the changed attribute.
Accepts an optional changed value to be added to the changed array,
always return the current changed array.

=cut

sub changed {
    my ( $self, $changed ) = @_;

    return $self->_multiple_attribute_setget( 'changed', $changed );
}

=head2 B<source( [$source] )>

Accessor to the source attribute.
Accepts an optional source, always return the current source.

=cut

sub source {
    my ( $self, $source ) = @_;

    return $self->_single_attribute_setget( 'source', $source );
}

1;
