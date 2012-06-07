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

isa_ok $object, "Net::Whois::Object::FilterSet";

# Inherited method from Net::Whois::Object;
can_ok $object,

    # Constructor
    qw( new ),

    # OO Support
    qw( query_filter filtered_attributes displayed_attributes );

can_ok $object, qw( filter_set descr filter mp_filter remarks org tech_c
admin_c notify mnt_by mnt_lower changed source);

ok( !$object->can('bogusmethod'), "No AUTOLOAD interference with Net::Whois::Object::FilterSet tests" );

is ($object->filter_set(),'FLTR-EXAMPLE','filter_set properly parsed');
$object->filter_set('FLTR-EXAMPLE2');
is ($object->filter_set(),'FLTR-EXAMPLE2','filter_set properly set');

is_deeply ($object->descr(),[ 'Filter local community routes' ],'descr properly parsed');
$object->descr('Added descr');
is ($object->descr()->[1],'Added descr','descr properly added');

is ($object->filter(), '(AS1 or fltr-foo) and <AS2>','filter properly parsed');
$object->filter('other filter');
is ($object->filter(),'other filter','filter properly modified');

is($object->mp_filter(), '{ 192.0.2.0/24, 2001:0DB8::/32 }','mp_filter properly parsed');
$object->mp_filter('other filter v6');
is ($object->mp_filter(), 'other filter v6','mp_filter properly added');

is_deeply ($object->remarks(),[ 'No remarks' ],'remarks properly parsed');
$object->remarks('Added remarks');
is ($object->remarks()->[1],'Added remarks','remarks properly added');

is_deeply ($object->tech_c(),[ 'TECH-CTCT' ],'tech_c properly parsed');
$object->tech_c('TECH2-CTCT');
is ($object->tech_c()->[1],'TECH2-CTCT','tech_c properly added');

is_deeply ($object->admin_c(),[ 'ADM-CTCT' ],'admin_c properly parsed');
$object->admin_c('ADM2-CTCT');
is ($object->admin_c()->[1],'ADM2-CTCT','admin_c properly added');

is_deeply ($object->notify(),[ 'watcher@somewhere.com' ],'notify properly parsed');
$object->notify('watcher@elsewhere.com');
is ($object->notify()->[1],'watcher@elsewhere.com','notify properly added');

is_deeply ($object->mnt_by(),[ 'MAINT-EXAMPLECOM' ],'mnt_by properly parsed');
$object->mnt_by('MAINT2-EXAMPLECOM');
is ($object->mnt_by()->[1],'MAINT2-EXAMPLECOM','mnt_by properly added');

is_deeply ($object->mnt_lower(),[ 'MAINT-EXAMPLECOM' ],'mnt_lower properly parsed');
$object->mnt_lower('MAINT2-EXAMPLECOM');
is ($object->mnt_lower()->[1],'MAINT2-EXAMPLECOM','mnt_lower properly added');

is_deeply ($object->changed(),[ 'abc@somewhere.com 20120131' ],'changed properly parsed');
$object->changed('abc@somewhere.com 20120228');
is ($object->changed()->[1],'abc@somewhere.com 20120228','changed properly added');

is ($object->source(),'RIPE','source properly parsed');
$object->source('APNIC');
is ($object->source(),'APNIC','source properly set');

__DATA__
filter-set:     FLTR-EXAMPLE
descr:          Filter local community routes
filter:         (AS1 or fltr-foo) and <AS2>
mp-filter:      { 192.0.2.0/24, 2001:0DB8::/32 }
remarks:        No remarks
tech-c:         TECH-CTCT
admin-c:        ADM-CTCT
notify:         watcher@somewhere.com
mnt-by:         MAINT-EXAMPLECOM
mnt-lower:      MAINT-EXAMPLECOM
changed:        abc@somewhere.com 20120131
source:         RIPE

