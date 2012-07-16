use strict;
use warnings;
use Test::More qw( no_plan );
use Test::Exception;

# synchronizes the {error,standard} output of this test.
use IO::Handle;
STDOUT->autoflush(1);
STDERR->autoflush(1);

our $class;
BEGIN { $class = 'Net::Whois::Object::Poem'; use_ok $class; }

my %tested;

my @lines  = <DATA>;
my $object = ( Net::Whois::Object->new(@lines) )[0];

isa_ok $object, $class;

# Non-inherited methods
can_ok $object, qw( poem descr form text admin_c author remarks notify mnt_by
    changed source);

# Check if typed attributes are correct
can_ok $object, $object->attributes('mandatory');
can_ok $object, $object->attributes('optionnal');

# Test 'poem'
$tested{'poem'}++;
is( $object->poem(), 'POEM-EXAMPLE', 'poem properly parsed' );
$object->poem('POEM-EXAMPLE2');
is( $object->poem(), 'POEM-EXAMPLE2', 'poem properly set' );

# Test 'form'
$tested{'form'}++;
is( $object->form(), 'FORM-PROSE', 'form properly parsed' );
$object->form('FORM-UNKNOWN');
is( $object->form(), 'FORM-UNKNOWN', 'form properly set' );

# Test 'descr'
$tested{'descr'}++;
is_deeply( $object->descr(), ['An example of poem'], 'descr properly parsed' );
$object->descr('Added descr');
is( $object->descr()->[1], 'Added descr', 'descr properly added' );

# Test 'text'
$tested{'text'}++;
is_deeply( $object->text(), [ 'line 1 is funny', 'line 2 is easy', 'line 3 is boring', 'I\'d stick with coding', '' ], 'text properly parsed' );
$object->text('Added text');
is( $object->text()->[5], 'Added text', 'text properly added' );

# Test 'author'
$tested{'author'}++;
is_deeply( $object->author(), ['GEEK-01'], 'author properly parsed' );
$object->author('GEEK-02');
is( $object->author()->[1], 'GEEK-02', 'author properly added' );

# Test 'admin_c'
$tested{'admin_c'}++;
is_deeply( $object->admin_c(), ['CPNY-ADM'], 'admin_c properly parsed' );
$object->admin_c('CPNY-ADM2');
is( $object->admin_c()->[1], 'CPNY-ADM2', 'admin_c properly added' );

# Test 'mnt_by'
$tested{'mnt_by'}++;
is_deeply( $object->mnt_by(), ['CPNY-MNT'], 'mnt_by properly parsed' );
$object->mnt_by('CPNY-MNT2');
is( $object->mnt_by()->[1], 'CPNY-MNT2', 'mnt_by properly added' );

# Test 'notify'
$tested{'notify'}++;
is_deeply( $object->notify(), ['CPNY-MNT'], 'notify properly parsed' );
$object->notify('CPNY-MNT2');
is( $object->notify()->[1], 'CPNY-MNT2', 'notify properly added' );

# Test 'remarks'
$tested{'remarks'}++;
is_deeply( $object->remarks(), ['A remark'], 'remarks properly parsed' );
$object->remarks('Another one');
is( $object->remarks()->[1], 'Another one', 'remarks properly added' );

# Test 'source'
$tested{'source'}++;
is( $object->source(), 'RIPE #Filtered', 'source properly parsed' );
$object->source('APNIC');
is( $object->source(), 'APNIC', 'source properly set' );

# Test 'changed'
$tested{'changed'}++;
is_deeply( $object->changed(), ['arhuman@gmail.com 20110214'], 'changed properly parsed' );
$object->changed('arhuman@gmail.com 20110213');
is( $object->changed()->[1], 'arhuman@gmail.com 20110213', 'changed properly added' );

# Do cause issue with lexicals
eval `cat t/common.pl`;
ok( $tested{common_loaded}, "t/common.pl properly loaded" );
ok( !$@, "Can evaluate t/common.pl ($@)" );

__DATA__
poem:           POEM-EXAMPLE
form:           FORM-PROSE
remarks:        A remark
descr:          An example of poem
text:           line 1 is funny
text:           line 2 is easy
text:           line 3 is boring
text:           I'd stick with coding
text:           
author:         GEEK-01
admin-c:        CPNY-ADM
mnt-by:         CPNY-MNT
notify:         CPNY-MNT
changed:        arhuman@gmail.com 20110214
source:         RIPE #Filtered

