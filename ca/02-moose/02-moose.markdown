# Moose #
## Introducció ##

*   Construït damunt del sistema d'objectes de Perl 5.
*   Pren característiques d'altres llenguatges com Smalltalk, Common Lisp i Perl 6.
*   La forma més moderna de programar amb objectes en Perl modern.
*   Té sabors alternatius: `Mouse`, `Moo`, `Mo`.

### Classes, mètodes i atributs ###

Llista 18333src:cat.pl

### Hello, world! ###

Llista 18333src:lib/2.00/HelloWorld.pm

Llista 18333src:hello5.pl

### Hello, world! _accessible_ ###

Llista 18333src:lib/2.01/HelloWorld.pm

Llista 18333src:hello6.pl

## Modificadors de mètodes ##

### before, after, around ###

    package Cat {
        # ...

        before 'age' => sub {
            my $self = shift;

            die "cannot ask for " . $self->name . " age"
                unless $self->doesnt_care;
        };

        after 'age' => sub {
            warn "too late to care\n";
        };
    }

    package HelloWorld {
        # ...

        around 'hello' => sub {
            my $orig = shift;
            my $self = shift;

            my $text = join q{ :: }, @_;

            return $self->$orig($text);
        };
    }

### super, override ###

    package CheaterKitty {
        # ...

        extends 'Cat';

        override 'age' => sub {
            my $self = shift;

            my $age = super();
            $age   /= 2
                if $age > 1;

            return $age;
        };
    }

### inner, augment ###

Llista 18333src:report.pl

## Subtipus i coercions ##

Llista 18333src:foo.pl

## Rols i trets ##

### Per què? ###

*   Objectes: què és el sistema.
    *   Com són els objectes.
    *   El model de dades és estable.
    *   Habitualment és necessari documentar-lo.
*   Rols: què fa el sistema.
    *   La lògica de negoci és canviable en el temps.
    *   Facilita la creació de tests.
    *   Eviten documentar els algorismes, el codi és la documentació.
    *   Els trets a Moose són rols composats en temps d'execució.
*   Vistes: interacció amb els usuaris.
    *   Diferents dispositius tenen entrades i sortides diferents.
    *   Aspectes diversos: presentació, blog, llibre, etc.
    *   Formats de sortida: HTML, text, ODT, PDF, etc.

### Composició de rols ###

Llista 18333src:lib/2.02/HelloWorld.pm

Llista 18333src:lib/2.02/Pet.pm

Llista 18333src:lib/2.02/Cat.pm

Llista 18333src:hello7.pl

## Delegació ##

Importa mètodes d'un atribut sense crear una relació d'herència o composició de rols:

    package Website {
        use Moose;

        has 'uri'   => (
            is      => 'ro',
            isa     => 'URI',
            handles => [qw( host path )],
        );
    }

## Constructors i destructors ##

Compte! No definiu cap mètode `new` ni `DESTROY`. Disposeu d'aquests mecanismes:

*   `BUILDARGS` abans de crear l'objecte.
*   `BUILD` després de crear l'objecte.
*   `DEMOLISH` durant la destrucció de l'objecte.

## Protocol de meta-objectes i immutabilitat ##

Tota aquest màgia és possible gràcies al MOP:

    my $meta = User->meta();
       
    for my $attribute ( $meta->get_all_attributes ) {
        print $attribute->name(), "\n";

        if ( $attribute->has_type_constraint ) {
            print "  type: ", $attribute->type_constraint->name, "\n";
        }
    }
         
    for my $method ( $meta->get_all_methods ) {
        print $method->name, "\n";
    }

Per optimitzar l'execució i per evitar que una classe canviï:

    __PACKAGE__->meta->make_immutable;

## Extensions de Moose ##

Algunes de les extensions recomanades a `Moose::Manual::MooseX`:

*   `Moose::Autobox`
*   `MooseX::StrictConstructor`
*   `MooseX::Params::Validate`
*   `MooseX::Getopt`
*   `MooseX::Singleton`

Altres extensions interessants:

*   `MooseX::Declare`
*   `MooseX::ClassAttribute`
*   `MooseX::Daemonize`
*   `MooseX::Role::Parameterized`
*   `MooseX::SemiAffordanceAccessor`
*   `MooseX::NonMoose`

