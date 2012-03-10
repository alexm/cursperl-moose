use 5.014;
use Modern::Perl '2012';

use lib 'lib/3.01';
use Doc 3.01;

use Moose::Util qw( apply_all_roles );

my $r = Doc->new( title => 'T', body => 'B', author => 'A' );
apply_all_roles( $r, 'HTML' );
$r->print_html if $r->DOES('HTML');
