use 5.014;
use Modern::Perl '2012';

package Doc 3.01 {
	use Moose;

	has 'title',    is => 'ro', isa => 'Str';
	has 'body',     is => 'ro', isa => 'Str';
	has 'tag_list', is => 'ro', isa => 'ArrayRef[Str]';
	has 'author',   is => 'ro', isa => 'Str';
}

1;
