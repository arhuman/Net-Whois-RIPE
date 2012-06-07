package Net::Whois::Object::Poem;

use base qw/Net::Whois::Object/;

# http://www.ripe.net/data-tools/support/documentation/update-ref-manual#section-21
# APNIC ??
#
# poem:         [mandatory]     [single]    [primary/look-up key]
# descr:        [optional]      [multiple]  [ ]
# form:         [mandatory]     [single]    [inverse key]
# text:         [mandatory]     [multiple]  [ ]
# admin-c:      [mandatory]     [multiple]  [inverse key]
# author:       [mandatory]     [multiple]  [inverse key]
# remarks:      [optional]      [multiple]  [ ]
# notify:       [optional]      [multiple]  [inverse key]
# mnt-by:       [mandatory]     [multiple]  [inverse key]
# changed:      [mandatory]     [multiple]  [ ]
# source:       [mandatory]     [single]    [ ]
#

=head1 NAME

Net::Whois::Object::Poem - an object representation of the RPSL Poem block

=head1 DESCRIPTION

The poem object contains a poem that is submitted by a user. This object is
included in the database to show that engineers do have a sense of humour.

=head1 METHODS

=head2 B<new( %options )>

Constructor for the Net::Whois::Object::Poem class

=cut

sub new {
    my ( $class, %options ) = @_;

    my $self = bless {}, $class;

    for my $key ( keys %options ) {
        $self->$key( $options{$key} );
    }

    return $self;
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

=head2 B<text( [$text] )>

Accessor to the text attribute.
Accepts an optional text line to be added to the text array,
always return the current text array.

=cut

sub text {
    my ( $self, $text ) = @_;
    push @{ $self->{text} }, $text if defined $text;
    return \@{ $self->{text} };
}

=head2 B<admin_c( [$contact] )>

Accessor to the admin_c attribute.
Accepts an optional contact to be added to the admin_c array,
always return the current admin_c array.

=cut

sub admin_c {
    my ( $self, $admin_c ) = @_;
    push @{ $self->{admin_c} }, $admin_c if defined $admin_c;
    return \@{ $self->{admin_c} };
}

=head2 B<author( [$author] )>

Accessor to the author attribute.
Accepts an optional author to be added to the author array,
always return the current author array.

=cut

sub author {
    my ( $self, $author ) = @_;
    push @{ $self->{author} }, $author if defined $author;
    return \@{ $self->{author} };
}

=head2 B<remarks( [$remark] )>

Accessor to the remarks attribute.
Accepts an optional remark to be added to the remarks array,
always return the current remarks array.

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

=head2 B<form( [$form] )>

Accessor to the form attribute.
Accepts an optional form, always return the current form.
This attribute specifies the identifier of a registered poem type.

=cut

sub form {
    my ( $self, $form ) = @_;
    $self->{form} = $form if defined $form;
    return $self->{form};
}

=head2 B<poem( [$poem] )>

Accessor to the poem attribute.
Accepts an optional poem, always return the current poem.

=cut

sub poem {
    my ( $self, $poem ) = @_;
    $self->{poem} = $poem if defined $poem;
    return $self->{poem};
}

1;
