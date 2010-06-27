package MyAppFail::FailTest;

use strict;
use base qw(App::CLI::Command);

sub run {

    my($self, @args) = @_;
    die "dying message\n";
}
1;

