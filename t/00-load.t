#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Apache::Session::Riak' ) || print "Bail out!\n";
}

diag( "Testing Apache::Session::Riak $Apache::Session::Riak::VERSION, Perl $], $^X" );
