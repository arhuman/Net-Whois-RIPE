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

my @lines = <DATA>;
my @o     = Net::Whois::Object->new(@lines);
for our $object (@o) {
    isa_ok $object, $class;
}
isa_ok $o[0], $class . "::Information";
can_ok $o[0], qw( comment );
ok( !$o[0]->can('source'), "No AUTOLOAD interference with ${class}::Information tests" );

isa_ok $o[3], $class . "::AsBlock";
can_ok $o[3], qw( as_block org source ), qw( descr remarks tech_c admin_c notify mnt_lower mnt_by changed);
ok( !$o[3]->can('bogusmethod'), "No AUTOLOAD interference with ${class}::AsBlock tests" );

isa_ok $o[5], $class . "::AutNum";
can_ok $o[5], qw( aut_num as_name org source ), qw( descr member_of import mp_import export mp_export
    default remarks tech_c admin_c notify
    mnt_lower mnt_by mnt_routes changed);
ok( !$o[5]->can('bogusmethod'), "No AUTOLOAD interference with ${class}::AutNum tests" );

is_deeply( [ $o[0]->attributes('mandatory') ], ['comment'] );

is_deeply( [ $o[0]->attributes('optional') ], [] );
$o[0]->attributes( 'optional', [ 'opt1', 'opt2', 'opt3' ] );
is_deeply( [ $o[0]->attributes('optional') ], [ 'opt1', 'opt2', 'opt3' ] );

is_deeply( [ $o[0]->attributes('all') ], [ 'comment', 'opt1', 'opt2', 'opt3' ] );
is_deeply( [ $o[0]->attributes() ],      [ 'comment', 'opt1', 'opt2', 'opt3' ] );

is( $o[2]->dump, "% Information related to 'AS30720 - AS30895'\n" );
is( $o[2]->dump( { align => 8 } ), "% Information related to 'AS30720 - AS30895'\n" );

my @objects;
eval { @objects = Net::Whois::Object->query('AS30781', {attribute => 'remarks'}) };

SKIP: {
    skip "Network issue",14 if ( $@ =~ /IO::Socket::INET/ );

    for my $object (@objects) {
        ok(!ref($object), "query() : String returned for 'remarks' attribute filter")
    }

    @objects = Net::Whois::Object->query('AS30781');
    for my $object (@objects) {
        ok(ref($object) =~ /Net::Whois::Object/ , "query() : Object returned for 'remarks' attribute filter")
    }

    @objects = Net::Whois::Object->query('AS30781', {type => 'asblock', attribute => 'admin_c'});
    for my $object (@objects) {
        ok($object eq 'CREW-RIPE' , "query() : 'CREW-RIPE' returned for AsBlock and admin-c filter")
    }
}

__DATA__
% This is the RIPE Database query service.
% The objects are in RPSL format.
%
% The RIPE Database is subject to Terms and Conditions.
% See http://www.ripe.net/db/support/db-terms-conditions.pdf

% Note: this output has been filtered.
%       To receive output for a database update, use the "-B" flag.

% Information related to 'AS30720 - AS30895'

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

% Information related to 'AS99999'

aut-num:         AS99999
as-name:         COMPANY-AS
descr:           Company Entity SAS
org:             ORG-CO30-RIPE
remarks:
remarks:         UPSTREAMS
remarks:         ----------------------------------------------------------------
import:          from AS2914 action pref=80; accept ANY
import:          from AS3356 action pref=80; accept ANY
export:          to AS2914 announce AS-COMPANY
export:          to AS3356 announce AS-COMPANY
remarks:
remarks:
remarks:         UPSTREAMS IPv6
remarks:         ----------------------------------------------------------------
mp-import:       afi ipv6.unicast from AS2914 action pref=80; accept ANY
mp-import:       afi ipv6.unicast from AS3356 action pref=80; accept ANY
mp-export:       afi ipv6.unicast to AS2914 announce AS-COMPANY-V6;
mp-export:       afi ipv6.unicast to AS3356 announce AS-COMPANY-V6;
remarks:         ----------------------------------------------------------------
remarks:         Operational issues: noc at as99999 dot net
remarks:         ----------------------------------------------------------------
remarks:         Spam & abuse issues: abuse at as99999 dot net
remarks:         ----------------------------------------------------------------
remarks:         Peering Request: peering at as99999 dot net
remarks:         ----------------------------------------------------------------
remarks:         Network informations: http://extranet.company-entity.com/
remarks:         ----------------------------------------------------------------
remarks:
admin-c:         CPNY-RIPE
tech-c:          CPNY-RIPE
mnt-by:          COMPANY-MNT
mnt-routes:      COMPANY-MNT
mnt-by:          RIPE-NCC-END-MNT
source:          RIPE # Filtered

