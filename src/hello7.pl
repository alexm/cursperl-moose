use 5.014;
use Modern::Perl '2012';

use lib 'lib/2.02';
use Cat 2.02;

my $fat = Cat->new( name => 'Kitty', age => 8, diet => 'Sea Treats' );
say $fat->japh_hello()
	if $fat->DOES('HelloWorld');
