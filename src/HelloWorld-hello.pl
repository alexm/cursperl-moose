use 5.014;
use Modern::Perl '2012';

package HelloWorld {
	sub hello {
		return "Hello, world!";
	}
}
						        
# package main {
	say HelloWorld::hello();
# }
