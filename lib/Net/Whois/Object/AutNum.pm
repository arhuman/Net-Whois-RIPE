package Net::Whois::Object::AutNum;

use base qw/Net::Whois::Object/;

# From ripe-223 
#
# aut-num:       [mandatory]  [single]     [primary/look-up key]
# as-name:       [mandatory]  [single]     [ ]
# descr:         [mandatory]  [multiple]   [ ]
# member-of:     [optional]   [multiple]   [inverse key]
# import:        [optional]   [multiple]   [ ]
# export:        [optional]   [multiple]   [ ]
# default:       [optional]   [multiple]   [ ]
# remarks:       [optional]   [multiple]   [ ]
# admin-c:       [mandatory]  [multiple]   [inverse key]
# tech-c:        [mandatory]  [multiple]   [inverse key]
# cross-mnt:     [optional]   [multiple]   [inverse key]
# cross-nfy:     [optional]   [multiple]   [inverse key]
# notify:        [optional]   [multiple]   [inverse key]
# mnt-lower:     [optional]   [multiple]   [inverse key]
# mnt-routes:    [optional]   [multiple]   [inverse key]
# mnt-by:        [mandatory]  [multiple]   [inverse key]
# changed:       [mandatory]  [multiple]   [ ]
# source:        [mandatory]  [single]     [ ]

# Found into the Wild
# mp-import
# mp-export

=head1 NAME

Net::Whois::Object::AutNum - an object representation of a RPSL AutNum block

=head1 DESCRIPTION

An object of the aut-num class is a database representation of an
Autonomous System (AS), which is a group of IP networks operated by
one or more network operators that has a single and clearly defined
external routing policy.</SPAN>
Objects of this class are used to
specify routing policies. The attributes of the aut-num class are
shown in Figure 1.2.3. The value of the "aut-num:" attribute is the AS
number of the AS described by this object. The "as-name:" attribute is
a symbolic name (in RPSL name syntax) of the AS. The import, export
and default routing policies of the AS are specified using the
"import:", "export:" and "default:" attributes, respectively.

=head1 METHODS

=head2 new ( %options )

Constructor for the Net::Whois::Object::AutNum class

=cut

sub new {
    my ( $class, %options ) = @_;

    my $self = bless {}, $class;

    for my $key ( keys %options ) {
        $self->$key( $options{$key} );
    }

    return $self;
}

=head2 B<aut_num( [$aut_num] )>

Accessor to the aut_num attribute.
Accepts an optional aut_num, always return the current aut_num array.

=cut

sub aut_num {
    my ( $self, $aut_num ) = @_;
    $self->{aut_num} = $aut_num if defined $aut_num;
    return $self->{aut_num};
}

=head2 B<as_name( [$as_name] )>

Accessor to the as_name attribute.
Accepts an optional as_name, always return the current as_name array.

=cut

sub as_name {
    my ( $self, $as_name ) = @_;
    $self->{as_name} = $as_name if defined $as_name;
    return $self->{as_name};
}

=head2 B<descr( [$descr] )>

Accessor to the descr attribute.
Accepts an optional descr value to be added to the descr array, always return the current descr array.

=cut

sub descr {
    my ( $self, $descr ) = @_;
    push @{ $self->{descr} }, $descr if defined $descr;
    return \@{ $self->{descr} };
}

=head2 B<member_of( [$mbr_of] )>

Accessor to the member_of attribute.
Accepts an optional member_of value to be added to the member_of array,
always return the current member_of array.

=cut

sub member_of {
    my ( $self, $member_of ) = @_;
    push @{ $self->{member_of} }, $member_of if defined $member_of;
    return \@{ $self->{member_of} };
}

=head2 B<import( [$import] )>

Accessor to the import attribute.
Accepts an optional import line to be added to the import array,
always return the current import array.

=cut

sub import {
    my ( $self, $import ) = @_;
    push @{ $self->{import} }, $import if defined $import;
    return \@{ $self->{import} };
}

=head2 B<export( [$export] )>

Accessor to the export attribute.
Accepts an optional export line to be added to the export array,
always return the current export array.

=cut

sub export {
    my ( $self, $export ) = @_;
    push @{ $self->{export} }, $export if defined $export;
    return \@{ $self->{export} };
}

=head2 B<default( [$default] )>

Accessor to the default attribute.
Accepts an optional default value to be added to the default array,
always return the current default array.

=cut

sub default {
    my ( $self, $default ) = @_;
    push @{ $self->{default} }, $default if defined $default;
    return \@{ $self->{default} };
}

=head2 B<remarks( [$remark] )>

Accessor to the remarks attribute.
Accepts an optional remark to be added to the remarks array,
always return the current remarks array.

=cut

sub remarks {
    my ( $self, $remark ) = @_;
    push @{ $self->{remarks} }, $remark if defined $remark;
    return \@{ $self->{remarks} };
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

=head2 B<cross_mnt( [$mnt] )>

Accessor to the cross_mnt attribute.
Accepts an optional mnt to be added to the cross_mnt array,
always return the current cross_mnt array.

=cut

sub cross_mnt {
    my ( $self, $cross_mnt ) = @_;
    push @{ $self->{cross_mnt} }, $mnt if defined $mnt;
    return \@{ $self->{cross_mnt} };
}

=head2 B<cross_nfy( [$notify] )>

Accessor to the cross_nfy attribute.
Accepts an optional notify to be added to the cross_nfy array,
always return the current cross_nfy array.

=cut

sub cross_nfy {
    my ( $self, $notify ) = @_;
    push @{ $self->{cross_nfy} }, $notify if defined $notify;
    return \@{ $self->{cross_nfy} };
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

=head2 B<mnt_routes( [$mnt_routes] )>

Accessor to the mnt_routes attribute.
Accepts an optional mnt_routes value to be added to the mnt_routes array,
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

=head2 B<mp_import( [$mp_import] )>

Accessor to the mp_import attribute.
Accepts an optional mp_import line to be added to the mp_import array,
always return the current mp_import array.

=cut

sub mp_import {
    my ( $self, $mp_import ) = @_;
    push @{ $self->{mp_import} }, $mp_import if defined $mp_import;
    return \@{ $self->{mp_import} };
}

=head2 B<mp_export( [$mp_export] )>

Accessor to the mp_export attribute.
Accepts an optional mp_export line to be added to the mp_export array,
always return the current mp_export array.

=cut

sub mp_export {
    my ( $self, $mp_export ) = @_;
    push @{ $self->{mp_export} }, $mp_export if defined $mp_export;
    return \@{ $self->{mp_export} };
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

=head2 B<org( [$org] )>

Accessor to the org attribute.
Accepts an optional org, always return the current org.

=cut

sub org {
    my ( $self, $org ) = @_;
    $self->{org} = $org if defined $org;
    return $self->{org};
}

1;
