package Net::Whois::Object::Route;

use base qw/Net::Whois::Object/;

# http://www.ripe.net/data-tools/support/documentation/update-ref-manual#section-25
# http://www.apnic.net/apnic-info/whois_search/using-whois/guide/route
#
# route:         [mandatory]  [single]     [primary/look-up key]
# descr:         [mandatory]  [multiple]   [ ]
# origin:        [mandatory]  [single]     [primary/inverse key]
# holes:         [optional]   [multiple]   [ ]
# member-of:     [optional]   [multiple]   [inverse key]
# inject:        [optional]   [multiple]   [ ]
# aggr-mtd:      [optional]   [single]     [ ]
# aggr-bndry:    [optional]   [single]     [ ]
# export-comps:  [optional]   [single]     [ ]
# components:    [optional]   [single]     [ ]
# remarks:       [optional]   [multiple]   [ ]
# cross-mnt:     [optional]   [multiple]   [inverse key]
# cross-nfy:     [optional]   [multiple]   [inverse key]
# notify:        [optional]   [multiple]   [inverse key]
# mnt-lower:     [optional]   [multiple]   [inverse key]
# mnt-routes:    [optional]   [multiple]   [inverse key]
# mnt-by:        [mandatory]  [multiple]   [inverse key]
# changed:       [mandatory]  [multiple]   [ ]
# source:        [mandatory]  [single]     [ ]

# From http://www.apnic.net/apnic-info/whois_search/using-whois/guide/route
# country:       [optional]   [single]     [ ]
#

=head1 NAME

Net::Whois::Object::Route - an object representation of the RPSL Route block

=head1 DESCRIPTION

Route objects are used to help configure your network's routers. Route objects, 
in combination with the aut-num and other related objects, can be used to
describe your IPv4 routing policy in a compact form. This can help your
network identify routing policy errors and omissions more easily than by
reading long configuration files.



=head1 METHODS

=head2 B<new( %options )>

Constructor for the Net::Whois::Object::Route class

=cut

sub new {
    my ( $class, %options ) = @_;

    my $self = bless {}, $class;

    for my $key ( keys %options ) {
        $self->$key( $options{$key} );
    }
    
    $self->attributes( 'mandatory', [ 'route', 'origin', 'descr', 'mnt_by', 'changed', 'source' ] );
    $self->attributes( 'optionnal', [ 'holes', 'member_of', 'inject', 'aggr_mtd', 'aggr_bndry', 'export_comps', 'components', 'remarks', 'cross_mnt', 'cross_nfy', 'notify', 'mnt_lower', 'mnt_routes' ] );
    $self->attributes( 'single', [ 'route', 'origin', 'aggr_mtd', 'aggr_bndry', 'export_comps', 'components', 'source' ] );
    $self->attributes( 'multiple', [ 'descr', 'mnt_by', 'changed', 'holes', 'member_of', 'inject', 'remarks', 'cross_mnt', 'cross_nfy', 'notify', 'mnt_lower', 'mnt_routes' ] );

    return $self;
}

=head2 B<route( [$route] )>

Accessor to the route attribute.
Accepts an optional route, always return the current route.

=cut

sub route {
    my ( $self, $route ) = @_;

    return $self->_single_attribute_setget('route', $route);
}

=head2 B<descr( [$descr] )>

Accessor to the descr attribute.
Accepts an optional descr line to be added to the descr array,
always return the current descr array.

=cut

sub descr {
    my ( $self, $descr ) = @_;

    return $self->_multiple_attribute_setget('descr', $descr);
}

=head2 B<origin( [$origin] )>

Accessor to the origin attribute.
Accepts an optional origin, always return the current origin.

=cut

sub origin {
    my ( $self, $origin ) = @_;

    return $self->_single_attribute_setget('origin', $origin);
}

=head2 B<holes( [$hole] )>

Accessor to the holes attribute.
Accepts an optional hole to be added to the holes array,
always return the current holes array.

=cut

sub holes {
    my ( $self, $hole ) = @_;

    return $self->_multiple_attribute_setget('holes', $hole);
}

=head2 B<member_of( [$member_of] )>

Accessor to the member_of attribute.
Accepts an optional member_of value to be added to the member_of array,
always return the current member_of array.

=cut

sub member_of {
    my ( $self, $member_of ) = @_;

    return $self->_multiple_attribute_setget('member_of', $member_of);
}

=head2 B<inject( [$inject] )>

Accessor to the inject attribute.
Accepts an optional inject value to be added to the inject array,
always return the current inject array.

=cut

sub inject {
    my ( $self, $inject ) = @_;

    return $self->_multiple_attribute_setget('inject', $inject);
}

=head2 B<aggr_mtd( [$aggr_mtd] )>

Accessor to the aggr_mtd attribute.
Accepts an optional aggr_mtd value to be added to the aggr_mtd array,
always return the current aggr_mtd.

=cut

sub aggr_mtd {
    my ( $self, $aggr_mtd ) = @_;

    return $self->_single_attribute_setget('aggr_mtd', $aggr_mtd);
}

=head2 B<aggr_bndry( [$aggr_bndry] )>

Accessor to the aggr_bndry attribute.
Accepts an optional aggr_bndry value to be added to the aggr_bndry array,
always return the current aggr_bndry.

=cut

sub aggr_bndry {
    my ( $self, $aggr_bndry ) = @_;

    return $self->_single_attribute_setget('aggr_bndry', $aggr_bndry);
}

=head2 B<export_comps( [$export_comp] )>

Accessor to the export_comps attribute.
Accepts an optional export_comp value to be added the export_comps array,
always return the current export_comps.

=cut

sub export_comps {
    my ( $self, $export_comp ) = @_;

    return $self->_single_attribute_setget('export_comps', $export_comp);
}

=head2 B<components( [$component] )>

Accessor to the components attribute.
Accepts an optional component to be added to the components array,
always return the current components.

=cut

sub components {
    my ( $self, $components ) = @_;

    return $self->_single_attribute_setget('components', $components);
}

=head2 B<remarks( [$remark] )>

Accessor to the remarks attribute.
Accepts an optional remark to be added to the remarks array,
always return the current 'remarks' array.

=cut

sub remarks {
    my ( $self, $remark ) = @_;

    return $self->_multiple_attribute_setget('remarks', $remark);
}

=head2 B<cross_mnt( [$cross_mnt] )>

Accessor to the cross_mnt attribute.
Accepts an optional cross_mnt value to be added to the cross_mnt array,
always return the current cross_mnt array.

=cut

sub cross_mnt {
    my ( $self, $cross_mnt ) = @_;

    return $self->_multiple_attribute_setget('cross_mnt', $cross_mnt);
}

=head2 B<cross_nfy( [$cross_nfy] )>

Accessor to the cross_nfy attribute.
Accepts an optional cross_nfy value to be added to the cross_nfy array,
always return the current cross_nfy array.

=cut

sub cross_nfy {
    my ( $self, $cross_nfy ) = @_;

    return $self->_multiple_attribute_setget('cross_nfy', $cross_nfy);
}

=head2 B<notify( [$notify] )>

Accessor to the notify attribute.
Accepts an optional notify value to be added to the notify array,
always return the current notify array.

=cut

sub notify {
    my ( $self, $notify ) = @_;

    return $self->_multiple_attribute_setget('notify', $notify);
}

=head2 B<mnt_lower( [$mnt_lower] )>

Accessor to the mnt_lower attribute.
Accepts an optional mnt_lower value to be added to the mnt_lower array,
always return the current mnt_lower array.

=cut

sub mnt_lower {
    my ( $self, $mnt_lower ) = @_;

    return $self->_multiple_attribute_setget('mnt_lower', $mnt_lower);
}

=head2 B<mnt_routes( [$mnt_route] )>

Accessor to the mnt_routes attribute.
Accepts an optional mnt_route to be added to the mnt_routes array,
always return the current mnt_routes array.

=cut

sub mnt_routes {
    my ( $self, $mnt_routes ) = @_;

    return $self->_multiple_attribute_setget('mnt_routes', $mnt_routes);
}

=head2 B<mnt_by( [$mnt_by] )>

Accessor to the mnt_by attribute.
Accepts an optional mnt_by value to be added to the mnt_by array,
always return the current mnt_by array.

=cut

sub mnt_by {
    my ( $self, $mnt_by ) = @_;

    return $self->_multiple_attribute_setget('mnt_by', $mnt_by);
}

=head2 B<changed( [$changed] )>

Accessor to the changed attribute.
Accepts an optional changed value to be added to the changed array,
always return the current changed array.

=cut

sub changed {
    my ( $self, $changed ) = @_;

    return $self->_multiple_attribute_setget('changed', $changed);
}

=head2 B<source( [$source] )>

Accessor to the source attribute.
Accepts an optional source, always return the current source.

=cut

sub source {
    my ( $self, $source ) = @_;

    return $self->_single_attribute_setget('source', $source);
}

=head2 B<country( [$country] )>

Accessor to the country attribute.
Accepts an optional country, always return the current country.
Two letter ISO 3166 code of the country or economy where the admin-c is based.

Please use UPPERCASE letters.

=cut

sub country {
    my ( $self, $country ) = @_;

    return $self->_single_attribute_setget('country', $country);
}

1;
