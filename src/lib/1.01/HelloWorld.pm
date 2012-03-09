use 5.014;
use Modern::Perl '2012';

package HelloWorld 1.01 {
	use Carp qw( croak );

	sub new {
		my ( $class, %args ) = @_;

		my $obj = {
			hello => "Hello, world!",
			japh  => "Just another Perl hacker,",
			%args,
		};

		return bless $obj, $class;
	}

	sub hello {
		my $self = shift;

		return @_ ? $self->set_hello(@_) : $self->get_hello();
	}

	sub japh {
		my $self = shift;

		return @_ ? $self->set_japh(@_) : $self->get_japh();
	}

	sub AUTOLOAD {
		my $self = shift;
		my @args = @_;

		our $AUTOLOAD;
		my ($method) = $AUTOLOAD =~ /::(\w+)$/;

		if    ( $method =~ /^get_(\w+)/ && exists $self->{$1} ) {
			return $self->{$1};
		}
		elsif ( $method =~ /^set_(\w+)/ && exists $self->{$1} ) {
			my $new_value = $args[0];
			my $old_value = $self->{$1};
			$self->{$1}   = $new_value;

			return $new_value;
		}
		else {
			croak "Bad method name <$method>!";
		}
	}

	sub DESTROY { }
}

1;
