use 5.014;
use Modern::Perl '2012';

package HelloWorld 2.01 {
	use Moose;

	has 'hello' => (
		is      => 'rw',
		isa     => 'Str',
		default => 'Hello, world!',
		reader  => 'get_hello',
		writer  => 'set_hello',
	);

	has 'japh' => (
		is      => 'ro',
		isa     => 'Str',
		default => 'Just another Perl hacker,',
		reader  => 'get_japh',
		writer  => 'set_japh',
	);
}

1;
