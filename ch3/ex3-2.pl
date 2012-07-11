#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;

=pod

=encoding utf-8

=head1 ch3-2 연습문제

입력의 끝까지(줄로 구분된) 숫자목록을 읽고, 아래의 목록으로부터 각 숫자에 
대응하는 사람의 이름을 출력하는 프로그램을 작성하세요, 
(이름의 목록을 여러분의 코드상에 넣습니다).

예를 들어, 입력 숫자들이 1, 2, 4, 2 라면, 
출력이 fred, betty, dino, betty 가 될 것입니다.

=cut

my @friends = qw/ fred betty dino wilma /;
my @order = <STDIN>;

foreach (@order){ 
	say $friends[$_-1] if $_ > 0;
}
