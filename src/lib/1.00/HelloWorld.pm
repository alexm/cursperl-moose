use 5.014;
use Modern::Perl '2012';

package HelloWorld 1.00 {
	use Exporter qw( import );

	our @EXPORT    = qw( hello );
	our @EXPORT_OK = qw( japh );

	sub hello {
		return "Hello, world!";
	}

	sub japh {
		return "Just another Perl hacker,";
	}
}

1;
