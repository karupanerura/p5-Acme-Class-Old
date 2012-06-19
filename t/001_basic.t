#!perl -w
use strict;
use warnings;
use utf8;

use Acme::Class::Old;
use Test::More tests => 3;
use Scalar::Util qw/refaddr/;

my $objA_1 = Hoge->new;
my $objA_2 = Hoge->old;

is refaddr($objA_1), refaddr($objA_2);

my $objB_1 = Hoge->new;
my $objB_2 = Hoge->old;

is refaddr($objB_1), refaddr($objB_2);

my $objA_3 = Hoge->old(-2);
is refaddr($objA_1), refaddr($objA_3);

package Hoge;
use strict;
use warnings;
use utf8;

sub new { bless +{} => +shift }
