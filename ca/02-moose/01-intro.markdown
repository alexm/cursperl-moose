# Sistema d'objectes de Perl 5 #

La base del sistema d'objectes són els mòduls (o paquets).

## Mòduls ##

Com en qualsevol altre llenguatge permeten:

*   reutilització
*   separació
*   encapsulament
*   ...

### Espai de noms ###

    use Foo;
    say $INC{'Foo.pm'};
    # /path/to/lib/Foo.pm

    use Foo::Bar;
    say $INC{'Foo/Bar.pm'};
    # /path/to/lib/Foo/Bar.pm

### On es busquen ###

    our @INC;
    use lib '/path/to/lib';

    $ export PERL5LIB=/path/to/lib
    $ perl -V

### Quin aspecte tenen ###

Abans es feien d'aquesta manera:

    package HelloWorld;

    # our $VERSION = '1.00';

    use vars qw( $VERSION );
    $VERSION = '1.00';

    # ...

    1;

A partir de Perl 5.14 ja es poden fer d'aquesta altra:

    use 5.014;
    use Modern::Perl '2012';

    package HelloWorld 1.00 {
        # ...
    }

    1;

### Com s'utilitzen ###

Llista 18333src:HelloWorld-hello.pl

### Com es defineixen ###

Aquesta és la definició d'un mòdul més complex:

Llista 18333src:lib/1.00/HelloWorld.pm

### Crida a les funcions del mòdul ###

Llista 18333src:hello1.pl

### Importació de símbols ###

Llista 18333src:hello2.pl

### require vs. use ###

`require`...

*   s'avalua en temps d'execució,
*   un sol cop,
*   inclou el resultat al context actual.

`use` fa el mateix però...

*   s'avalua en temps de compilació,
*   només admet _barewords_ com a nom del mòdul,
*   sense `eval` no es poden utilitzar variables pel nom,
*   permet afegir una restricció de versió mínima del mòdul.

### use vs. no ###

    # use Module;
    BEGIN { require Module; Module->import(); }

    # use Module ();
    BEGIN { require Module; }

    # use Module LIST;
    BEGIN { require Module; Module->import( LIST ); }

    # no Module LIST;
    BEGIN { require Module; Module->unimport( LIST ); }

## Classes, mètodes i atributs ##

El mateix exemple d'abans...

Llista 18333src:lib/1.00/HelloWorld.pm

### Constructors, atributs, getters i setters ###

Els objectes són en realitat referències:

Llista 18333src:lib/1.01/HelloWorld.pm

### Instàncies ###

Llista 18333src:hello3.pl

### Accessors ###

Llista 18333src:hello4.pl

## Herència ##

    use 5.014;
    use Modern::Perl '2012';

    package Baz {
    	use parent qw( Foo Bar );
    }

    package Baz {
    	BEGIN {
        	require Foo;
        	require Bar;
        	push our @ISA, qw(Foo Bar);
    	}
    }

