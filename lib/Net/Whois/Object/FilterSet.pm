package Net::Whois::Object::FilterSet;

use base qw/Net::Whois::Object/;

# http://www.ripe.net/data-tools/support/documentation/update-ref-manual#section-11
# http://www.apnic.net/apnic-info/whois_search/using-whois/guide/filter-set
#
# filter-set:    [mandatory]  [single]     [primary/look-up key]
# descr:         [mandatory]  [multiple]   [ ]
# filter:        [mandatory]  [single]     [ ]
# mp-filter:     [mandatory]  [single]     [ ]
# remarks:       [optional]   [multiple]   [ ]
# org:           [optional]   [multiple]   [inverse key]
# tech-c:        [mandatory]  [multiple]   [inverse key]
# admin-c:       [mandatory]  [multiple]   [inverse key]
# notify:        [optional]   [multiple]   [inverse key]
# mnt-by:        [mandatory]  [multiple]   [inverse key]
# mnt-lower:     [optional]   [multiple]   [inverse key]
# changed:       [mandatory]  [multiple]   [ ]
# source:        [mandatory]  [single]     [ ]

=head1 NAME

Net::Whois::Object::FilterSet - an object representation of a RPSL FilterSet block

=head1 DESCRIPTION

A FilterSet object defines a set of routes that match the criteria that you
specify in your 'filter' – in other words it filters out routes that you do
not want to see.

=head1 METHODS

=head2 new ( %options )

Constructor for the Net::Whois::Object::FilterSet class

=cut

sub new {
    my ( $class, %options ) = @_;

    my $self = bless {}, $class;

    for my $key ( keys %options ) {
        $self->$key( $options{$key} );
    }

    return $self;
}

=head2 B<filter_set( [$filter_set] )>

Accessor to the filter_set attribute.
Accepts an optional filter_set value, always return the current filter_set value.

The filter_set attribute defines the name of the filter. It is an RPSL
name that starts with "fltr-".

The name of a filter_set object can be hierarchical:

A hierarchical filter_set name is a sequence of filter_set names and AS
Numbers separated by colons. At least one component of the name must be an
actual filter_set name (i.e. start with "fltr-"). All the set name
components of a hierarchical filter-name have to be filter_set names.

=cut

sub filter_set {
    my ( $self, $filter_set ) = @_;
    if ($filter_set and $filter_set !~/^fltr-/i) {
        warn "Incorrect FilterSet's name ($filter_set) : Should start with
        'FLTR-'";
    }
    $self->{filter_set} = $filter_set if defined $filter_set;
    return $self->{filter_set};
}

=head2 B<descr( [$descr] )>

Accessor to the descr attribute.
Accepts an optional descr value to be added to the descr array,
always return the current descr array.

A short description related to the object's purpose.

=cut

sub descr {
    my ( $self, $descr ) = @_;
    push @{ $self->{descr} }, $descr if defined $descr;
    return \@{ $self->{descr} };
}

=head2 B<filter( [$filter] )>

Accessor to the filter attribute.
Accepts an optional filter value, always return the current filter.

The filter attribute defines the policy filter of the set.

A policy filter is a logical expression which, when applied to a
set of routes, returns a subset of these routes – the ones that
you have said you want to see.

=cut

sub filter {
    my ( $self, $filter ) = @_;
    $self->{filter} = $filter if defined $filter;
    return $self->{filter};
}

=head2 B<mp_filter( [$mp_filter] )>

Accessor to the mp_filter attribute.
Accepts an optional mp_filter value, always return the current mp_filter.

Logical expression which when applied to a set of IPv4 or IPv6 routes returns
a subset of these routes.

=cut

sub mp_filter {
    my ( $self, $mp_filter ) = @_;
    $self->{mp_filter} = $mp_filter if defined $mp_filter;
    return $self->{mp_filter};
}

=head2 B<remarks( [$remark] )>

Accessor to the remarks attribute.
Accepts an optional remark to be added to the remarks array,
always return the current remarks array.

General remarks. May include a URL or email address.

=cut

sub remarks {
    my ( $self, $remark ) = @_;
    push @{ $self->{remarks} }, $remark if defined $remark;
    return \@{ $self->{remarks} };
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
physically located at the site of the network.

=cut

sub tech_c {
    my ( $self, $contact ) = @_;
    push @{ $self->{tech_c} }, $contact if defined $contact;
    return \@{ $self->{tech_c} };
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

=head2 B<org( [$org] )>

Accessor to the org attribute.
Accepts an optional org value to be added to the org array,
always return the current org array.

The organisation responsible for this FilterSet object.

=cut

sub org {
    my ( $self, $org ) = @_;
    push @{ $self->{org} }, $org if defined $org;
    return \@{ $self->{org} };
}

=head2 B<notify( [$notify] )>

Accessor to the notify attribute.
Accepts an optional notify value to be added to the notify array,
always return the current notify array.

The email address of who last updated the database object and the date it
occurred.

Every time a change is made to a database object, this attribute will show
the email address of the person who made those changes.
Please use the address format specified in RFC 822 - Standard for
the Format of ARPA Internet Text Message and provide the date
format using one of the following two formats: YYYYMMDD or YYMMDD.

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

Lists a registered 'mntner' used to authorize and authenticate changes to this
object.

When the database details are protected by a Mntner object, then
only persons with access to the security information of that Mntner
object will be able to change details.

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

Sometimes there is a hierarchy of maintainers. In these cases, mnt_lower is
used as well as mnt_by.

=cut

sub mnt_lower {
    my ( $self, $mnt_lower ) = @_;
    push @{ $self->{mnt_lower} }, $mnt_lower if defined $mnt_lower;
    return \@{ $self->{mnt_lower} };
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
