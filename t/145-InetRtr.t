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

isa_ok $object, "Net::Whois::Object::InetRtr";

# Inherited method from Net::Whois::Object;
can_ok $object,

    # Constructor
    qw( new ),

    # OO Support
    qw( query_filter filtered_attributes displayed_attributes );

can_ok $object, qw( inet_rtr descr alias local_as ifaddr interface peer mp_peer
member_of remarks admin_c tech_c  notify mnt_by changed source );

ok( !$object->can('bogusmethod'), "No AUTOLOAD interference with Net::Whois::Object::InetRtr tests" );

is ($object->inet_rtr(),'RTR.EXAMPLE.COM','inet_rtr properly parsed');
$object->inet_rtr('RTR2.EXAMPLE.COM');
is ($object->inet_rtr(),'RTR2.EXAMPLE.COM','inet_rtr properly set');

is_deeply ($object->alias(),[ 'EDGE01.EXAMPLE.COM' ],'alias properly parsed');
$object->alias('EDGE02.EXAMPLE.COM');
is ($object->alias()->[1],'EDGE02.EXAMPLE.COM','alias properly added');

is_deeply ($object->descr(),[ 'Edge router for UniverseNet', 'Paris - France' ],'descr properly parsed');
$object->descr('Added descr');
is ($object->descr()->[2],'Added descr','descr properly added');

is ($object->local_as(),'AS1','local_as properly parsed');
$object->local_as('AS2');
is ($object->local_as(),'AS2','local properly set');

is_deeply ($object->ifaddr(),[ '147.45.0.17 masklen 32'],'ifaddr properly parsed');
$object->ifaddr('147.45.0.18 masklen 32');
is ($object->ifaddr()->[1],'147.45.0.18 masklen 32','ifaddr properly added');

is_deeply ($object->interface(),[ '147.45.0.17 masklen 32'],'interface properly parsed');
$object->interface('147.45.0.18 masklen 32');
is ($object->interface()->[1],'147.45.0.18 masklen 32','interface properly added');

is_deeply ($object->admin_c(),[ 'FR123-AP'],'admin_c properly parsed');
$object->admin_c('FR456-AP');
is ($object->admin_c()->[1],'FR456-AP','admin_c properly added');

is_deeply ($object->tech_c(),[ 'FR123-AP'],'tech_c properly parsed');
$object->tech_c('FR456-AP');
is ($object->tech_c()->[1],'FR456-AP','tech_c properly added');

is_deeply ($object->mnt_by(),[ 'MAINT-EXAMPLENET-AP'],'mnt_by properly parsed');
$object->mnt_by('MAINT2-EXAMPLENET-AP');
is ($object->mnt_by()->[1],'MAINT2-EXAMPLENET-AP','mnt_by properly added');

is_deeply ($object->notify(),[ 'watcher@example.com'],'notify properly parsed');
$object->notify('watcher2@example.com');
is ($object->notify()->[1],'watcher2@example.com','notify properly added');

is_deeply ($object->changed(),[ 'abc@examplenet.com 20101231'],'changed properly parsed');
$object->changed('abc@examplenet.com 20111231');
is ($object->changed()->[1],'abc@examplenet.com 20111231','changed properly added');

is_deeply ($object->member_of(),['AS2'],'member_of properly parsed');
$object->member_of('AS3');
is ($object->member_of()->[1],'AS3','member_of properly added');

is_deeply ($object->remarks(),[ 'No remarks'],'remarks properly parsed');
$object->remarks('Added remarks');
is ($object->remarks()->[1],'Added remarks','remarks properly added');

is ($object->source(),'RIPE','source properly parsed');
$object->source('APNIC');
is ($object->source(),'APNIC','source properly set');


__DATA__
inet-rtr:   RTR.EXAMPLE.COM
alias:      EDGE01.EXAMPLE.COM
descr:      Edge router for UniverseNet
descr:      Paris - France
local-as:   AS1
ifaddr:     147.45.0.17 masklen 32
interface:  147.45.0.17 masklen 32
admin-c:    FR123-AP
tech-c:     FR123-AP
mnt-by:     MAINT-EXAMPLENET-AP
notify:     watcher@example.com
changed:    abc@examplenet.com 20101231
member-of:  AS2
remarks:    No remarks
source:     RIPE

