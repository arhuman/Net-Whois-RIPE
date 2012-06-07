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

isa_ok $object, "Net::Whois::Object::Organisation";

# Inherited method from Net::Whois::Object;
can_ok $object,

    # Constructor
    qw( new ),

    # OO Support
    qw( query_filter filtered_attributes displayed_attributes );

can_ok $object, qw( organisation org_name org_type descr remarks address phone
e_mail fax_no org admin_c tech_c ref_nfy mnt_ref notify mnt_by changed source);

ok( !$object->can('bogusmethod'), "No AUTOLOAD interference with Net::Whois::Object::Organisation tests" );

is ($object->organisation(),'AUTO-1','organisation properly parsed');
$object->organisation('AUTO-2');
is ($object->organisation(),'AUTO-2','organisation properly set');

is ($object->org_name(),'The name of the organisation','org_name properly parsed');
$object->org_name('Organisation\'s name');
is ($object->org_name(),'Organisation\'s name','name properly set');

is ($object->org_type(),'OTHER','org_type properly parsed');
$object->org_type('IANA');
is ($object->org_type(),'IANA','org_type properly set');

is_deeply ($object->remarks(),[ 'This is a dummy organisation object.', 'Used for testing' ],'remarks properly parsed');
$object->remarks('Added remarks');
is ($object->remarks()->[2],'Added remarks','remarks properly added');

is_deeply ($object->address(),[ '2 Rue de la Gare', '75001 Paris', 'France' ],'address properly parsed');
$object->address('Added address');
is ($object->address()->[3],'Added address','address properly added');

is_deeply ($object->phone(),[ '+33 1 75 75 75 01' ],'phone properly parsed');
$object->phone('+33 1 75 75 75 02');
is ($object->phone()->[1],'+33 1 75 75 75 02','phone properly added');

is_deeply ($object->fax_no(),[ '+33 1 75 75 75 91' ],'fax_no properly parsed');
$object->fax_no('+33 1 75 75 75 92');
is ($object->fax_no()->[1],'+33 1 75 75 75 92','fax_no properly added');

is_deeply ($object->e_mail(),[ 'someone@somewhere.com' ],'e_mail properly parsed');
$object->e_mail('someone@elsewhere.com');
is ($object->e_mail()->[1],'someone@elsewhere.com','e_mail properly added');

is_deeply ($object->admin_c(),[ 'CPNY-ADM' ],'admin_c properly parsed');
$object->admin_c('CPNY-ADM2');
is ($object->admin_c()->[1],'CPNY-ADM2','admin_c properly added');

is_deeply ($object->tech_c(),[ 'CPNY-TCH' ],'tech_c properly parsed');
$object->tech_c('CPNY-TCH2');
is ($object->tech_c()->[1],'CPNY-TCH2','tech_c properly added');

is_deeply ($object->ref_nfy(),[ 'someone@somewhere.com' ],'ref_nfy properly parsed');
$object->ref_nfy('someone@elsewhere.com');
is ($object->ref_nfy()->[1],'someone@elsewhere.com','ref_nfy properly added');

is_deeply ($object->mnt_ref(),[ 'CPNY-MNT' ],'mnt_ref properly parsed');
$object->mnt_ref('CPNY-MNT2');
is ($object->mnt_ref()->[1],'CPNY-MNT2','mnt_ref properly added');

is_deeply ($object->mnt_by(),[ 'CPNY-MNT' ],'mnt_by properly parsed');
$object->mnt_by('CPNY-MNT2');
is ($object->mnt_by()->[1],'CPNY-MNT2','mnt_by properly added');

is_deeply ($object->changed(),[ 'someone@somewhere.com 20120131' ],'changed properly parsed');
$object->changed('someone@somewhere.com 20120228');
is ($object->changed()->[1],'someone@somewhere.com 20120228','changed properly added');

is ($object->source(),'RIPE','source properly parsed');
$object->source('APNIC');
is ($object->source(),'APNIC','source properly set');

__DATA__
organisation:   AUTO-1
org-name:       The name of the organisation
org-type:       OTHER
remarks:        This is a dummy organisation object.
                Used for testing
address:        2 Rue de la Gare
address:        75001 Paris
address:        France
phone:          +33 1 75 75 75 01
fax-no:         +33 1 75 75 75 91
e-mail:         someone@somewhere.com
admin-c:        CPNY-ADM
tech-c:         CPNY-TCH
ref-nfy:        someone@somewhere.com
mnt-ref:        CPNY-MNT
mnt-by:         CPNY-MNT
changed:        someone@somewhere.com 20120131
source:         RIPE

