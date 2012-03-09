use 5.014;
use Modern::Perl '2012';

package Foo {
	use Moose;
	use Moose::Util::TypeConstraints;
	use Moose::Autobox;

	subtype 'ArrayRefOfPositiveInts',
		as 'ArrayRef[Int]',
		message { "The array you provided has a negative number" },
		where {
			my @array    = @$_;
			my $positive = 1;

			for my $next (@array) {
				$positive &&= ( $next >= 0 ) or last;
			}

			return $positive;
		};

	coerce 'ArrayRefOfPositiveInts',
		from 'Int',
		via { [ $_ ] };

	has 'sizes'    => (
		is     => 'ro',
		isa    => 'ArrayRefOfPositiveInts',
		coerce => 1,
	);
}

package main {
	Foo->new( sizes => 42 );

	# Foo->new( sizes => [ 42, -42 ] ); => FAIL
}
