# Sistema d'objectes de Perl 5 #

La base del sistema d'objectes són els mòduls (o paquets).

## Mòduls ##

*   Reutilització
*   Separació
*   ...

### Espai de noms ###

    Foo::Bar

    Foo/Bar.pm

### Cerca ###

    perl -V

    PERL5LIB

    use lib '/path/to/lib';

    our @INC;

### Quin aspecte tenen ###

Antigament es feien d'aquesta manera:

    package HelloWorld;

    # ...

    1;

A partir de Perl 5.14 ja es poden fer d'aquesta altra:

    package HelloWorld {
        # ...
    }

### Com s'utilitzen ###

    use Modern::Perl '2012';

    package HelloWorld {
        sub hello {
            say "Hello, world!";
        }
    }
        
    # package main {
        HelloWorld::hello();
    # }


### Com es defineixen ###

Aquesta és la definció d'un mòdul menys senzill:

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

### Crida a les funcions del mòdul ###

    use HelloWorld;

    hello();
    HelloWorld::japh();

### Importació de símbols ###

    use HelloWorld qw( japh );

    # hello(); => FAIL
    japh();

### require vs. use ###

`require`...

*   s'avalua en temps d'execució,
*   un sol cop,
*   inclou el resultat al context actual.

`use` fa el mateix però...

*   s'avalua en temps de compilació,
*   només admet _barewords_ com a nom del mòdul,
*   sense `eval` no es poden utilitzar variables pel nom.

### use vs. no ###

`use Module;`

    BEGIN { require Module; Module->import(); }

`use Module ();`

    BEGIN { require Module; }

`use Module LIST;`

    BEGIN { require Module; Module->import( LIST ); }

`no Module LIST;`

    BEGIN { require Module; Module->unimport( LIST ); }

## Classes, mètodes i atributs ##
## Herència ##
