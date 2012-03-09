# Sistema d'objectes de Perl 5 #

La base del sistema d'objectes són els mòduls (o paquets).

## Mòduls ##

*   Reutilització
*   Separació
*   ...

### Espai de noms ###

    Foo::Bar
    Foo/Bar.pm

### On es busquen ###

    $ perl -V
    $ export PERL5LIB=/path/to/lib

    our @INC;
    use lib '/path/to/lib';

### Quin aspecte tenen ###

Abans es feien d'aquesta manera:

    package HelloWorld;
    # ...
    1;

A partir de Perl 5.14 ja es poden fer d'aquesta altra:

    use 5.014;

    package HelloWorld {
        # ...
    }

### Com s'utilitzen ###

Llista 18333src:HelloWorld-hello.pl

### Com es defineixen ###

Aquesta és la definció d'un mòdul menys senzill:

Llista 18333src:HelloWorld.pm

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
*   sense `eval` no es poden utilitzar variables pel nom.

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
## Herència ##
