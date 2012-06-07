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

isa_ok $object, "Net::Whois::Object::Poem";

# Inherited method from Net::Whois::Object;
can_ok $object,

    # Constructor
    qw( new ),

    # OO Support
    qw( query_filter filtered_attributes displayed_attributes );

can_ok $object, qw( poem descr form text admin_c author remarks notify mnt_by
changed source);

ok( !$object->can('bogusmethod'), "No AUTOLOAD interference with Net::Whois::Object::Poem tests" );

is ($object->poem(),'POEM-EXAMPLE','poem properly parsed');
$object->poem('POEM-EXAMPLE2');
is ($object->poem(),'POEM-EXAMPLE2','poem properly set');

is ($object->form(),'FORM-PROSE','form properly parsed');
$object->form('FORM-UNKNOWN');
is ($object->form(),'FORM-UNKNOWN','form properly set');

is_deeply ($object->descr(),[ 'An example of poem' ],'descr properly parsed');
$object->descr('Added descr');
is ($object->descr()->[1],'Added descr','descr properly added');

is_deeply ($object->text(),[ 'line 1 is funny',
                                'line 2 is easy',
                                'line 3 is boring',
                                'I\'d stick with coding',
                                ''],'text properly parsed');
$object->text('Added text');
is ($object->text()->[5],'Added text','text properly added');

is_deeply ($object->author(),['GEEK-01'],'author properly parsed');
$object->author('GEEK-02');
is ($object->author()->[1],'GEEK-02','author properly added');

is_deeply ($object->admin_c(),[ 'CPNY-ADM' ],'admin_c properly parsed');
$object->admin_c('CPNY-ADM2');
is ($object->admin_c()->[1],'CPNY-ADM2','admin_c properly added');

is_deeply ($object->mnt_by(),[ 'CPNY-MNT' ],'mnt_by properly parsed');
$object->mnt_by('CPNY-MNT2');
is ($object->mnt_by()->[1],'CPNY-MNT2','mnt_by properly added');

is ($object->source(),'RIPE #Filtered','source properly parsed');
$object->source('APNIC');
is ($object->source(),'APNIC','source properly set');

__DATA__
poem:           POEM-EXAMPLE
form:           FORM-PROSE
descr:          An example of poem
text:           line 1 is funny
text:           line 2 is easy
text:           line 3 is boring
text:           I'd stick with coding
text:           
author:         GEEK-01
admin-c:        CPNY-ADM
mnt-by:         CPNY-MNT
source:         RIPE #Filtered

