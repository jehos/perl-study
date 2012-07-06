#!/usr/bin/env perl

use 5.010;
use warnings;
use strict;

=pod

=encoding utf-8

=head1 비교연산자

참, 또는 거짓을 반환하는 비교연산자로써, 펄은 비교연산자가 2개로 나뉜다,

=over

=item 숫자를 비교하는 비교연산자

------------------------------

* 의미		숫자		문자열

* 같음	 	C<==>		C<eq>

* 같지않음	C<!=>		C<ne>

* 작음		C<<>		C<lt>

* 큼			C<< > >>		C<gt>

* 작거나 같음	C<<=>		C<le>

* 크거나 같음	<>=>		C<ge>

------------------------------

=item 문자열의 비교(stringwise)

문자열의 비교는 ascii 코드표의 순서대로인데, 예를들면 a 가 A 보다 크다.

	0 < 1 < 10 < 11 < 12 < 13 < 2 < 3 < 4 < 5 < 6 < 7 < 8 < 9
	A < a < aA < aa < ab < ac < ad .... 

첫글자 비교하고 다음글자.. 하는식으로 생각하면 편하다.

=back

=cut

say 1 != 0;
say 35 == 35.0;
say '35' eq '35.0'; # False
say 'a' gt 'A';
say 'A' lt 'a';
say 'aA' lt 'aa';
