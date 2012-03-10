use 5.014;
use Modern::Perl '2012';

use lib 'lib/3.00';
use Doc 3.00;

my $r = Doc->new( title => 'T', body => 'B', author => 'A' );
$r->print_html
	if $r->DOES('HTML');
