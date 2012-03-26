use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'Net::Whois::RIPE',
    AUTHOR           => 'Luis Motta Campos <lmc@cpan.org>',
    VERSION_FROM     => 'lib/Net/Whois/RIPE.pm',
    ABSTRACT_FROM    => 'lib/Net/Whois/RIPE.pm',
    MIN_PERL_VERSION => 5.006,
    PL_FILES         => {},
    PREREQ_PM        => {
        'Test::More'     => 0,
        'Iterator'       => 0,
        'Iterator::Util' => 0,
    },
    BUILD_REQUIRES => { 'Test::Exception' => 0, },
    dist           => { COMPRESS          => 'gzip -9f', SUFFIX => 'gz', },
    clean          => { FILES             => 'net-whois-ripe-*' },
);
