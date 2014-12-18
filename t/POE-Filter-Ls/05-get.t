# Pragmas.
use strict;
use warnings;

# Modules.
use File::Object;
use POE::Filter::Ls;
use Perl6::Slurp qw(slurp);
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data')->set;

# Test.
my $obj = POE::Filter::Ls->new;
my $ret = $obj->get([slurp($data_dir->file('ex1.txt')->s)]);
is_deeply(
	$ret,
	[
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
	],
	'Get file and directory (\r\n).',
);

# Test.
SKIP: {
	skip 'Module cannot parse lines with \n.', 1;
	$obj = POE::Filter::Ls->new;
	$ret = $obj->get([slurp($data_dir->file('ex2.txt')->s)]);
	is_deeply(
		$ret,
		[
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
		],
		'Get file and directory (\n).',
	);
};

# Test.
$obj = POE::Filter::Ls->new;
$ret = $obj->get([slurp($data_dir->file('ex3.txt')->s)]);
is_deeply(
	$ret,
	[
		{
			'date' => 'Feb 25 14:11',
			'filename' => '../',
			'group' => 'slavenr',
			'link' => undef,
			'links' => 448,
			'owner' => 'root',
			'perms' => 'rwxrwxr-x',
			'size' => 12288,
			'type' => 'd',
		},
		{
			'date' => 'Jul 15  2002',
			'filename' => 'Changes',
			'group' => '1653',
			'link' => undef,
			'links' => 1,
			'owner' => '2885',
			'perms' => 'rw-r--r--',
			'size' => '90',
			'type' => '-',
		},
	],
	'Get file and directory with numerical owner and group (\r\n).',
);
