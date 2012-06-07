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

isa_ok $object, "Net::Whois::Object::Route6";

# Inherited method from Net::Whois::Object;
can_ok $object,

    # Constructor
    qw( new ),

    # OO Support
    qw( query_filter filtered_attributes displayed_attributes );

can_ok $object, qw( route6 descr country origin org holes member_of inject aggr_mtd
aggr_bndry export_comps components remarks notify mnt_lower mnt_routes mnt_by
changed source);

ok( !$object->can('bogusmethod'), "No AUTOLOAD interference with Net::Whois::Object::Route6 tests" );

is ($object->route6(),'2001:0DB8::/32','route properly parsed');
$object->route6('2001:0DB8::0001/48');
is ($object->route6(),'2001:0DB8::0001/48','route properly set');

is_deeply ($object->descr(),[ 'route object for 192.168.1.0/24' ],'descr properly parsed');
$object->descr('Added descr');
is ($object->descr()->[1],'Added descr','descr properly added');

is ($object->country(),'FR','country properly parsed');
$object->country('GB');
is ($object->country(),'GB','country properly set');

is ($object->origin(),'AS1234','origin properly parsed');
$object->origin('AS12');
is ($object->origin(),'AS12','origin properly set');

my $orgs = $object->org();
is ($orgs->[0],'ORG-MISC01-RIPE','org properly parsed');
$orgs = $object->org('ORG-MOD');
is ($orgs->[0],'ORG-MISC01-RIPE','org array preserved');
is ($orgs->[1],'ORG-MOD','org properly added');

is_deeply ($object->holes(),[ '192.168.1.23' ],'holes properly parsed');
$object->holes('192.168.1.123');
is ($object->holes()->[1],'192.168.1.123','holes properly added');

is_deeply ($object->member_of(),[ 'RTES-SET01' ],'member_of properly parsed');
$object->member_of('RTES-SET02');
is ($object->member_of()->[1],'RTES-SET02','member_of properly added');

is_deeply ($object->inject(),[ 'RTR01' ],'inject properly parsed');
$object->inject('RTR02');
is ($object->inject()->[1],'RTR02','inject properly added');

is ($object->aggr_mtd(),'AAAAAAA','aggr_mtd properly parsed');
$object->aggr_mtd('ABABABAB');
is ($object->aggr_mtd(),'ABABABAB','aggr_mtd properly set');

is ($object->aggr_bndry(),'BBBBBBB','aggr_bndry properly parsed');
$object->aggr_bndry('BCBCBCBCBC');
is ($object->aggr_bndry(),'BCBCBCBCBC','aggr_bndry properly added');

is ($object->export_comps(),'CCCCCCC','export_comps properly parsed');
$object->export_comps('CDCDCDCDCD');
is ($object->export_comps(),'CDCDCDCDCD','export_comps properly added');

is ($object->components(),'DDDDDDD','components properly parsed');
$object->components('DEDEDEDEDE');
is ($object->components(),'DEDEDEDEDE','components properly added');

is_deeply ($object->remarks(),[ 'No remark' ],'remarks properly parsed');
$object->remarks('Added remarks');
is ($object->remarks()->[1],'Added remarks','remarks properly added');

is_deeply ($object->notify(),[ 'watcher@somewhere.com' ],'notify properly parsed');
$object->notify('watcher2@somewhere.com');
is ($object->notify()->[1],'watcher2@somewhere.com','notify properly added');

is_deeply ($object->mnt_by(),[ 'MAINT-EXAMPLECOM' ],'mnt_by properly parsed');
$object->mnt_by('MAINT2-EXAMPLECOM');
is ($object->mnt_by()->[1],'MAINT2-EXAMPLECOM','mnt_by properly added');

is_deeply ($object->mnt_lower(),[ 'MAINT-EXAMPLECOM' ],'mnt_lower properly parsed');
$object->mnt_lower('MAINT2-EXAMPLECOM');
is ($object->mnt_lower()->[1],'MAINT2-EXAMPLECOM','mnt_lower properly added');

is_deeply ($object->mnt_routes(),[ 'MAINT-EXAMPLECOM' ],'mnt_routes properly parsed');
$object->mnt_routes('MAINT2-EXAMPLECOM');
is ($object->mnt_routes()->[1],'MAINT2-EXAMPLECOM','mnt_routes properly added');

is_deeply ($object->changed(),[ 'abc@somewhere.com 20120131' ],'changed properly parsed');
$object->changed('abc@somewhere.com 20120228');
is ($object->changed()->[1],'abc@somewhere.com 20120228','changed properly added');

is ($object->source(),'RIPE','source properly parsed');
$object->source('APNIC');
is ($object->source(),'APNIC','source properly set');

__DATA__
route6:         2001:0DB8::/32
descr:          route object for 192.168.1.0/24
country:        FR
origin:         AS1234
org:            ORG-MISC01-RIPE
holes:          192.168.1.23
member_of:      RTES-SET01
inject:         RTR01
aggr_mtd:       AAAAAAA
aggr_bndry:     BBBBBBB
export_comps:   CCCCCCC
components:     DDDDDDD
remarks:        No remark
notify:         watcher@somewhere.com
mnt-by:         MAINT-EXAMPLECOM
mnt-lower:      MAINT-EXAMPLECOM
mnt-routes:     MAINT-EXAMPLECOM
changed:        abc@somewhere.com 20120131
source:         RIPE


