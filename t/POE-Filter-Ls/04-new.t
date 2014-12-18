# Pragmas.
use strict;
use warnings;

# Modules.
use POE::Filter::Ls;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
my $obj = POE::Filter::Ls->new;
isa_ok($obj, 'POE::Filter::Ls');
