use 5.014;
use Modern::Perl '2012';

use lib 'lib/2.00';
use HelloWorld 2.00;

my $h = HelloWorld->new();

say $h->hello();
$h->hello('hello');
say $h->hello();

say $h->japh();
# $h->japh('japh'); => FAIL

my $j = HelloWorld->new( hello => 'JAPH!' );
say $j->hello();
