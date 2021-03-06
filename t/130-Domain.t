use strict;
use warnings;
use Test::More qw( no_plan );

# synchronizes the {error,standard} output of this test.
use IO::Handle;
STDOUT->autoflush(1);
STDERR->autoflush(1);

our $class;
BEGIN { $class = 'Net::Whois::Object::Domain'; use_ok $class; }

our %tested;

my @lines  = <DATA>;
our $object = ( Net::Whois::Object->new(@lines) )[0];

isa_ok $object, $class;

# Non-inherited methods
can_ok $object, qw( domain descr org admin_c tech_c zone_c nserver ds_rdata 
    remarks notify mnt_by source);

# Check if typed attributes are correct
can_ok $object, $object->attributes('mandatory');
can_ok $object, $object->attributes('optional');

# Test 'domain'
$tested{'domain'}++;
is( $object->domain(), 'somewhere.superdomain.com', 'domain properly parsed' );
$object->domain('somewhereelse.superdomain.com');
is( $object->domain(), 'somewhereelse.superdomain.com', 'domain properly set' );

# Test 'descr'
$tested{'descr'}++;
is_deeply( $object->descr(), ['Domain\'s description'], 'descr properly parsed' );
$object->descr('Added descr');
is( $object->descr()->[1], 'Added descr', 'descr properly added' );

# Test 'org'
$tested{'org'}++;
is_deeply( $object->org(), ['ORG-MISC01-RIPE'], 'org properly parsed' );
$object->org('ORG-MISC02-RIPE');
is( $object->org()->[1], 'ORG-MISC02-RIPE', 'org properly added' );

# Test 'admin_c'
$tested{'admin_c'}++;
is_deeply( $object->admin_c(), ['CPNY-ADM01'], 'admin_c properly parsed' );
$object->admin_c('Added admin_c');
is( $object->admin_c()->[1], 'Added admin_c', 'admin_c properly added' );

# Test 'tech_c'
$tested{'tech_c'}++;
is_deeply( $object->tech_c(), ['CPNY-TECH01'], 'tech_c properly parsed' );
$object->tech_c('Added tech_c');
is( $object->tech_c()->[1], 'Added tech_c', 'tech_c properly added' );

# Test 'zone_c'
$tested{'zone_c'}++;
is_deeply( $object->zone_c(), ['CPNY-ZONE'], 'zone_c properly parsed' );
$object->zone_c('Added zone_c');
is( $object->zone_c()->[1], 'Added zone_c', 'zone_c properly added' );

# Test 'nserver'
$tested{'nserver'}++;
is_deeply( $object->nserver(), [ 'NS1.SUPERDOMAIN.COM', 'NS2.SUPERDOMAIN.COM' ], 'nserver properly parsed' );
$object->nserver('Added nserver');
is( $object->nserver()->[2], 'Added nserver', 'nserver properly added' );

# Test 'ds_rdata'
$tested{'ds_rdata'}++;
is_deeply( $object->ds_rdata(), ['64431 5 1 278BF194C29A812B33935BB2517E17D1486210FA'], 'ds_rdata properly parsed' );
$object->ds_rdata('Added ds_rdata');
is( $object->ds_rdata()->[1], 'Added ds_rdata', 'ds_rdata properly added' );

# Test 'remarks'
$tested{'remarks'}++;
is_deeply( $object->remarks(), ['Nothing to say'], 'remarks properly parsed' );
$object->remarks('Added remarks');
is( $object->remarks()->[1], 'Added remarks', 'remarks properly added' );

# Test 'mnt_by'
$tested{'mnt_by'}++;
is_deeply( $object->mnt_by(), ['DOM-MAINT'], 'mnt_by properly parsed' );
$object->mnt_by('Added mnt_by');
is( $object->mnt_by()->[1], 'Added mnt_by', 'mnt_by properly added' );

# Test 'notify'
$tested{'notify'}++;
is_deeply( $object->notify(), ['watcher@somewhere.net'], 'notify properly parsed' );
$object->notify('Added notify');
is( $object->notify()->[1], 'Added notify', 'notify properly added' );

# Test 'source'
$tested{'source'}++;
is( $object->source(), 'RIPE # Filtered', 'source properly parsed' );
$object->source('APNIC');
is( $object->source(), 'APNIC', 'source properly set' );

# Common tests
do './t/common.pl';
ok( $tested{common_loaded}, "t/common.pl properly loaded" );
ok( !$@, "Can evaluate t/common.pl ($@)" );

__DATA__
domain:     somewhere.superdomain.com
descr:      Domain's description
org:        ORG-MISC01-RIPE
admin-c:    CPNY-ADM01
tech-c:     CPNY-TECH01
zone-c:     CPNY-ZONE
nserver:    NS1.SUPERDOMAIN.COM
nserver:    NS2.SUPERDOMAIN.COM
remarks:    Nothing to say
notify:     watcher@somewhere.net
mnt-by:     DOM-MAINT
ds-rdata:   64431 5 1 278BF194C29A812B33935BB2517E17D1486210FA
source:     RIPE # Filtered

