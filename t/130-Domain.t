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

isa_ok $object, "Net::Whois::Object::Domain";

# Inherited method from Net::Whois::Object;
can_ok $object,

    # Constructor
    qw( new ),

    # OO Support
    qw( filter filtered_attributes displayed_attributes );

can_ok $object, qw( domain descr admin_c tech_c zone_c nserver sub_dom dom_net
remarks notify mnt_by mnt_lower refer changed source);

ok( !$object->can('bogusmethod'), "No AUTOLOAD interference with Net::Whois::Object::Domain tests" );

is ($object->domain(),'somewhere.superdomain.com','domain properly parsed');
$object->domain('somewhereelse.superdomain.com');
is ($object->domain(),'somewhereelse.superdomain.com','domain properly set');

is_deeply ($object->descr(),[ 'Domain\'s description' ],'descr properly parsed');
$object->descr('Added descr');
is ($object->descr()->[1],'Added descr','descr properly added');

is_deeply ($object->admin_c(),[ 'CPNY-ADM01' ],'admin_c properly parsed');
$object->admin_c('Added admin_c');
is ($object->admin_c()->[1],'Added admin_c','admin_c properly added');

is_deeply ($object->tech_c(),[ 'CPNY-TECH01' ],'tech_c properly parsed');
$object->tech_c('Added tech_c');
is ($object->tech_c()->[1],'Added tech_c','tech_c properly added');

is_deeply ($object->zone_c(),[ 'CPNY-ZONE' ],'zone_c properly parsed');
$object->zone_c('Added zone_c');
is ($object->zone_c()->[1],'Added zone_c','zone_c properly added');

is_deeply ($object->nserver(),[ 'NS1.SUPERDOMAIN.COM', 'NS2.SUPERDOMAIN.COM' ],'nserver properly parsed');
$object->nserver('Added nserver');
is ($object->nserver()->[2],'Added nserver','nserver properly added');

is_deeply ($object->sub_dom(),[ 'SUBDOM1', 'SUBDOM2','PRIVATE.SUBDOM2' ],'sub_dom properly parsed');
$object->sub_dom('Added sub_dom');
is ($object->sub_dom()->[3],'Added sub_dom','sub_dom properly added');

is_deeply ($object->dom_net(),[ '10.0.0.1' ],'dom_net properly parsed');
$object->dom_net('Added dom_net');
is ($object->dom_net()->[1],'Added dom_net','dom_net properly added');

is_deeply ($object->remarks(),[ 'Nothing to say' ],'remarks properly parsed');
$object->remarks('Added remarks');
is ($object->remarks()->[1],'Added remarks','remarks properly added');

is_deeply ($object->mnt_by(),[ 'DOM-MAINT' ],'mnt_by properly parsed');
$object->mnt_by('Added mnt_by');
is ($object->mnt_by()->[1],'Added mnt_by','mnt_by properly added');

is_deeply ($object->mnt_lower(),[ 'DOM-LMAINT' ],'mnt_lower properly parsed');
$object->mnt_lower('Added mnt_lower');
is ($object->mnt_lower()->[1],'Added mnt_lower','mnt_lower properly added');

is ($object->refer(), 'CLIENTADDRESS whois.server.dom.com 43' ,'refer properly parsed');
$object->refer('CLIENTADDRESS whois.server.dom.com 45');
is ($object->refer(),'CLIENTADDRESS whois.server.dom.com 45','refer properly set');

is_deeply ($object->changed(),[ 'someoneelese@somewere.net 20090429' ],'changed properly parsed');
$object->changed('Added changed');
is ($object->changed()->[1],'Added changed','changed properly added');

is ($object->source(),'RIPE # Filtered','source properly parsed');
$object->source('APNIC');
is ($object->source(),'APNIC','source properly set');

__DATA__
domain:     somewhere.superdomain.com
descr:      Domain's description
admin-c:    CPNY-ADM01
tech-c:     CPNY-TECH01
zone-c:     CPNY-ZONE
nserver:    NS1.SUPERDOMAIN.COM
nserver:    NS2.SUPERDOMAIN.COM
sub-dom:    SUBDOM1
sub-dom:    SUBDOM2
sub-dom:    PRIVATE.SUBDOM2
dom-net:    10.0.0.1
remarks:    Nothing to say
notify:     watcher@somewhere.net
mnt-by:     DOM-MAINT
mnt-lower:  DOM-LMAINT
refer:      CLIENTADDRESS whois.server.dom.com 43
changed:    someoneelese@somewere.net 20090429
source:     RIPE # Filtered

