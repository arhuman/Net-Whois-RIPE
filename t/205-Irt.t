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

isa_ok $object, "Net::Whois::Object::Irt";

# Inherited method from Net::Whois::Object;
can_ok $object,

    # Constructor
    qw( new ),

    # OO Support
<<<<<<< HEAD
    qw( query_filter filtered_attributes displayed_attributes );
=======
    qw( filter filtered_attributes displayed_attributes );
>>>>>>> e4eb3dd... Add Irt and Route6 objects

can_ok $object, qw( irt phone fax_no e_mail abuse_mailbox signature encryption admin_c tech_c auth remarks irt_nfy notify mnt_by changed);

ok( !$object->can('bogusmethod'), "No AUTOLOAD interference with Net::Whois::Object::Irt tests" );

is ($object->irt(),'IRT-DEMO','irt properly parsed');
$object->irt('IRT-DEMO-MOD');
is ($object->irt(),'IRT-DEMO-MOD','irt properly set');

is_deeply ($object->phone(),[ '+33 102030405' ],'phone properly parsed');
$object->phone('+33 102030406');
is ($object->phone()->[1],'+33 102030406','phone properly added');

is_deeply ($object->fax_no(),[ '+33 102030405' ],'fax_no properly parsed');
$object->fax_no('+33 102030407');
is ($object->fax_no()->[1],'+33 102030407','fax_no properly added');

is_deeply ($object->abuse_mailbox(),[ 'abuse@demo.com' ],'abuse_mailbox properly parsed');
$object->abuse_mailbox('otherabuse@demo.com');
is ($object->abuse_mailbox()->[1],'otherabuse@demo.com','abuse_mailbox properly added');

is_deeply ($object->signature(),[ 'PGPKEY-F0F0F0F0' ],'signature properly parsed');
$object->signature('PGPKEY-F0F0F0FF');
is ($object->signature()->[1],'PGPKEY-F0F0F0FF','signature properly added');

is_deeply ($object->encryption(),[ 'PGPKEY-0F0F0F0F' ],'encryption properly parsed');
$object->encryption('PGPKEY-0F0F0FFF');
is ($object->encryption()->[1],'PGPKEY-0F0F0FFF','encryption properly added');

<<<<<<< HEAD
is_deeply ($object->org(),[ 'ORG-MISC01-RIPE' ],'org properly parsed');
$object->org('someone@elsewhere.com');
is ($object->org()->[1],'someone@elsewhere.com','org properly added');

=======
>>>>>>> e4eb3dd... Add Irt and Route6 objects
is_deeply ($object->remarks(),[ 'No remarks', '24/24 7/7',
        'https://www.demo.com' ],'remarks properly parsed');
$object->remarks('Added remarks');
is ($object->remarks()->[3],'Added remarks','remarks properly added');

is_deeply ($object->e_mail(),[ 'someone@demo.com' ],'e_mail properly parsed');
$object->e_mail('someone@elsewhere.com');
is ($object->e_mail()->[1],'someone@elsewhere.com','e_mail properly added');

is_deeply ($object->admin_c(),[ 'DC008-AP' ],'admin_c properly parsed');
$object->admin_c('DC008-AP2');
is ($object->admin_c()->[1],'DC008-AP2','admin_c properly added');

is_deeply ($object->tech_c(),[ 'DC007-AP' ],'tech_c properly parsed');
$object->tech_c('DC007-AP2');
is ($object->tech_c()->[1],'DC007-AP2','tech_c properly added');

is_deeply ($object->irt_nfy(),[ 'notify@demo.com' ],'irt_nfy properly parsed');
$object->irt_nfy('notify2@demo.com');
is ($object->irt_nfy()->[1],'notify2@demo.com','irt_nfy properly added');

is_deeply ($object->notify(),[ 'someone@demo.com' ],'notify properly parsed');
$object->notify('someone@elsewhere.com');
is ($object->notify()->[1],'someone@elsewhere.com','notify properly added');

is_deeply ($object->mnt_by(),[ 'MAINT-DEMO-COM' ],'mnt_by properly parsed');
$object->mnt_by('MAINT-DEMO-COM2');
is ($object->mnt_by()->[1],'MAINT-DEMO-COM2','mnt_by properly added');

is_deeply ($object->changed(),[ 'someone@demo.com 20120131' ],'changed properly parsed');
$object->changed('someone@demo.com 20120228');
is ($object->changed()->[1],'someone@demo.com 20120228','changed properly added');

is ($object->source(),'APNIC','source properly parsed');
$object->source('RIPE');
is ($object->source(),'RIPE','source properly set');

__DATA__
irt:            IRT-DEMO
address:        1 Rue de la Gare
address:        75001 Paris
address:        France
phone:          +33 102030405
fax-no:         +33 102030405
signature:      PGPKEY-F0F0F0F0
encryption:     PGPKEY-0F0F0F0F
<<<<<<< HEAD
org:            ORG-MISC01-RIPE
=======
>>>>>>> e4eb3dd... Add Irt and Route6 objects
remarks:        No remarks
irt-nfy:        notify@demo.com
mnt-by:         MAINT-DEMO-COM
abuse-mailbox:  abuse@demo.com
e-mail:         someone@demo.com
tech-c:         DC007-AP
admin-c:        DC008-AP
auth:           PGPKEY-F004BF15
remarks:        24/24 7/7
remarks:        https://www.demo.com
changed:        someone@demo.com 20120131
notify:         someone@demo.com
source:         APNIC


