package Net::Whois::Object::Route6;

use base qw/Net::Whois::Object/;

# http://www.ripe.net/data-tools/support/documentation/update-ref-manual#section-24
# http://www.apnic.net/apnic-info/whois_search/using-whois/guide/route6
#
# route6:        [mandatory]  [single]     [primary/look-up key]
# descr:         [mandatory]  [multiple]   [ ]
# origin:        [mandatory]  [single]     [primary/inverse key]
# holes:         [optional]   [multiple]   [ ]
# org:           [optional]   [multiple]   [inverse key]
# member-of:     [optional]   [multiple]   [ ]
# inject:        [optional]   [multiple]   [ ]
# aggr-mtd:      [optional]   [single]     [ ]
# aggr-bndry:    [optional]   [single]     [ ]
# export-comps:  [optional]   [single]     [ ]
# components:    [optional]   [single]     [ ]
# remarks:       [optional]   [multiple]   [ ]
# notify:        [optional]   [multiple]   [inverse key]
# mnt-lower:     [optional]   [multiple]   [inverse key]
# mnt-routes:    [optional]   [multiple]   [inverse key]
# mnt-by:        [mandatory]  [multiple]   [inverse key]
# changed:       [mandatory]  [multiple]   [ ]
# source:        [mandatory]  [single]     [ ]

# From http://www.apnic.net/apnic-info/whois_search/using-whois/guide/route6
# country:       [optional]   [single]     [ ]
#

=head1 NAME

Net::Whois::Object::Route6 - an object representation of the RPSL Route6 block

=head1 DESCRIPTION

Route6 objects are used to help configure your network's routers. Route6 objects,
in combination with the aut-num and other related objects, can be used to
describe your IPv6 routing policy in a compact form. This can help your
network identify routing policy errors and omissions more easily than by
reading long configuration files.

=head1 METHODS

=head2 B<new( %options )>

Constructor for the Net::Whois::Object::Route6 class

=cut

sub new {
    my ( $class, %options ) = @_;

    my $self = bless {}, $class;

    for my $key ( keys %options ) {
        $self->$key( $options{$key} );
    }

    return $self;
}

=head2 B<route6( [$route6] )>

Accessor to the route6 attribute.
Accepts an optional route6, always return the current route.

=cut

sub route6 {
    my ( $self, $route6 ) = @_;
    $self->{route6} = $route6 if defined $route6;
    return $self->{route6};
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

=head2 B<origin( [$origin] )>

Accessor to the origin attribute.
Accepts an optional origin, always return the current origin.

=cut

sub origin {
    my ( $self, $origin ) = @_;
    $self->{origin} = $origin if defined $origin;
    return $self->{origin};
}

=head2 B<org( [$org] )>

Accessor to the org attribute.
Accepts an optional org to be added to the org array,
always return the current org array.

=cut

sub org {
    my ( $self, $org ) = @_;
    push @{ $self->{org} }, $org if defined $org;
    return \@{ $self->{org} };
}

=head2 B<holes( [$hole] )>

Accessor to the holes attribute.
Accepts an optional hole to be added to the holes array,
always return the current holes array.

=cut

sub holes {
    my ( $self, $hole ) = @_;
    push @{ $self->{holes} }, $hole if defined $hole;
    return \@{ $self->{holes} };
}

=head2 B<member_of( [$member_of] )>

Accessor to the member_of attribute.
Accepts an optional member_of value to be added to the member_of array,
always return the current member_of array.

=cut

sub member_of {
    my ( $self, $member_of ) = @_;
    push @{ $self->{member_of} }, $member_of if defined $member_of;
    return \@{ $self->{member_of} };
}

=head2 B<inject( [$inject] )>

Accessor to the inject attribute.
Accepts an optional inject value to be added to the inject array,
always return the current inject array.

=cut

sub inject {
    my ( $self, $inject ) = @_;
    push @{ $self->{inject} }, $inject if defined $inject;
    return \@{ $self->{inject} };
}

=head2 B<aggr_mtd( [$aggr_mtd] )>

Accessor to the aggr_mtd attribute.
Accepts an optional aggr_mtd value to be added to the aggr_mtd array,
always return the current aggr_mtd.

=cut

sub aggr_mtd {
    my ( $self, $aggr_mtd ) = @_;
    $self->{aggr_mtd} = $aggr_mtd if defined $aggr_mtd;
    return $self->{aggr_mtd};
}

=head2 B<aggr_bndry( [$aggr_bndry] )>

Accessor to the aggr_bndry attribute.
Accepts an optional aggr_bndry value to be added to the aggr_bndry array,
always return the current aggr_bndry.

=cut

sub aggr_bndry {
    my ( $self, $aggr_bndry ) = @_;
    $self->{aggr_bndry} = $aggr_bndry if defined $aggr_bndry;
    return $self->{aggr_bndry};
}

=head2 B<export_comps( [$export_comp] )>

Accessor to the export_comps attribute.
Accepts an optional export_comp value to be added the export_comps array,
always return the current export_comps.

=cut

sub export_comps {
    my ( $self, $export_comp ) = @_;
    $self->{export_comps} = $export_comp if defined $export_comp;
    return $self->{export_comps};
}

=head2 B<components( [$component] )>

Accessor to the components attribute.
Accepts an optional component to be added to the components array,
always return the current components.

=cut

sub components {
    my ( $self, $components ) = @_;
    $self->{components} = $components if defined $components;
    return $self->{components};
}

=head2 B<remarks( [$remark] )>

Accessor to the remarks attribute.
Accepts an optional remark to be added to the remarks array,
always return the current 'remarks' array.

=cut

sub remarks {
    my ( $self, $remark ) = @_;
    push @{ $self->{remarks} }, $remark if defined $remark;
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

=head2 B<mnt_lower( [$mnt_lower] )>

Accessor to the mnt_lower attribute.
Accepts an optional mnt_lower value to be added to the mnt_lower array,
always return the current mnt_lower array.

=cut

sub mnt_lower {
    my ( $self, $mnt_lower ) = @_;
    push @{ $self->{mnt_lower} }, $mnt_lower if defined $mnt_lower;
    return \@{ $self->{mnt_lower} };
}

=head2 B<mnt_routes( [$mnt_route] )>

Accessor to the mnt_routes attribute.
Accepts an optional mnt_route to be added to the mnt_routes array,
always return the current mnt_routes array.

=cut

sub mnt_routes {
    my ( $self, $mnt_routes ) = @_;
    push @{ $self->{mnt_routes} }, $mnt_routes if defined $mnt_routes;
    return \@{ $self->{mnt_routes} };
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

=head2 B<country( [$country] )>

Accessor to the country attribute.
Accepts an optional country, always return the current country.
Two letter ISO 3166 code of the country or economy where the admin-c is based.

Please use UPPERCASE letters.

=cut

sub country {
    my ( $self, $country ) = @_;
    $self->{country} = $country if defined $country;
    return $self->{country};
}

1;
