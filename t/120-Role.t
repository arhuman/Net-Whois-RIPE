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

isa_ok $object, "Net::Whois::Object::Role";

# Inherited method from Net::Whois::Object;
can_ok $object,

    # Constructor
    qw( new ),

    # OO Support
    qw( filter filtered_attributes displayed_attributes );

can_ok $object, qw( role address phone fax_no e_mail trouble admin_c tech_c nic_hdl remarks notify mnt_by changed source);

ok( !$object->can('bogusmethod'), "No AUTOLOAD interference with Net::Whois::Object::Role tests" );

is ($object->role(),'Company Admin','role properly parsed');
$object->role('Role');
is ($object->role(),'Role','role properly set');

is_deeply ($object->address(),
        [
            'The Company',
            '2 avenue de la gare',
            '75001 Paris',
            'France',
        ],'address properly parsed');
$object->address('Added address');
is ($object->address()->[4],'Added address','address properly added');
    
is_deeply ($object->phone(),[ '+33 1 44 01 01 00' ],'phone properly parsed');
$object->phone('Added phone');
is ($object->phone()->[1],'Added phone','phone properly added');

is_deeply ($object->fax_no(),[ '+33 1 44 01 01 46' ],'fax_no properly parsed');
$object->fax_no('Added fax_no');
is ($object->fax_no()->[1],'Added fax_no','fax_no properly added');

is_deeply ($object->admin_c(),[ 'CPY01-RIPE' ],'admin_c properly parsed');
$object->admin_c('Added admin_c');
is ($object->admin_c()->[1],'Added admin_c','admin_c properly added');

is_deeply ($object->tech_c(),[ 'CPY01-RIPE', 'C???-RIPE', 'C?????-RIPE' ],'tech_c properly parsed');
$object->tech_c('Added tech_c');
is ($object->tech_c()->[3],'Added tech_c','tech_c properly added');

is ($object->nic_hdl(),'C??????-RIPE','nic_hdl properly parsed');
$object->nic_hdl('NICHDL');
is ($object->nic_hdl(),'NICHDL','nic_hdl properly set');

is_deeply ($object->mnt_by(),[ 'E???-MNT' ],'mnt_by properly parsed');
$object->mnt_by('Added mnt_by');
is ($object->mnt_by()->[1],'Added mnt_by','mnt_by properly added');

is ($object->source(),'RIPE # Filtered','source properly parsed');
$object->source('RIPE');
is ($object->source(),'RIPE','source properly set');

__DATA__
role:           Company Admin
address:        The Company
address:        2 avenue de la gare
address:        75001 Paris
address:        France
phone:          +33 1 44 01 01 00
fax-no:         +33 1 44 01 01 46
admin-c:        CPY01-RIPE
tech-c:         CPY01-RIPE
tech-c:         C???-RIPE
tech-c:         C?????-RIPE
nic-hdl:        C??????-RIPE
mnt-by:         E???-MNT
source:         RIPE # Filtered

