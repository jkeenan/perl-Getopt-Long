#! perl

# Verify that loading Getopt::Long::Parser also loads Getopt::Long.

BEGIN {
    if ($ENV{PERL_CORE}) {
	@INC = '../lib';
    }
    if ( -d "t" ) {
	chdir "t";
    }
}

use strict;
use warnings;
use Test::More tests => 3;

use_ok("Getopt::Long::Parser");

# Getopt::Long should have been loaded as well.
ok( defined $Getopt::Long::VERSION,
    "Getopt::Long::Parser loads Getopt::Long" );

# Verify version match.
is( $Getopt::Long::VERSION, $Getopt::Long::Parser::VERSION,
    "Parser version matches" );
