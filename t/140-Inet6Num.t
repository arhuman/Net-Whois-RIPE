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

isa_ok $object, "Net::Whois::Object::Inet6Num";

# Inherited method from Net::Whois::Object;
can_ok $object,

    # Constructor
    qw( new ),

    # OO Support
    qw( query_filter filtered_attributes displayed_attributes );

can_ok $object, qw( inet6num netname descr country admin_c tech_c 
status remarks notify mnt_by mnt_lower mnt_routes mnt_domains mnt_irt changed source);

can_ok $object, qw( mnt_irt );

ok( !$object->can('bogusmethod'), "No AUTOLOAD interference with Net::Whois::Object::Inet6Num tests" );

is ($object->inet6num(),'2001:0DB8::/32','inet6num properly parsed');
$object->inet6num('2001:0DB9::/32');
is ($object->inet6num(),'2001:0DB9::/32','inet6num properly set');

is ($object->netname(),'EXAMPLENET-AP','netname properly parsed');
$object->netname('EXAMPLE2');
is ($object->netname(),'EXAMPLE2','netname properly set');

is_deeply ($object->descr(),[ 'Example net Pty Ltd' ],'descr properly parsed');
$object->descr('Added descr');
is ($object->descr()->[1],'Added descr','descr properly added');

is_deeply ($object->country(),['AP'],'country properly parsed');
$object->country('FR');
is ($object->country()->[1],'FR','country properly added');

is_deeply ($object->admin_c(),[ 'FR123-AP' ],'admin_c properly parsed');
$object->admin_c('FR345-APF');
is ($object->admin_c()->[1],'FR345-APF','admin_c properly added');

is_deeply ($object->tech_c(),[ 'FR123-AP' ],'tech_c properly parsed');
$object->tech_c('FR345-AP');
is ($object->tech_c()->[1],'FR345-AP','tech_c properly added');

is ($object->status(),'ALLOCATED PORTABLE','status properly parsed');
$object->status('ASSIGNED PORTABLE');
is ($object->status(),'ASSIGNED PORTABLE','status properly set');

is_deeply ($object->notify(),[ 'abc@examplenet.com' ],'notify properly parsed');
$object->notify('efg@examplenet.com');
is ($object->notify()->[1],'efg@examplenet.com','notify properly added');

is_deeply ($object->mnt_by(),[ 'MAINT-EXAMPLENET-AP' ],'mnt_by properly parsed');
$object->mnt_by('MAINT2-EXAMPLENET-AP');
is ($object->mnt_by()->[1],'MAINT2-EXAMPLENET-AP','mnt_by properly added');

is_deeply ($object->mnt_lower(),[ 'MAINT-EXAMPLENET-AP' ],'mnt_lower properly parsed');
$object->mnt_lower('MAINT2-EXAMPLENET-AP');
is ($object->mnt_lower()->[1],'MAINT2-EXAMPLENET-AP','mnt_lower properly added');

is_deeply ($object->mnt_routes(),[ 'MAINT-EXAMPLENET-AP' ],'mnt_routes properly parsed');
$object->mnt_routes('MAINT2-EXAMPLENET-AP');
is ($object->mnt_routes()->[1],'MAINT2-EXAMPLENET-AP','mnt_routes properly added');

is_deeply ($object->mnt_irt(),[ 'IRT-EXAMPLENET-AP' ],'mnt_irt properly parsed');
$object->mnt_irt('MAINT2-EXAMPLENET-AP');
is ($object->mnt_irt()->[1],'MAINT2-EXAMPLENET-AP','mnt_irt properly added');

is_deeply ($object->mnt_domains(),[ 'MAINT-EXAMPLENET-AP' ],'mnt_domains properly parsed');
$object->mnt_domains('MAINT2-EXAMPLENET-AP');
is ($object->mnt_domains()->[1],'MAINT2-EXAMPLENET-AP','mnt_domains properly added');

is_deeply ($object->changed(),[ 'abc@examplenet.com 20101231' ],'changed properly parsed');
$object->changed('abc@examplenet.com 20121231');
is ($object->changed()->[1],'abc@examplenet.com 20121231','changed properly added');

is ($object->source(),'APNIC','source properly parsed');
$object->source('RIPE');
is ($object->source(),'RIPE','source properly set');


__DATA__
inet6num:    2001:0DB8::/32
netname:     EXAMPLENET-AP
descr:       Example net Pty Ltd
country:     AP
admin-c:     FR123-AP
tech-c:      FR123-AP
status:      ALLOCATED PORTABLE
notify:      abc@examplenet.com
mnt-by:      MAINT-EXAMPLENET-AP
mnt-lower:   MAINT-EXAMPLENET-AP
mnt-routes:  MAINT-EXAMPLENET-AP
mnt-domains: MAINT-EXAMPLENET-AP
mnt-irt:     IRT-EXAMPLENET-AP
changed:     abc@examplenet.com 20101231
source:      APNIC

