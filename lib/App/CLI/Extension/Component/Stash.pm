package App::CLI::Extension::Component::Stash;

=pod

=head1 NAME

App::CLI::Extension::Component::Stash - for App::CLI::Extension stash module

=head1 VERSION

1.422

=cut

use strict;
use warnings;
use base qw(Class::Accessor::Grouped);

our $VERSION  = '1.422';

__PACKAGE__->mk_group_accessors("inherited" => "_stash");
__PACKAGE__->_stash({});


sub stash {

	my ($self, @args) = @_;

	my %hash;
	if(scalar(@args) == 1 && ref($args[0]) eq "HASH"){
		%hash = %{$args[0]};
	} elsif (scalar(@args) > 1) {
		%hash = @args;
	}
	my @keys = keys %hash;
	if (scalar(@keys) > 0) {
		$self->_stash->{$_} = $hash{$_} for @keys;
	}
	return $self->_stash;
}

1;

__END__

=head1 SEE ALSO

L<App::CLI::Extension> L<Class::Accessor::Grouped>

=head1 AUTHOR

Akira Horimoto

=head1 COPYRIGHT AND LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

Copyright (C) 2009 Akira Horimoto

=cut

