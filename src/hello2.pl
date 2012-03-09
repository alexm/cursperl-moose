use 5.014;
use Modern::Perl '2012';

use lib 'lib/1.00';
use HelloWorld 1.00 qw( japh );

# say hello(); => FAIL
say japh();
