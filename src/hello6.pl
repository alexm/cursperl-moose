use 5.014;
use Modern::Perl '2012';

use lib 'lib/2.01';
use HelloWorld 2.01;

my $j = HelloWorld->new();

# $j->hello(); => FAIL

my $old_hello = $j->get_hello();
$j->set_hello( $j->get_japh() );

say $old_hello;
say $j->get_hello();
# say $j->get_foobar(); => FAIL
