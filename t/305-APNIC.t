use strict;
use warnings;

use Test::More qw(no_plan);

use_ok 'Net::Whois::Generic';

my $c = Net::Whois::Generic->new( disconnected => 1, unfiltered => 1 );
isa_ok $c, 'Net::Whois::Generic';

my $org;
eval { ($org) = $c->query( 'MAINT-APNIC-AP', { type => 'role' } ) };
ok !$@, qq{Client performs queries without dying $@};
isa_ok $org, 'Net::Whois::Object::Role::APNIC';

my $inetnum;
my @o;
eval { @o = $c->query('101.0.0.0/8') };
ok !$@, qq{Client performs queries without dying $@};
for my $o (@o) {
    my $type = ref $o;
    ok( $type =~ /(APNIC|Information)/, "Object " . $o->class . " returned" );
}
