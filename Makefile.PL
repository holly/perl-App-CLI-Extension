use strict;
use warnings;

use inc::Module::Install 0.91;
# We use some dependencies here...
if ($Module::Install::AUTHOR) { # We could just use them, but telling
    my @fail;                   # people the set of things they need nicer
    foreach my $module (qw/
        Module::Install::AuthorTests
        Module::Install::Repository
    /)
    {
        push(@fail, $module)
            unless eval qq{require $module; 1;};
    }
    die("Module::Install extensions failed, not installed? \n"
        . join("\n", map { "  $_" } @fail) . "\n") if @fail;
}

name 'App-CLI-Extension';
all_from 'lib/App/CLI/Extension.pm';

requires
      "App::CLI"                 => '0.313',
      "Class::Accessor::Grouped" => '0.1',
      "UNIVERSAL::require"       => '0.13',
      "MRO::Compat"              => '0.11',
      "Error"                    => '0.17',
      "Readonly"                 => '2.0',
     ;
auto_set_repository;

test_requires 'Test::More';
tests 't/*.t';
author_tests 'xt';
WriteAll;
