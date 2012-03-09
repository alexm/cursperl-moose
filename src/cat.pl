use 5.014;
use Modern::Perl '2012';

package Pet {
	use Moose;

	has 'name' => (
		is  => 'ro',
		isa => 'Str',
	);
}

package Cat {
	use Moose;

	extends 'Pet';

	has 'diet' => (
		is => 'rw',
		isa => 'Str',
       	);

	has 'birth_year' => (
		is       => 'ro',
		isa      => 'Int',
	       	default  => sub { (localtime)[5] + 1900 },
	);

	sub meow {
		say "Meow!";
	}

	sub age {
		my $self = shift;
		my $year = (localtime)[5] + 1900;

		return $year - $self->birth_year;
	}
}

package main {
	my $fat = Cat->new( name => 'Fatty', age => 8, diet => 'Sea Treats' );
	say $fat->name, ' eats ', $fat->diet;

	$fat->diet('Low Sodium Kitty Lo Mein');
	say $fat->name, ' eats ', $fat->diet;
}
