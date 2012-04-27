package Net::Whois::Object::KeyCert;

use base qw/Net::Whois::Object/;

# From ripe-223 
#
# key-cert:      [mandatory]  [single]     [primary/look-up key]
# method:        [generated]  [single]     [ ]
# owner:         [generated]  [multiple]   [ ]
# fingerpr:      [generated]  [single]     [ ]
# certif:        [mandatory]  [multiple]   [ ]
# remarks:       [optional]   [multiple]   [ ]
# notify:        [optional]   [multiple]   [inverse key]
# mnt-by:        [mandatory]  [multiple]   [inverse key]
# changed:       [mandatory]  [multiple]   [ ]
# source:        [mandatory]  [single]     [ ]

=head1 NAME

Net::Whois::Object::KeyCert - an object representation of the RPSL KeyCert block

=head1 DESCRIPTION

A key-cert object is a database public key certificate that is stored
on the server and may be used with a mntner object for authentication
when performing updates. Currently only PGP keys are supported.

=head1 METHODS

=head2 B<new( %options )>

Constructor for the Net::Whois::Object::InetRtr class

=cut

sub new {
    my ( $class, %options ) = @_;

    my $self = bless {}, $class;

    for my $key ( keys %options ) {
        $self->$key( $options{$key} );
    }

    return $self;
}

=head2 B<key_cert( [$key_cert] )>

Accessor to the key_cert attribute.
Accepts an optional key_cert value, always return the current key_cert value.

=cut

sub key_cert {
    my ( $self, $key_cert ) = @_;
    $self->{key_cert} = $key_cert if defined $key_cert;
    return $self->{key_cert};
}

=head2 B<method( [$method] )>

Accessor to the method attribute.
Accepts an optional method, always return the current method value.

=cut

sub method {
    my ( $self, $method ) = @_;
    $self->{method} = $method if defined $method;
    return $self->{method};
}

=head2 B<owner( [$owner] )>

Accessor to the owner attribute.
Accepts an optional owner to be added to the owner array,
always return the current owner array.

=cut

sub owner {
    my ( $self, $owner ) = @_;
    push @{ $self->{owner} }, $owner if defined $owner;
    return \@{ $self->{owner} };
}

=head2 B<fingerpr( [$fingerpr] )>

Accessor to the fingerpr attribute.
Accepts an optional fingerpr, always return the current fingerpr.

=cut

sub fingerpr {
    my ( $self, $fingerpr ) = @_;
    $self->{fingerpr} = $fingerpr if defined $fingerpr;
    return $self->{fingerpr};
}

=head2 B<certif( [$certif] )>

Accessor to the certif attribute.
Accepts an optional certif to be added to the certif array,
always return the current certif array.

=cut

sub certif {
    my ( $self, $certif ) = @_;
    push @{ $self->{certif} }, $certif if defined $certif;
    return \@{ $self->{certif} };
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
