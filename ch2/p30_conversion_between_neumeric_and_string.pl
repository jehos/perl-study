#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;

=pod

=encoding utf-8

=head1 숫자와 문자간의 자동변환

펄에서는 문맥에 따라 숫자와 문자열이 자동으로 변환되는데, 이것은 대개 연산자에 의해서 결정된다.

=cut

=head2 숫자를 원하는 연산자

=over

=item 사칙연산을 포함한 수치연산자들은 스칼라를 숫자로 해석하려고 시도한다. C<+>, C<->, C</>, C<*>, C<**>


	say "12" * "3"; -> 36 

=item 단, 숫자와 문자가 혼재한 문자열에서는 숫자값만 인식하고 나머지는 버린다.
만약 문자부터 오면 해당 스칼라의 수치값은 0 으로 취급

	say "12abcd34" * "3"; -> 36
	say "zz12abcd34" * "3"; -> 0

=item 단, 이렇게 숫자와 문자가 혼재하는 경우는 정상적인 경우가 아니므로,
use warnings; 옵션 사용하고 있다면 오류를 발생시킨다.

=back

=cut

say "12" * "3";

# 숫자와 문자열이 혼용되는 경우엔 맨앞의 숫자만 인식
say "12abcd34" * "3";

# 만약 문자부터 오면 해당 스칼라의 수치값은 0 으로 취급
say "zz12abcd34" * "3";

# 연산자간 결합법칙을 따른다
say "Z" . 5 * 7;


=head2 문자를 원하는 연산자

=over

=item 문자열을 붙이는 C<.> 연산자와 같은 연산자의 경우 해당스칼라를 문자열로 인식한다.

	say "12" . "34"; -> "1234"

=back

=head2 수치연산자와 문자연산자가 혼재할경우

=over

=item 이 경우에는 L<< 연산자간 우선순위|http://perldoc.perl.org/perlop.html#Operator-Precedence-and-Associativity >> 을 따른다.

	say "Z" . 5 * 7; -> "Z35"

좀 뜬금없긴한데, 이부분 pod2html 할때 문제발생 -> L<< 연산자간 우선순위|perlop/"Operator Precedence and Associativity" >>

=back

=cut

say "12" . "34"; 
