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
## Rols i trets ##
## Delegació ##
## Constructors i destructors ##
## Protocol de meta-objectes i immutabilitat ##
## Extensions de Moose ##
