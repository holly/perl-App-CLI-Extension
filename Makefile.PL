use inc::Module::Install;
name 'App-CLI-Extension';
author 'Akira Horimoto';
all_from 'lib/App/CLI/Extension.pm';

build_requires 'Test::More';
requires(
      "App::CLI"                 => 0,
      "Class::Accessor::Grouped" => 0,
      "UNIVERSAL::require"       => 0,
      "MRO::Compat"              => 0,
      "Error"                    => 0,
     );
use_test_base;
auto_set_repository;
auto_includes;
author_tests('xt');
WriteAll;
