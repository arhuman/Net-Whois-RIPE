#!/usr/bin/perl

use strict;
use warnings;
use Getopt::Long;
use Net::Whois::Object;
use Data::Dumper;

####################################################################################
#
# Global variables

my $DEBUG;
my @EXCLUDES;
my $KEY;
my $ONLY;
my $OWNER;
my $QUERY;
my %QUERY_OPTIONS;
my $VERSION = '0.000.001';
my @TYPES;


####################################################################################
#
# Processing

# Get options value from command line
GetOptions( 'admin=s'    => \$OWNER,
            'debug'      => \$DEBUG,
            'excludes=s' => \@EXCLUDES,
            'key=s'      => \$KEY,
            'only=s'     => \$ONLY,
            'query=s'    => \$QUERY,
            'type=s'     => \@TYPES,
) or die usage();

# Query can be implicit or explicit
$QUERY = $ARGV[0]   unless $QUERY;


# You can now do
if (@TYPES) {
my $query_types = lc join '|',@TYPES;
$QUERY_OPTIONS{type} = $query_types;
}

if ($KEY) {
$QUERY = "-i $KEY ".$ARGV[0]   unless $QUERY =~ /-i/;
}

warn "QUERY=($QUERY)";
warn "OTIONS=",Dumper \%QUERY_OPTIONS;

my @objects = Net::Whois::Object->query( $QUERY, \%QUERY_OPTIONS );

# And manipulate the object the OO ways
for my $object (@objects) {
    print $object->dump;
    print $/;
}

exit 0;

sub excluded {
    my $tested = shift;

    return 0    unless @EXCLUDES;

    if ($ONLY) {
        return 1 unless $tested =~ /$ONLY/msi;
    }

    for my $ex_pattern (@EXCLUDES) {
        return 1 if $tested =~ /$ex_pattern/msi;
    }

    return 0;
}

sub usage {

    return <<EOT;

NAME

    $0 - WHOIS client for RIPE database

SYNOPSIS

    $0 [options] [query ...]

    # Get objects whose maintener is MNT-JAGN
    $0 --key mnt-by MNT-JAGN

    # Get objects about ASN 30781
    $0 AS30781


OPTIONS


--help

    Print a brief help message and exits.


--key

    The attribute to be used as the key for the search

--type

    The type of record to be returned (example: person, role, inetnum, route...)


DESCRIPTION

This program is a WHOIS client requesting the RIPE database

EOT
}

