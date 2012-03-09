use 5.014;

package HelloWorld 1.00 {
	use Exporter qw( import );

	our @EXPORT    = qw( hello );
	our @EXPORT_OK = qw( japh );

	sub hello {
		say "Hello, world!";
	}

	sub japh {
		say "Just another Perl hacker,";
	}
}
