use lib 'lib/1.01';
use HelloWorld 1.01;

my $hw = HelloWorld->new();
$hw->hello();
$hw->japh();

my $j = HelloWorld->new( hello => 'JAPH!' );
$j->hello();

my $old_hello = $j->set_hello( $j->get_japh() );

use 5.014;
say $old_hello;
say $j->get_hello();
# say $j->get_foobar(); => FAIL
