use 5.014;
use Modern::Perl '2012';

package Document {
	use Moose;

	sub as_xml {
		my $self = shift;

		my $xml = "<document>";
		$xml   .= inner();
		$xml   .= "</document>";

		return $xml;
	}
}

package Report {
	use Moose;

	extends 'Document';

	augment 'as_xml' => sub {
		my $self = shift;

		return "<report>This is a report</report>";
	};
}

package main {
	my $report = Report->new();
	say $report->as_xml();
}
