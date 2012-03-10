use 5.014;
use Modern::Perl '2012';

package HelloWorld 2.02 {
	use Moose::Role;

	requires qw( hello );

	has 'japh' => (
		is      => 'ro',
		isa     => 'Str',
		default => 'Just another Perl hacker,',
	);

	sub japh_hello {
		my $self = shift;

		return $self->japh . ' ' . $self->hello . '!';
	}
}

1;
