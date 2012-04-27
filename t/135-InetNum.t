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

isa_ok $object, "Net::Whois::Object::InetNum";

# Inherited method from Net::Whois::Object;
can_ok $object,

    # Constructor
    qw( new ),

    # OO Support
    qw( filter filtered_attributes displayed_attributes );

can_ok $object, qw( inetnum netname descr country admin_c tech_c rev_srv
status remarks notify mnt_by mnt_lower mnt_routes changed source);

can_ok $object, qw( mnt_irt );

ok( !$object->can('bogusmethod'), "No AUTOLOAD interference with Net::Whois::Object::InetNum tests" );

is ($object->inetnum(),'10.0.0.1 - 10.0.0.255','inetnum properly parsed');
$object->inetnum('192.168.0.1 - 192.168.0.255');
is ($object->inetnum(),'192.168.0.1 - 192.168.0.255','inetnum properly set');

is_deeply ($object->remarks(),[ 'No remarks' ],'remarks properly parsed');
$object->remarks('Added remarks');
is ($object->remarks()->[1],'Added remarks','remarks properly added');

is ($object->netname(),'EXAMPLENET-AP','netname properly parsed');
$object->netname('EXAMPLENET-AP2');
is ($object->netname(),'EXAMPLENET-AP2','netname properly set');

is_deeply ($object->descr(),[ 'Example net Pty Ltd' ],'descr properly parsed');
$object->descr('Added descr');
is ($object->descr()->[1],'Added descr','descr properly added');

is_deeply ($object->country(),['FR'],'country properly parsed');
$object->country('Added country');
is ($object->country()->[1],'Added country','country properly added');

is_deeply ($object->admin_c(),[ 'FR123-AP' ],'admin_c properly parsed');
$object->admin_c('Added admin_c');
is ($object->admin_c()->[1],'Added admin_c','admin_c properly added');

is_deeply ($object->tech_c(),[ 'FR123-AP' ],'tech_c properly parsed');
$object->tech_c('Added tech_c');
is ($object->tech_c()->[1],'Added tech_c','tech_c properly added');

is ($object->status(),'ASSIGNED NON-PORTABLE','status properly parsed');
$object->status('AS1 - AS2');
is ($object->status(),'AS1 - AS2','status properly set');

is_deeply ($object->mnt_by(),[ 'MAINT-EXAMPLENET-AP' ],'mnt_by properly parsed');
$object->mnt_by('MAINT2');
is ($object->mnt_by()->[1],'MAINT2','mnt_by properly added');

is_deeply ($object->mnt_irt(),[ 'IRT-EXAMPLENET-AP' ],'mnt_irt properly parsed');
$object->mnt_irt('IRT-EX2');
is ($object->mnt_irt()->[1],'IRT-EX2','mnt_irt properly added');

is_deeply ($object->changed(),[ 'abc@examplenet.com 20101231' ],'changed properly parsed');
$object->changed('Added changed');
is ($object->changed()->[1],'Added changed','changed properly added');

is ($object->source(),'RIPE','source properly parsed');
$object->source('APNIC');
is ($object->source(),'APNIC','source properly set');

is_deeply ($object->rev_srv(),['NS1.EXAMPLE.NET'],'rev_srv properly parsed');
$object->rev_srv('NS2.EXAMPLE.NET');
is ($object->rev_srv()->[1],'NS2.EXAMPLE.NET','rev_srv properly added');

is_deeply ($object->notify(),['watcher@somewhere.net'],'notify properly parsed');
$object->notify('otherwatcher@somewhere.net');
is ($object->notify()->[1],'otherwatcher@somewhere.net','notify properly added');

is_deeply ($object->mnt_routes(),['RTES-MNT'],'mnt_routes properly parsed');
$object->mnt_routes('RTES-MNT2');
is ($object->mnt_routes()->[1],'RTES-MNT2','mnt_routes properly added');

__DATA__
inetnum:        10.0.0.1 - 10.0.0.255
remarks:        No remarks
netname:        EXAMPLENET-AP
descr:          Example net Pty Ltd
country:        FR
admin-c:        FR123-AP
tech-c:         FR123-AP
status:         ASSIGNED NON-PORTABLE
mnt-by:         MAINT-EXAMPLENET-AP
mnt-irt:        IRT-EXAMPLENET-AP
changed:        abc@examplenet.com 20101231
source:         RIPE
rev-srv:        NS1.EXAMPLE.NET
notify:         watcher@somewhere.net
mnt-routes:     RTES-MNT

