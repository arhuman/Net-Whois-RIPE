package Net::Whois::Object::PoeticForm;

use base qw/Net::Whois::Object/;

# http://www.ripe.net/data-tools/support/documentation/update-ref-manual#section-22
# APNIC ??
#
#
# poetic-form:  [mandatory]     [single]    [primary/look-up key]
# descr:        [optional]      [multiple]  [ ]
# admin-c:      [mandatory]     [multiple]  [inverse key]
# remarks:      [optional]      [multiple]  [ ]
# notify:       [optional]      [multiple]  [inverse key]
# mnt-by:       [mandatory]     [multiple]  [inverse key]
# changed:      [mandatory]     [multiple]  [ ]
# source:       [mandatory]     [single]    [ ]
#

=head1 NAME

Net::Whois::Object::PoeticForm - an object representation of the RPSL PoeticForm block

=head1 DESCRIPTION

The poetic_form object contains a poetic_form that is submitted by a user. This object is
included in the database to show that engineers do have a sense of humour.

=head1 METHODS

=head2 B<new( %options )>

Constructor for the Net::Whois::Object::PoeticForm class

=cut

sub new {
    my ( $class, %options ) = @_;

    my $self = bless {}, $class;

    for my $key ( keys %options ) {
        $self->$key( $options{$key} );
    }

    $self->attributes( 'primary', ['poetic_form'] );
    $self->attributes( 'mandatory', [ 'poetic_form', 'admin_c', 'mnt_by', 'changed', 'source' ] );
    $self->attributes( 'optionnal', [ 'descr', 'remarks', 'notify' ] );
    $self->attributes( 'single', [ 'poetic_form', 'source' ] );
    $self->attributes( 'multiple', [ 'descr', 'admin_c', 'remarks', 'notify', 'mnt_by', 'changed' ] );

    return $self;
}

=head2 B<poetic_form( [$poetic_form] )>

Accessor to the poetic_form attribute.
Accepts an optional poetic_form, always return the current poetic_form.

=cut

sub poetic_form {
    my ( $self, $poetic_form ) = @_;

    return $self->_single_attribute_setget( 'poetic_form', $poetic_form );
}

=head2 B<descr( [$descr] )>

Accessor to the descr attribute.
Accepts an optional descr line to be added to the descr array,
always return the current descr array.

=cut

sub descr {
    my ( $self, $descr ) = @_;

    return $self->_multiple_attribute_setget( 'descr', $descr );
}

=head2 B<admin_c( [$contact] )>

Accessor to the admin_c attribute.
Accepts an optional contact to be added to the admin_c array,
always return the current admin_c array.

=cut

sub admin_c {
    my ( $self, $contact ) = @_;

    return $self->_multiple_attribute_setget( 'admin_c', $contact );
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
