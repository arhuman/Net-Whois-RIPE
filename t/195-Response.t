use strict;
use warnings;
use Test::More qw( no_plan );
use Test::Exception;

# synchronizes the {error,standard} output of this test.
use IO::Handle;
STDOUT->autoflush(1);
STDERR->autoflush(1);

our $class;
BEGIN { $class = 'Net::Whois::Object'; use_ok $class; }

my  @lines = <DATA>; 
my $object = (Net::Whois::Object->new(@lines))[0];

isa_ok $object, "Net::Whois::Object::Response";

# Inherited method from Net::Whois::Object;
can_ok $object,

    # Constructor
    qw( new ),

    # OO Support
    qw( filter filtered_attributes displayed_attributes );

can_ok $object, qw( response );

ok( !$object->can('bogusmethod'), "No AUTOLOAD interference with Net::Whois::Object::Response tests" );

is ($object->response(),'Response from server','response properly parsed');

__DATA__
%Response from server

