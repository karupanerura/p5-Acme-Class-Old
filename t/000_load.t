#!perl -w
use strict;
use Test::More tests => 1;

BEGIN {
    use_ok 'Acme::Class::Old';
}

diag "Testing Acme::Class::Old/$Acme::Class::Old::VERSION";
