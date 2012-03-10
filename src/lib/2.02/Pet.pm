use 5.014;
use Modern::Perl '2012';

package Pet 2.02 {
	use Moose;

	has 'name' => (
		is  => 'ro',
		isa => 'Str',
	);
}

1;
