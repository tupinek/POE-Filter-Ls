# Pragmas.
use strict;
use warnings;

# Modules.
use POE::Filter::Ls;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($POE::Filter::Ls::VERSION, 0.02, 'Version.');
