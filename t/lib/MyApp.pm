package MyApp;

use strict;
use base qw(App::CLI::Extension);
use constant alias => (
                plugin      => "PluginTest",
                config      => "ConfigTest",
                stash       => "StashTest",
                argv0       => "Argv0Test",
                full_argv0  => "FullArgv0Test",
                orig_argv   => "OrigArgvTest",
                cmdline     => "CmdlineTest"
            );

$ENV{APPCLI_NON_EXIT} = 1;
__PACKAGE__->load_plugins(qw(+MyApp::Plugin::Greeting));
__PACKAGE__->config(yellow => "banana");

1;

