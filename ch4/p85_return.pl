#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;

=pod

=encoding utf-8

=head1 return 연산자

사용자 함수에서 값을 바로 반환한다.
본래 사용자 함수에서 마지막에 연산한 표현식을 자동으로 반환하지만,
이렇게 되면 어느값이 반환값인지 눈으로 찾기가 어려워진다.

C<return> 으로 어느값이 리턴되는 값인지 명시하여 주는것이 좋다

=cut

my @names = qw / fred barney betty dino wilma pebbles bamm-bamm /;
say my $result = &which_element_is("dino", @names);

sub which_element_is {
	my ($what, @array) = @_;
	foreach (0..$#array) {
		if ($what eq $array[$_]){
			return $_;
		}
	}

	return -1 ;
}


