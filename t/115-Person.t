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

isa_ok $object, "Net::Whois::Object::Person";

# Inherited method from Net::Whois::Object;
can_ok $object,

    # Constructor
    qw( new ),

    # OO Support
    qw( query_filter filtered_attributes displayed_attributes );

can_ok $object, qw( person address phone fax_no e_mail nic_hdl remarks notify
mnt_by changed source);

ok( !$object->can('bogusmethod'), "No AUTOLOAD interference with Net::Whois::Object::Person tests" );

is ($object->person(),'COMPANY Contact','person properly parsed');
$object->person('PERSON');
is ($object->person(),'PERSON','person properly set');

is_deeply ($object->address(),
        [
            'The Company',
            '2 Rue de la Gare',
            '75001 PARIS',
        ],'address properly parsed');
$object->address('Added address');
is ($object->address()->[3],'Added address','address properly added');

is_deeply ($object->phone(),[ '+33 1 72 44 01 00' ],'phone properly parsed');
$object->phone('Added phone');
is ($object->phone()->[1],'Added phone','phone properly added');

is_deeply ($object->fax_no(),[ '+33 1 72 44 01 46' ],'fax_no properly parsed');
$object->fax_no('Added fax_no');
is ($object->fax_no()->[1],'Added fax_no','fax_no properly added');

is_deeply ($object->e_mail(),['xxx@somewhere.com'],'e_mail properly parsed');
$object->e_mail('Added e_mail');
is ($object->e_mail()->[1],'Added e_mail','e_mail properly added');

is ($object->nic_hdl(),'NC123-RIPE','nic_hdl properly parsed');
$object->nic_hdl('NIC-HDL');
is ($object->nic_hdl(),'NIC-HDL','nic_hdl properly set');

is_deeply ($object->mnt_by(),['MAIN-FR-MNT'],'mnt_by properly parsed');
$object->mnt_by('Added mnt_by');
is ($object->mnt_by()->[1],'Added mnt_by','mnt_by properly added');

is_deeply ($object->changed(),[ 'xxx@somewhere.com 20121016' ],'changed properly parsed');
$object->changed('Added changed');
is ($object->changed()->[1],'Added changed','changed properly added');

is ($object->source(),'RIPE # Filtered','source properly parsed');
$object->source('APNIC');
is ($object->source(),'APNIC','source properly set');

__DATA__
person:       COMPANY Contact
address:      The Company
address:      2 Rue de la Gare
address:      75001 PARIS
phone:        +33 1 72 44 01 00
fax-no:       +33 1 72 44 01 46
e-mail:       xxx@somewhere.com
nic-hdl:      NC123-RIPE
mnt-by:       MAIN-FR-MNT
changed:      xxx@somewhere.com 20121016
source:       RIPE # Filtered


