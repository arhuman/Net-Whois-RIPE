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

isa_ok $object, "Net::Whois::Object::Mntner";

# Inherited method from Net::Whois::Object;
can_ok $object,

    # Constructor
    qw( new ),

    # OO Support
    qw( filter filtered_attributes displayed_attributes );

can_ok $object, qw( mntner descr country admin_c tech_c upd_to mnt_nfy auth
auth_override remarks notify abuse_mailbox mnt_by referral_by changed source);

ok( !$object->can('bogusmethod'), "No AUTOLOAD interference with Net::Whois::Object::Mntner tests" );

is ($object->mntner(),'MAINT01-EXAMPLECOM','mntner properly parsed');
$object->mntner('MAINT02-EXAMPLECOM');
is ($object->mntner(),'MAINT02-EXAMPLECOM','mntner properly set');

is_deeply ($object->descr(),[ 'Maintainer for Example company' ],'descr properly parsed');
$object->descr('Added descr');
is ($object->descr()->[1],'Added descr','descr properly added');

is ($object->country(),'FR','country properly parsed');
$object->country('ZH');
is ($object->country(),'ZH','country properly set');

is_deeply ($object->admin_c(),[ 'FR123-AP' ],'admin_c properly parsed');
$object->admin_c('FR456-AP');
is ($object->admin_c()->[1],'FR456-AP','admin_c properly added');

is_deeply ($object->tech_c(),[ 'FR123-AP' ],'tech_c properly parsed');
$object->tech_c('FR456-AP');
is ($object->tech_c()->[1],'FR456-AP','tech_c properly added');

is_deeply ($object->upd_to(),[ 'abc@somewhere.com' ],'upd_to properly parsed');
$object->upd_to('def@somewhere.com');
is ($object->upd_to()->[1],'def@somewhere.com','upd_to properly added');

is_deeply ($object->mnt_nfy(),[ 'abc@somewhere.com' ],'mnt_nfy properly parsed');
$object->mnt_nfy('def@somewhere.com');
is ($object->mnt_nfy()->[1],'def@somewhere.com','mnt_nfy properly added');

is_deeply ($object->auth(),['PGPKEY-78BBB10F'],'auth properly parsed');
$object->auth('PGPKEY-78BBB101');
is ($object->auth()->[1],'PGPKEY-78BBB101','auth properly added');

is_deeply ($object->notify(),[ 'watcher@somewhere.com' ],'notify properly parsed');
$object->notify('watcher2@somewhere.com');
is ($object->notify()->[1],'watcher2@somewhere.com','notify properly added');

is_deeply ($object->abuse_mailbox(),[ 'abuse@somewhere.com' ],'abuse_mailbox properly parsed');
$object->abuse_mailbox('abuse2@somewhere.com');
is ($object->abuse_mailbox()->[1],'abuse2@somewhere.com','abuse_mailbox properly added');

is_deeply ($object->mnt_by(),[ 'MAINT-EXAMPLENETCOM' ],'mnt_by properly parsed');
$object->mnt_by('MAINT2-EXAMPLENETCOM');
is ($object->mnt_by()->[1],'MAINT2-EXAMPLENETCOM','mnt_by properly added');

is ($object->referral_by(), 'RIPE-HM' ,'referral_by properly parsed');
$object->referral_by('RIPE-HM2');
is ($object->referral_by(),'RIPE-HM2','reberral_by properly set');

is_deeply ($object->changed(),[ 'abc@somewhere.com 20120131' ],'changeD properly parsed');
$object->changed('abc@somewhere.com 20110131');
is ($object->changed()->[1],'abc@somewhere.com 20110131','changed properly added');

is ($object->source(),'RIPE','source properly parsed');
$object->source('APNIC');
is ($object->source(),'APNIC','source properly set');

__DATA__
mntner:         MAINT01-EXAMPLECOM
descr:          Maintainer for Example company
country:        FR
admin-c:        FR123-AP
tech-c:         FR123-AP
upd-to:         abc@somewhere.com
mnt-nfy:        abc@somewhere.com
auth:           PGPKEY-78BBB10F
notify:         watcher@somewhere.com
abuse-mailbox:  abuse@somewhere.com
mnt-by:         MAINT-EXAMPLENETCOM
referral-by:    RIPE-HM
changed:        abc@somewhere.com 20120131
source:         RIPE


