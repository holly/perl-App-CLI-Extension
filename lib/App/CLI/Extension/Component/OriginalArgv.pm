package App::CLI::Extension::Component::OriginalArgv;

=pod

=head1 NAME

App::CLI::Extension::Component::OriginalArgv - for App::CLI::Extension original argv module

=head1 VERSION

1.3

=cut

use strict;
use base qw(Class::Data::Accessor);
use FindBin qw($Bin $Script);
use File::Spec;

our $VERSION  = '1.3';

__PACKAGE__->mk_classaccessor("_orig_argv");
__PACKAGE__->mk_classaccessor("argv0"      => $Script);
__PACKAGE__->mk_classaccessor("full_argv0" => File::Spec->catfile($Bin, $Script));

sub orig_argv {

	my $self = shift;

	my @array;
	if(scalar(@_) == 1 && ref($_[0]) eq "ARRAY"){
		@array = @{$_[0]};
	} elsif(scalar(@_) > 0) {
		@array = @_;
	}

	if (scalar(@array) > 0) {
		$self->_orig_argv(\@array);
	}
	return $self->_orig_argv;
}

sub cmdline {

	my $self    = shift;
	my $cmdline = join " ", $self->full_argv0, @{$self->orig_argv};
	return $cmdline;
}


1;

__END__

=head1 SEE ALSO

L<App::CLI::Extension> L<Class::Data::Accessor>

=head1 AUTHOR

Akira Horimoto

=head1 COPYRIGHT AND LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

Copyright (C) 2010 Akira Horimoto

=cut
