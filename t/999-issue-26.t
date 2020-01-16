use strict;
use warnings;
use Iterator;
use Net::Whois::Object;
use Test::More tests => 2;
use Data::Dumper;


my $input = <<EOF;
inet6num:       2001:780:43::/48
netname:        NORIS-NBG-TRANSFER-V6-NET-2
country:        DE
admin-c:        NNN-RIPE
tech-c:         NNN-RIPE
status:         AGGREGATED-BY-LIR
assignment-size:64
mnt-by:         NORIS-MNT
created:        2017-11-09T18:19:44Z
last-modified:  2017-11-09T18:19:44Z
source:         RIPE
EOF

my @list = ($input);
my $index = 0;


my $gen = sub { $list[$index++] || Iterator::is_done()  };


my @results = Net::Whois::Object->new( Iterator->new( $gen  )  );


is($results[0]->status(), "AGGREGATED-BY-LIR");
ok($results[0]->assignment_size() == 64);

