# Pràctica #

A partir de la classe `HelloWorld`, dissenyeu un sistema de presentació de diapositives que pugui generar sortida en diferents formats.

*   Heu d'utilitzar `Moose`.
*   Separeu el què és el sistema del què fa amb `Moose::Role`.
*   Utilitzeu els patrons Model-Vista-Controlador (MVC) o Data-Context-Interaction (DCI).
*   El sistema ha de generar com a mínim una versió en HTML.
*   Opcionalment pot generar versions en ODF, PDF, etc.

## TMTOWTDI ##

Debat sobre les propostes:

*   Punts forts i punts febles.
*   Alternatives.

## Solució senzilla ##

Una classe `Doc` que composa el rol `HTML`.

### Composició estàtica de rols ###

Llista 18333src:lib/3.00/HTML.pm

Llista 18333src:lib/3.00/Doc.pm

Llista 18333src:doc1.pl

### Composició dinàmica de rols ###

Llista 18333src:lib/3.01/HTML.pm

Llista 18333src:lib/3.01/Doc.pm

Llista 18333src:doc2.pl

