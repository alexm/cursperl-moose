use 5.014;
use Modern::Perl '2012';

package HTML 3.00 {
	use Moose::Role;

	requires qw( title body author );

	sub print_html {
		my $self = shift;

		say "<title>" . $self->title . "</title>";
		say "<head meta=\"author\" content=\"" . $self->author . "\"/>";
		say "<body>"  . $self->body  . "</body>";
	}
}

1;
