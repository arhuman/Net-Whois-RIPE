use strict;
use warnings;
use Test::More qw( no_plan );
use Test::Exception;
use Net::Whois::Object;

# synchronizes the {error,standard} output of this test.
use IO::Handle;
STDOUT->autoflush(1);
STDERR->autoflush(1);

BEGIN { use_ok 'Net::Whois::Object::AsBlock'; }

my  @lines = <DATA>; 
my $object = (Net::Whois::Object->new(@lines))[0];

isa_ok $object, "Net::Whois::Object::AsBlock";

# Inherited method from Net::Whois::Object
can_ok $object,

    # Constructor
    qw( new ),

    # OO Support
    qw( query_filter filtered_attributes displayed_attributes );

can_ok $object, qw( as_block descr remarks tech_c admin_c notify mnt_lower mnt_by changed source);

can_ok $object, qw( org );

ok( !$object->can('bogusmethod'), "No AUTOLOAD interference with Net::Whois::Object::AsBlock tests" );

is ($object->as_block(),'AS30720 - AS30895','as-block properly parsed');
$object->as_block('AS1 - AS2');
is ($object->as_block(),'AS1 - AS2','as_block properly set');

is_deeply ($object->descr(),[ 'RIPE NCC ASN block' ],'descr properly parsed');
$object->descr('Added');
is_deeply ($object->descr(),[ 'RIPE NCC ASN block', 'Added' ],'descr properly added');

is_deeply ($object->remarks(),
        [
            'These AS Numbers are further assigned to network',
            'operators in the RIPE NCC service region. AS',
            'assignment policy is documented in:',
            '<http://www.ripe.net/ripe/docs/asn-assignment.html>',
            'RIPE NCC members can request AS Numbers using the',
            'form available in the LIR Portal or at:',
            '<http://www.ripe.net/ripe/docs/asnrequestform.html>'
        ],'remarks properly parsed');
$object->remarks('Added remarks');
is ($object->remarks()->[7],'Added remarks','remarks properly added');

is ($object->org(),'ORG-NCC1-RIPE','as-block properly parsed');
$object->org('ORG-MDFIED');
is ($object->org(),'ORG-MDFIED','as-block properly set');

is_deeply ($object->admin_c(),['CREW-RIPE'],'admin_c properly parsed');
$object->admin_c('Added admin_c');
is ($object->admin_c()->[1],'Added admin_c','admin_c properly added');

is_deeply ($object->tech_c(),['RD132-RIPE'],'tech_c properly parsed');
$object->tech_c('Added tech_c');
is ($object->tech_c()->[1],'Added tech_c','tech_c properly added');

is_deeply ($object->mnt_by(),['RIPE-DBM-MNT'],'mnt_by properly parsed');
$object->mnt_by('Added mnt_by');
is ($object->mnt_by()->[1],'Added mnt_by','mnt_by properly added');

is_deeply ($object->mnt_lower(),['RIPE-NCC-HM-MNT'],'mnt_lower properly parsed');
$object->mnt_lower('Added mnt_lower');
is ($object->mnt_lower()->[1],'Added mnt_lower','mnt_lower properly added');

is ($object->source(),'RIPE # Filtered','source properly parsed');
$object->source('APNIC');
is ($object->source(),'APNIC','source properly set');


__DATA__
as-block:       AS30720 - AS30895
descr:          RIPE NCC ASN block
remarks:        These AS Numbers are further assigned to network
remarks:        operators in the RIPE NCC service region. AS
remarks:        assignment policy is documented in:
remarks:        <http://www.ripe.net/ripe/docs/asn-assignment.html>
remarks:        RIPE NCC members can request AS Numbers using the
remarks:        form available in the LIR Portal or at:
remarks:        <http://www.ripe.net/ripe/docs/asnrequestform.html>
org:            ORG-NCC1-RIPE
admin-c:        CREW-RIPE
tech-c:         RD132-RIPE
mnt-by:         RIPE-DBM-MNT
mnt-lower:      RIPE-NCC-HM-MNT
source:         RIPE # Filtered

