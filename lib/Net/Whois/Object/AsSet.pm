package Net::Whois::Object::AsSet;

use base qw/Net::Whois::Object/;

# From ripe-223 
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

An as-set object defines a set of aut-num objects. The attributes of
the as-set class are shown in Figure 1.2.2.  The "as-set:" attribute
defines the name of the set. It is an RPSL name that starts with
"as-". The "members:" attribute lists the members of the set.  The
"members:" attribute is a list of AS numbers, or other as-set names.

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

    return $self;
}

=head2 B<as_set( [$as_set])>

Accessor to the as_set attribute.
Accepts an optional as_set, always return the current as_set value.

=cut

sub as_set {
    my ( $self, $as_set ) = @_;
    $self->{as_set} = $as_set if defined $as_set;
    return $self->{as_set};
}

=head2 B<descr( [$descr] )>

Accessor to the descr attribute.
Accepts an optional descr to be added to the descr array, 
always return the current descr array.

=cut

sub descr {
    my ( $self, $descr ) = @_;
    push @{ $self->{descr} }, $descr if defined $descr;
    return \@{ $self->{descr} };
}

=head2 B<members( [$member] )>

Accessor to the members attribute.
Accepts an optional member to be added to the members array,
always return the current 'members' array.

=cut

sub members {
    my ( $self, $member ) = @_;
    push @{ $self->{members} }, $member if defined $member;
    return \@{ $self->{members} };
}

=head2 B<mbrs_by_ref( [$mbr] )>

Accessor to the mbrs_by_ref attribute.
Accepts an optional mbr to be added to the mbrs_by_ref array,
always return the current mbrs_by_ref array.

=cut

sub mbrs_by_ref {
    my ( $self, $mbr) = @_;
    push @{ $self->{mbrs_by_ref} }, $mbr if defined $mbr;
    return \@{ $self->{mbrs_by_ref} };
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

=head2 B<tech_c( [$tech_c] )>

Accessor to the tech_c attribute.
Accepts an optional tech_c to be added to the tech_c array,
always return the current tech_c array.

=cut

sub tech_c {
    my ( $self, $tech_c ) = @_;
    push @{ $self->{tech_c} }, $tech_c if defined $tech_c;
    return \@{ $self->{tech_c} };
}

=head2 B<admin_c( [$admin_c] )>

Accessor to the admin_c attribute.
Accepts an optional admin_c to be added to the admin_c array,
always return the current admin_c array.

=cut

sub admin_c {
    my ( $self, $admin_c ) = @_;
    push @{ $self->{admin_c} }, $admin_c if defined $admin_c;
    return \@{ $self->{admin_c} };
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

=head2 B<mnt_by( [$mnt] )>

Accessor to the mnt_by attribute.
Accepts an optional mnt to be added to the mnt_by array,
always return the current mnt_by array.

=cut

sub mnt_by {
    my ( $self, $mnt ) = @_;
    push @{ $self->{mnt_by} }, $mnt if defined $mnt;
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

1;
