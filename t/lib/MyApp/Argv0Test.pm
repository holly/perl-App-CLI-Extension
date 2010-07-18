package MyApp::Argv0Test;

use strict;
use base qw(App::CLI::Command);

sub run {

    my($self, @args) = @_;
    $main::RESULT = $self->argv0;
}
1;

