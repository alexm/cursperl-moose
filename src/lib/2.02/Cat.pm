use 5.014;
use Modern::Perl '2012';

package Cat 2.02 {
	use Moose;

	extends 'Pet';

	has 'diet' => (
		is  => 'rw',
		isa => 'Str',
	);

	has 'birth_year' => (
		is       => 'ro',
		isa      => 'Int',
		default  => sub { (localtime)[5] + 1900 },
	);

	has 'hello' => (
		is      => 'rw',
		isa     => 'Str',
		lazy    => 1,
		default => sub { "hello " . shift->name },
	);

	with 'HelloWorld';

	sub meow {
		say "Meow!";
	}

	sub age {
		my $self = shift;
		my $year = (localtime)[5] + 1900;

		return $year - $self->birth_year;
	}
}

1;
