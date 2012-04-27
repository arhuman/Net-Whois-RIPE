package Net::Whois::Object::Domain;

use base qw/Net::Whois::Object/;

# From ripe-223 
#
# domain:        [mandatory]  [single]     [primary/look-up key]
# descr:         [mandatory]  [multiple]   [ ]
# admin-c:       [mandatory]  [multiple]   [inverse key]
# tech-c:        [mandatory]  [multiple]   [inverse key]
# zone-c:        [mandatory]  [multiple]   [inverse key]
# nserver:       [optional]   [multiple]   [inverse key]
# sub-dom:       [optional]   [multiple]   [inverse key]
# dom-net:       [optional]   [multiple]   [ ]
# remarks:       [optional]   [multiple]   [ ]
# notify:        [optional]   [multiple]   [inverse key]
# mnt-by:        [optional]   [multiple]   [inverse key]
# mnt-lower:     [optional]   [multiple]   [inverse key]
# refer:         [optional]   [single]     [ ]
# changed:       [mandatory]  [multiple]   [ ]
# source:        [mandatory]  [single]     [ ]

=head1 NAME

Net::Whois::Object::Domain - an object representation of a RPSL Domain block

=head1 DESCRIPTION

The domain object represents Top Level Domain (TLD) and other domain
registrations.  It is also used for Reverse Delegations.  The domain
name is written in fully qualified format, without a trailing " . "

=head1 METHODS

=head2 new ( %options )

Constructor for the Net::Whois::Object::Domain class

=cut

sub new {
    my ( $class, %options ) = @_;

    my $self = bless {}, $class;

    for my $key ( keys %options ) {
        $self->$key( $options{$key} );
    }

    return $self;
}

=head2 B<domain( [$domain] )>

Accessor to the domain attribute.
Accepts an optional domain, always return the current domain.

=cut

sub domain {
    my ( $self, $domain ) = @_;
    $self->{domain} = $domain if defined $domain;
    return $self->{domain};
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

=head2 B<zone_c( [$contact] )>

Accessor to the zone_c attribute.
Accepts an optional contact to be added to the zone_c array,
always return the current zone_c array.

=cut

sub zone_c {
    my ( $self, $contact ) = @_;
    push @{ $self->{zone_c} }, $contact if defined $contact;
    return \@{ $self->{zone_c} };
}

=head2 B<nserver( [$server] )>

Accessor to the nserver attribute.
Accepts an optional server to be added to the nserver array,
always return the current nserver array.

=cut

sub nserver {
    my ( $self, $server ) = @_;
    push @{ $self->{nserver} }, $server if defined $server;
    return \@{ $self->{nserver} };
}

=head2 B<sub_dom( [$dom] )>

Accessor to the sub_dom attribute.
Accepts an optional dom to be added to the sub_dom array,
always return the current sub_dom array.

=cut

sub sub_dom {
    my ( $self, $dom ) = @_;
    push @{ $self->{sub_dom} }, $dom if defined $dom;
    return \@{ $self->{sub_dom} };
}

=head2 B<dom_net( [$dom_net] )>

Accessor to the dom_net attribute.
Accepts an optional dom_net value to be added to the dom_net array,
always return the current dom_net array.

=cut

sub dom_net {
    my ( $self, $dom_net ) = @_;
    push @{ $self->{dom_net} }, $dom_net if defined $dom_net;
    return \@{ $self->{dom_net} };
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

=cut

sub mnt_lower {
    my ( $self, $mnt_lower ) = @_;
    push @{ $self->{mnt_lower} }, $mnt_lower if defined $mnt_lower;
    return \@{ $self->{mnt_lower} };
}

=head2 B<refer( [$refer] )>

Accessor to the refer attribute.
Accepts an optional refer, always return the current refer.

=cut

sub refer {
    my ( $self, $refer ) = @_;
    $self->{refer} = $refer if defined $refer;
    return $self->{refer};
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
