use 5.014;
use Modern::Perl '2012';

use lib 'lib/1.01';
use HelloWorld 1.01;

my $h = HelloWorld->new();
say $h->hello();
say $h->japh();

my $j = HelloWorld->new( hello => 'JAPH!' );
say $j->hello();
