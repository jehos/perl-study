#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;

=pod

=encoding utf-8

=head1 스칼라 이외의 반환값

목록문맥을 반환할 수도 있다.

=cut

sub listing {
	if ($_[0] < $_[1]) {
		return $_[0]..$_[1];
	} else {
		return reverse $_[1]..$_[0];
	}
}

my @c = listing(11,6);
say "@c";
