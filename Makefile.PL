# Pragmas.
use strict;
use warnings;

# Modules.
use inc::Module::Install;

# Definition.
abstract 'Translates common ls formats into a hashref.';
author 'Michael Ching <michaelc@wush.net>';
author 'Michal Spacek <skim@cpan.org>';
license 'perl';
name 'POE-Filter-Ls';
readme_from 'Ls.pm';
requires 'POE::Filter::Line' => 0;
requires 'perl' => '5.8.0';
test_requires 'English' => 0;
test_requires 'File::Object' => 0.05;
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
test_requires 'Test::Pod' => 0;
test_requires 'Test::Pod::Coverage' => 0;
tests_recursive;
version '0.02';

# Run.
WriteAll();
