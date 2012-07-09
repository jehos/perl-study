#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;

=pod

=encoding utf-8

=head1 ch2-5 연습문제

프롬프트에서 문자열과 숫자를 별도의 줄에서 입력을 읽어들인 후,
숫자의 수 만큼 문자열을 다른 행에 출력하는 프로그램을 작성하세요.
(도움말: x 연산자를 사용하세요)

예를들어, "fred" 와 "3"을 사용자가 입력했다면, "fred"를 각 줄에 세번 
출력하는 결과가 나타납니다.

사용자가 "fred"와 "299792" 를 입력했다면 매우 많은 출력을 할 것입니다.

=cut


print "string : ";
chomp(my $string = <STDIN>);
print "how many? : ";

print "$string " x <STDIN>
