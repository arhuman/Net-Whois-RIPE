package Net::Whois::Object;

=head1 NAME

Net::Whois::Object - Object encapsulating RPSL data returned by Whois queries

=head1 SYNOPSIS

    use Net::Whois::RIPE;
    use Net::Whois::Object;

    my $whois = Net::Whois::RIPE->new( %options );
    $iterator = $whois->query( 'AS30781' );

    while (my $value = $iterator->value()) {
        my @lines = split '\n', $value;
        push @projects, Net::Whois::Object(@lines);
    }
    
    for my $object (@objects) {
        # process the Net::Whois::Object::xxx objects... 
    }

    ...

=head1 SUBROUTINES/METHODS

=head2 B<new( @lines )>

The constructor is a factory returning the appropriate Net/Whois/Object
based on the first attribute of the block.

=cut

sub new {
    my $class = shift;
    my @lines = @_;

    my ( $object, $block, @results );

    my ( $attribute, $value );
    for my $line (@lines) {

        if ( $line =~ /^(\S+):\s+(.*)/ ) {

            # Attribute line
            $attribute = $1;
            $value     = $2;

        }
        elsif ( $line =~ /^%(\S.*)/ ) {

            # Response line
            $block = 'response';
            $value = $1;

        }
        elsif ( $line =~ /^%\s(.*)/ ) {

            $block = 'comment' unless $block;

            # Comment line
            $attribute = "comment";
            $value     = $1;

        }
        elsif ( $line =~ /^[^%]\s*(.+)/ ) {

            # Continuation line
            $value = $1;

        }
        elsif ( $line =~ /^$/ ) {

            # Blank line
            push @results, $object;
            $attribute = undef;
            $block     = undef;
            $object    = undef;
            next;

        }

        # Normalize attribute to Perl's sub name standards
        $attribute =~ s/-/_/g if $attribute;

        # First attribute determine the block
        $block = $attribute unless $block;

        $object = _object_factory( $block, $value ) unless $object;

        if ($attribute) {
            $object->$attribute($value);
        }

    }
    return @results;
}

=head2 B<query_filter( $query_filter )>

Accessor to the query_filter attribute used to query_filter out objects.
Accepts an optional query_filter to be added to the query_filter array,
always return the current query_filter array.

=cut

sub query_filter {
    my ( $self, $query_filter ) = @_;
    push @{ $self->{query_filter} }, $query_filter if defined $query_filter;
    return @{ $self->{query_filter} };
}

=head2 B<hidden_attributes( $attribute )>

Accessor to the filtered_attributes attribute (attributes to be hidden)
Accepts an optional attribute to be added to the filtered_attributes array,
always return the current filtered_attributes array.

=cut

sub filtered_attributes {
    my ( $self, $filtered_attributes ) = @_;
    push @{ $self->{filtered_attributes} }, $filtered_attributes if defined $filtered_attributes;
    return @{ $self->{filtered_attributes} };
}

=head2 B<displayed_attributes( $attribute )>

Accessor to the displayed_attributes attribute which should be displayed.
Accepts an optional attribute to be added to the displayed_attributes array,
always return the current displayed_attributes array.

=cut

sub displayed_attributes {
    my ( $self, $displayed_attributes ) = @_;
    push @{ $self->{displayed_attributes} }, $displayed_attributes if defined $displayed_attributes;
    return @{ $self->{displayed_attributes} };
}

=begin UNDOCUMENTED

=head2 B<_object_factory( $type => $value )>

Private method. Shouldn't be used from other modules.

Simple factory, creating Net::Whois::Objet::XXXX from
the type passed as parameter.

=end UNDOCUMENTED

=cut

sub _object_factory {
    my $type  = shift;
    my $value = shift;

    my %class = ( as_block     => 'AsBlock',
                  as_set       => 'AsSet',
                  aut_num      => 'AutNum',
                  comment      => 'Information',
                  domain       => 'Domain',
                  filter_set   => 'FilterSet',
                  inet6num     => 'Inet6Num',
                  inetnum      => 'InetNum',
                  inet_rtr     => 'InetRtr',
                  irt          => 'Irt',
                  key_cert     => 'KeyCert',
                  limerick     => 'Limerick',
                  mntner       => 'Mntner',
                  organisation => 'Organisation',
                  organisation => 'Organisation',
                  peering_set  => 'PeeringSet',
                  person       => 'Person',
                  poem         => 'Poem',
                  poetic_form  => 'PoeticForm',
                  response     => 'Response',
                  role         => 'Role',
                  route6       => 'Route6',
                  route        => 'Route',
                  route_set    => 'RouteSet',
                  rtr_set      => 'RtrSet',
    );

    die "Unrecognized Object ($type first attribute)" unless $class{$type};

    my $class = "Net::Whois::Object::" . $class{$type};

    eval "require $class" or die "Can't require $class ($!)";

    return $class->new( $type => $value );

}

=head1 AUTHOR

Arnaud "Arhuman" Assad, C<< <arhuman at gmail.com> >>

=head1 ACKNOWLEDGEMENTS

Thanks to Jaguar Network for allowing me to work on this during some of my office
hours.

Thanks to Luis Motta Campos for his trust when allowing me to publish this
release.

=cut

1;
