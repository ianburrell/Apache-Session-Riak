use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Apache::Session::Riak',
    AUTHOR              => q{Ian Burrell <ianburrell@gmail.com>},
    VERSION_FROM        => 'lib/Apache/Session/Riak.pm',
    ABSTRACT_FROM       => 'lib/Apache/Session/Riak.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Apache-Session-Riak-*' },
);
