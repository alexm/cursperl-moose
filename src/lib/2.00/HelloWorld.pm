use 5.014;
use Modern::Perl '2012';

package HelloWorld 2.00 {
	use Moose;

	has 'hello' => (
		is      => 'rw',
		isa     => 'Str',
		default => 'Hello, world!',
	);

	has 'japh' => (
		is      => 'ro',
		isa     => 'Str',
		default => 'Just another Perl hacker,',
	);
}

1;
