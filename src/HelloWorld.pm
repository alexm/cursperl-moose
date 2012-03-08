use Modern::Perl '2012';

package HelloWorld {
	require Exporter;

	our @ISA       = qw( Exporter );
	our @EXPORT    = qw( hello );
	our @EXPORT_OK = qw( japh );

	sub hello {
		say "Hello, world!";
	}

	sub japh {
		say "Just another Perl hacker,";
	}
}
