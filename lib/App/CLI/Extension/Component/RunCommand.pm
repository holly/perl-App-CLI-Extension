package App::CLI::Extension::Component::RunCommand;

=pod

=head1 NAME

App::CLI::Extension::Component::RunCommand - for App::CLI::Command run_command override module

=head1 VERSION

1.2

=cut

use strict;
use MRO::Compat;
use base qw(Class::Data::Accessor);

__PACKAGE__->mk_classaccessor("exit_value");

our $DEFAULT_FAIL_EXIT_VALUE    = 255;
our $DEFAULT_SUCCESS_EXIT_VALUE = 0;
our $VERSION                    = '1.2';

sub run_command {

	my($self, @argv) = @_;

	eval {
		$self->setup(@argv);
		$self->prerun(@argv);
		$self->run(@argv);
		$self->postrun(@argv);
	};
	if ($@) {
		chomp(my $message = $@);
		$self->errstr($message);
		$self->fail(@argv);
		if (!defined $self->exit_value) {
			$self->exit_value($DEFAULT_FAIL_EXIT_VALUE);
		}
	}
	$self->finish(@argv);

	if (!defined $self->exit_value) {
		$self->exit_value($DEFAULT_SUCCESS_EXIT_VALUE);
	}

	if (exists $ENV{APPCLI_NON_EXIT}) {
		no strict "refs";  ## no critic
		my $dispatch_pkg = $self->app;
		${"$dispatch_pkg\::EXIT_VALUE"} = $self->exit_value;
	} else {
		exit $self->exit_value;
	}
}

#######################################
# for run_command method
#######################################

sub setup {

	my($self, @argv) = @_;
	# something to do
	$self->maybe::next::method(@argv);
}

sub prerun {

	my($self, @argv) = @_;
	# something to do
	$self->maybe::next::method(@argv);
}

sub finish {

	my($self, @argv) = @_;
	# something to do
	$self->maybe::next::method(@argv);
}

sub postrun {

	my($self, @argv) = @_;
	# something to do
	$self->maybe::next::method(@argv);
}

sub fail {

	my($self, @argv) = @_;
	warn sprintf("default fail method. errstr:%s. override fail method!!\n", $self->errstr);
	$self->maybe::next::method(@argv);
}

1;

__END__

=head1 SEE ALSO

L<App::CLI::Extension> L<MRO::Compat>

=head1 AUTHOR

Akira Horimoto

=head1 COPYRIGHT AND LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

Copyright (C) 2009 Akira Horimoto

=cut

