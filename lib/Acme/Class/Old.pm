package Acme::Class::Old;
use 5.008_001;
use strict;
use warnings;
use utf8;

our $VERSION = '0.01';

use Carp qw/croak/;

my %HISTORY = ();
BEGIN {
    *CORE::GLOBAL::bless = sub {
        my($self, $class) = @_;
        CORE::bless $self => $class;

        push @{ $HISTORY{$class} } => $self;

        return $self;
    };

    sub UNIVERSAL::old {
        my $class = shift;
        my $how_meny_old = shift || -1;

        my $self = $HISTORY{$class}[$how_meny_old];
        croak "At that time'll not stay unborn. baby." unless $self;
        return $self;
    }
};

END {
    foreach my $class (keys %HISTORY) {
        foreach my $obj (@{ $HISTORY{$class} }) {
            undef $obj;
        }
    }
};

-1;
__END__

=head1 NAME

Acme::Class::Old - Perl extention to do something

=head1 VERSION

This document describes Acme::Class::Old version 0.01.

=head1 SYNOPSIS

    use Acme::Class::Old;
    use HogeClass;

    my $obj = HogeClass->new;
    my $old = HogeClass->old; ## old object!!

=head1 DESCRIPTION

# TODO

=head1 INTERFACE

=head2 Functions

=head3 C<< hello() >>

# TODO

=head1 DEPENDENCIES

Perl 5.8.1 or later.

=head1 BUGS

All complex software has bugs lurking in it, and this module is no
exception. If you find a bug please either email me, or add the bug
to cpan-RT.

=head1 SEE ALSO

L<perl>

=head1 AUTHOR

<<YOUR NAME HERE>> E<lt><<YOUR EMAIL ADDRESS HERE>>E<gt>

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2012, <<YOUR NAME HERE>>. All rights reserved.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
