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

isa_ok $object, "Net::Whois::Object::AutNum";

# Inherited method from Net::Whois::Object;
can_ok $object,

    # Constructor
    qw( new ),

    # OO Support
    qw( query_filter filtered_attributes displayed_attributes );

can_ok $object, qw( aut_num as_name descr member_of import mp_import export
mp_export default mp_default remarks admin_c tech_c notify mnt_lower mnt_routes mnt_by changed source);

can_ok $object, qw( mp_import mp_export );

ok( !$object->can('bogusmethod'), "No AUTOLOAD interference with Net::Whois::Object::AutNum tests" );

is ($object->aut_num(),'AS00007','aut_num properly parsed');
$object->aut_num('AS1');
is ($object->aut_num(),'AS1','aut_num properly set');

is ($object->as_name(),'FR-COMPANY','as_name properly parsed');
$object->as_name('FR-C');
is ($object->as_name(),'FR-C','as_name properly set');

is_deeply ($object->descr(),[ 'French Company', 'FRANCE' ],'descr properly parsed');
$object->descr('Added descr');
is ($object->descr()->[2],'Added descr','descr properly added');

is ($object->org(),'ORG-MISC01-RIPE','org properly parsed');
$object->org('ORG-MOD');
is ($object->org(),'ORG-MOD','org properly set');

is_deeply ($object->admin_c(),[ 'NC123-RIPE'],'admin_c properly parsed');
$object->admin_c('Added admin_c');
is ($object->admin_c()->[1],'Added admin_c','admin_c properly added');

is_deeply ($object->tech_c(),[ 'NC345-RIPE'],'tech_c properly parsed');
$object->tech_c('Added tech_c');
is ($object->tech_c()->[1],'Added tech_c','tech_c properly added');

is_deeply ($object->mnt_by(),
        [
            'RIPE-NCC-END-MNT',
            'MAIN-FR-MNT'
        ],'mnt_by properly parsed');
$object->mnt_by('Added mnt_by');
is ($object->mnt_by()->[2],'Added mnt_by','mnt_by properly added');

is ($object->source(),'RIPE # Filtered','source properly parsed');
$object->source('ANIC');
is ($object->source(),'ANIC','source properly set');

__DATA__
aut-num:         AS00007
as-name:         FR-COMPANY
descr:           French Company
descr:           FRANCE
org:             ORG-MISC01-RIPE
admin-c:         NC123-RIPE
tech-c:          NC345-RIPE
mnt-by:          RIPE-NCC-END-MNT
mnt-by:          MAIN-FR-MNT
mnt-routes:      MAIN-FR-MNT
source:          RIPE # Filtered

