package Net::Whois::Object::Inet6Num;

use base qw/Net::Whois::Object/;

# http://www.ripe.net/data-tools/support/documentation/update-ref-manual#section-12
# http://www.apnic.net/apnic-info/whois_search/using-whois/guide/inet6num
#
# inet6num:      [mandatory]  [single]     [primary/look-up key]
# netname:       [mandatory]  [single]     [lookup key]
# descr:         [mandatory]  [multiple]   [ ]
# country:       [mandatory]  [multiple]   [ ]
# org:           [optional]   [single]     [inverse key]
# admin-c:       [mandatory]  [multiple]   [inverse key]
# tech-c:        [mandatory]  [multiple]   [inverse key]
# status:        [mandatory]  [single]     [ ]
# remarks:       [optional]   [multiple]   [ ]
# notify:        [optional]   [multiple]   [inverse key]
# mnt-by:        [mandatory]  [multiple]   [inverse key]
# mnt-lower:     [optional]   [multiple]   [inverse key]
# mnt-routes:    [optional]   [multiple]   [inverse key]
# mnt-domains:   [optional]   [multiple]   [inverse key]
# mnt-irt:       [optional]   [multiple]   [inverse key]
# changed:       [mandatory]  [multiple]   [ ]
# source:        [mandatory]  [single]     [ ]

# From  http://www.apnic.net/apnic-info/whois_search/using-whois/guide/inet6num?view=text-only
#
# mnt-irt:       [mandatory]  [single]     [inverse key]

=head1 NAME

Net::Whois::Object::Inet6Num - an object representation of a RPSL Inet6Num block

=head1 DESCRIPTION

An inet6num object contains information on allocations and assignments
of IPv6 address space.

=head1 METHODS

=head2 new ( %options )

Constructor for the Net::Whois::Object::Inet6Num class

=cut

sub new {
    my ( $class, %options ) = @_;

    my $self = bless {}, $class;

    for my $key ( keys %options ) {
        $self->$key( $options{$key} );
    }

    return $self;
}

=head2 B<inet6num( [$inet6num] )>

Accessor to the inet6num attribute.
Accepts an optional inet6num value, always return the current inet6num value.

The inet6num attribute specifies a range of IPv6 addresses that the
inet6num object presents. The range may be a single address.

Addresses can only be expressed in prefix notation

=cut

sub inet6num {
    my ( $self, $inet6num ) = @_;
    $self->{inet6num} = $inet6num if defined $inet6num;
    return $self->{inet6num};
}

=head2 B<netname( [$netname] )>

Accessor to the netname attribute.
Accepts an optional netname, always return the current netname.

The netname attribute is the name of a range of IP address space. It is
recommended that the same netname is used for any set of assignment ranges
used for a common purpose.

=cut

sub netname {
    my ( $self, $netname ) = @_;
    $self->{netname} = $netname if defined $netname;
    return $self->{netname};
}

=head2 B<descr( [$descr] )>

Accessor to the descr attribute.
Accepts an optional descr to be added to the descr array,
always return the current descr array.

Description of the organization allocated or assigned the address space shown
in the inet6num.

=cut

sub descr {
    my ( $self, $descr ) = @_;
    push @{ $self->{descr} }, $descr if defined $descr;
    return \@{ $self->{descr} };
}

=head2 B<country( [$country] )>

Accessor to the country attribute.
Accepts an optional country to be added to the country array,
always return the current country array.

The country attribute identifies the country. It has never been specified
if this is the country where the addresses are used, where the issuing
organisation is based or some transit country in between. There are no rules
defined for this attribute. It cannot therefore be used in any reliable way to
map IP addresses to countries.

=cut

sub country {
    my ( $self, $country ) = @_;
    push @{ $self->{country} }, $country if defined $country;
    return \@{ $self->{country} };
}

=head2 B<org( [$org] )>

Accessor to the org attribute.
Accepts an optional org, always return the current org.

Only a single value for the org attribute is allowed in the inet6num
object. This is to ensure only one organisation is responsible for this
resource.

=cut

sub org {
    my ( $self, $org ) = @_;
    $self->{org} = $org if defined $org;
    return $self->{org};
}

=head2 B<admin_c( [$contact] )>

Accessor to the admin_c attribute.
Accepts an optional contact to be added to the admin_c array,
always return the current admin_c array.

The NIC-handle of an on-site contact 'person' object. As more than one person
often fulfills a role function, there may be more than one admin_c listed.

An administrative contact (admin_c) must be someone who is physically
located at the site of the network.

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

The NIC-handle of a technical contact 'person' or 'role' object.  As more than
one person often fulfills a role function, there may be more than one tech_c
listed.

A technical contact (tech_c) must be a person responsible for the
day-to-day operation of the network, but does not need to be

=cut

sub tech_c {
    my ( $self, $tech_c ) = @_;
    push @{ $self->{tech_c} }, $tech_c if defined $tech_c;
    return \@{ $self->{tech_c} };
}

=head2 B<status( [$status] )>

Accessor to the status attribute.
Accepts an optional status, always return the current status.

The status attribute indicates where the address range represented by an
inet6num object sits in a hierarchy and how it is used.

Status can have one of these values:

=over 4

=item ALLOCATED-BY-RIR

=item ALLOCATED-BY-LIR

=item ASSIGNED

=item ASSIGNED ANYCAST

=item ASSIGNED PI

=back

=cut

sub status {
    my ( $self, $status ) = @_;
    $self->{status} = $status if defined $status;
    return $self->{status};
}

=head2 B<remarks( [$remark] )>

Accessor to the remarks attribute.
Accepts an optional remark to be added to the remarks array,
always return the current remarks array.

General remarks. May include a URL or instructions on where to send abuse
complaints.

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

The email address to which notifications of changes to this object should be
sent.

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

=head2 B<mnt_lower( [$mnt_lower] )>

Accessor to the mnt_lower attribute.
Accepts an optional mnt_lower value to be added to the mnt_lower array,
always return the current mnt_lower array.

Sometimes there is a hierarchy of maintainers. In these cases, mnt-lower is
used as well as 'mnt-by.'

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

The identifier of a registered Mntner object used to control the creation of
Route6 objects associated with the address range specified by the Inet6num
object.

=cut

sub mnt_routes {
    my ( $self, $mnt_route ) = @_;
    push @{ $self->{mnt_routes} }, $mnt_route if defined $mnt_route;
    return \@{ $self->{mnt_routes} };
}

=head2 B<mnt_domains( [$mnt_route] )>

Accessor to the mnt_domains attribute.
Accepts an optional mnt_route to be added to the mnt_domains array,
always return the current mnt_domains array.

The identifier of a registered Mntner object used to control the creation of
Domain objects associated with the address range specified by the Inet6num
object.

=cut

sub mnt_domains {
    my ( $self, $mnt_route ) = @_;
    push @{ $self->{mnt_domains} }, $mnt_route if defined $mnt_route;
    return \@{ $self->{mnt_domains} };
}

=head2 B<mnt_irt( [$mnt_irt] )>

Accessor to the mnt_irt attribute.
Accepts an optional mnt_irt to be added to the mnt_irt array,
always return the current mnt_irt array.

mnt_irt references an Irt object. Authorisation is required from the Irt
object to be able to add this reference.

=cut

sub mnt_irt {
    my ( $self, $mnt_irt ) = @_;
    push @{ $self->{mnt_irt} }, $mnt_irt if defined $mnt_irt;
    return \@{ $self->{mnt_irt} };
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
    push @{ $self->{changed} }, $changed if defined $changed;
    return \@{ $self->{changed} };
}

=head2 B<source( [$source] )>

Accessor to the source attribute.
Accepts an optional source, always return the current source.

The database where the object is registered.

=cut

sub source {
    my ( $self, $source ) = @_;
    $self->{source} = $source if defined $source;
    return $self->{source};
}

1;
