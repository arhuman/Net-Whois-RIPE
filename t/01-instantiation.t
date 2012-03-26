#!perl
use strict;
use warnings;
use Test::More tests => 4;
use Test::Exception;

our $class;

BEGIN { $class = 'Net::Whois::RIPE'; use_ok $class }

can_ok $class, 'new';

my $whois;
lives_ok { $whois = $class->new; } " $class can create default instances.";
isa_ok $whois, $class;
