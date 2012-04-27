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

isa_ok $object, "Net::Whois::Object::AsSet";

# Inherited method from Net::Whois::Object;
can_ok $object,

    # Constructor
    qw( new ),

    # OO Support
    qw( filter filtered_attributes displayed_attributes );

can_ok $object, qw( as_set descr members mbrs_by_ref remarks tech_c admin_c
notify mnt_by changed source );

ok( !$object->can('bogusmethod'), "No AUTOLOAD interference with Net::Whois::Object::AsSet tests" );

is ($object->as_set(),'AS-COM01','as-block properly parsed');
$object->as_set('AS1-AS2');
is ($object->as_set(),'AS1-AS2','as_set properly set');

is_deeply ($object->descr(),[ 'A description' ],'descr properly parsed');
$object->descr('Added descr');
is ($object->descr()->[1],'Added descr','descr properly added');

is_deeply ($object->remarks(),
        [
            '**********************',
            '*      Remarks       *',
            '**********************'
        ],'remarks properly parsed');
$object->remarks('Added remarks');
is ($object->remarks()->[3],'Added remarks','remarks properly added');

is_deeply ($object->members(),
        [
            'AS1',
            'AS11',
            'AS21',
            'AS1211'
        ],'members properly parsed');
$object->members('Added members');
is ($object->members()->[4],'Added members','members properly added');

is_deeply ($object->mbrs_by_ref(),
        [
            'UNK-MNT',
            'UNK2-MNT',
        ],'mbrs_by_ref properly parsed');
$object->mbrs_by_ref('Added mbrs_by_ref');
is ($object->mbrs_by_ref()->[2],'Added mbrs_by_ref','mbrs_by_ref properly added');

is_deeply ($object->admin_c(),[ 'CPY01-RIPE' ],'admin_c properly parsed');
$object->admin_c('Added admin_c');
is ($object->admin_c()->[1],'Added admin_c','admin_c properly added');

is_deeply ($object->tech_c(),[ 'CPY01-RIPE', 'CXXX-RIPE', 'CXXXXX-RIPE' ],'tech_c properly parsed');
$object->tech_c('C007-RIPE');
is ($object->tech_c()->[3],'C007-RIPE','tech_c properly added');

is_deeply ($object->notify(),[ 'watcher@somewhere.com' ],'notify properly parsed');
$object->notify('Added notify');
is ($object->notify()->[1],'Added notify','notify properly added');

is_deeply ($object->mnt_by(),[ 'THE-MNT' ],'mnt_by properly parsed');
$object->mnt_by('Added mnt_by');
is ($object->mnt_by()->[1],'Added mnt_by','mnt_by properly added');

is_deeply ($object->changed(),[ 'someone@somewhere.net 20080422', 'someoneelese@somewere.net 20090429' ],'changed properly parsed');
$object->changed('Added changed');
is ($object->changed()->[2],'Added changed','changed properly added');

is ($object->source(),'RIPE # Filtered','source properly parsed');
$object->source('RIPE');
is ($object->source(),'RIPE','source properly set');

__DATA__
as-set:         AS-COM01
descr:          A description
remarks:        **********************
remarks:        *      Remarks       *
remarks:        **********************
members:        AS1
members:        AS11
members:        AS21
members:        AS1211
mbrs-by-ref:    UNK-MNT
mbrs-by-ref:    UNK2-MNT
admin-c:        CPY01-RIPE
tech-c:         CPY01-RIPE
tech-c:         CXXX-RIPE
tech-c:         CXXXXX-RIPE
notify:         watcher@somewhere.com
mnt-by:         THE-MNT
changed:        someone@somewhere.net 20080422
changed:        someoneelese@somewere.net 20090429
source:         RIPE # Filtered

