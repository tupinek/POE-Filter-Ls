# Pragmas.
use strict;
use warnings;

# Modules.
use POE::Filter::Ls;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
SKIP: {
	skip "put() isn't functional", 1;
	my $obj = POE::Filter::Ls->new;
	my @data = (
		{
			'date' => 'Dec  9 14:51',
			'filename' => 'data',
			'group' => 'skim',
			'link' => undef,
			'links' => 2,
			'owner' => 'skim',
			'perms' => 'rwxr-xr-x',
			'size' => 4096,
			'type' => 'd',
		},
		{
			'date' => 'Dec  9 14:14',
			'filename' => 'ex1.pl',
			'group' => 'skim',
			'link' => undef,
			'links' => 1,
			'owner' => 'skim',
			'perms' => 'rwxr-xr-x',
			'size' => '1318',
			'type' => '-',
		},
	);
	my $ret_ar = $obj->put(\@data);
	my @right_ret = (
		"drwxr-xr-x 2 skim skim 4096 Dec  9 14:51 data\n",
		"-rwxr-xr-x 1 skim skim 1318 Dec  9 14:14 ex1.pl\n",
	);
	is_deeply(
		$ret_ar,
		\@right_ret,
		'Put file and directory.',
	);
};
