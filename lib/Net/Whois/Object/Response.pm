package Net::Whois::Object::Response;

use base qw/Net::Whois::Object/;

=head1 NAME

Net::Whois::Object::Response - an object representation of the RPSL Response block

=head1 DESCRIPTION

output starting with the % sign is either a server response code or
an informational message. A comment contains a white space after the
% sign, while server messages start right after the % sign. Please
see Appendix A2 "RIPE Database response codes and messages" for more
information.

* An empty line ("\n\n") is an object delimiter. 

* Two empty lines mean the end of a server response. 

=head1 METHODS

=head2 B<new( %options )>

Constructor for the Net::Whois::Object::Response class

=cut

sub new {
    my ( $class, @options ) = @_;

    my $self = bless {}, $class;
    $self->_init(@options);

    $self->attributes( 'mandatory', ['response'] );
    $self->attributes( 'optional', ['comment'] );
    $self->attributes( 'single',    ['response'] );
    $self->attributes( 'multiple',  ['comment'] );

    return $self;
}

=head2 B<response( [$response] )>

Accessor to the response attribute.
Accepts an optional response, always return the current response.

=cut

sub response {
    my ( $self, $response ) = @_;

    return $self->_single_attribute_setget( 'response', $response );
}

=head2 B<comment( [$comment] )>

Accessor to the comment attribute.
Accepts an optional comment, always return the current comment.

=cut

sub comment {
    my ( $self, $comment ) = @_;

    return $self->_multiple_attribute_setget( 'comment', $comment );
}

1;
