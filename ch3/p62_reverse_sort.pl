#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;

=pod

=encoding utf-8

=head1 reverse 연산자

배열을 역순으로 취한 목록을 결과로 반환한다. 
중요한점은, 변수에는 손대지 않고 목록만 반환하는데, 
다시말하자면, reverse 된 값을 저장하지 않는다면 소용이 없다는 말이다

	# @list 에 반환하는 값을 reverse 만 한다
	say reverse @list = 1..10; # 10987654321

	# 사실 @list는 원래 할당된 순서대로 저장되어 있다.
	say @list; # 12345678910


=cut

my @list;

say reverse @list = 1..10; # 10987654321
say @list; # 12345678910



=head1 sort 연산자

ascii 문자열 순서대로 정렬한다. 
단, 숫자나 특수기호도 ascii 코드표대로 정렬하기 때문에, 
예상했던 정렬순과는 다소 달라보일 수 있다.

sort 도 reverse의 경우처럼 정렬된 목록을 반환하기때문에, 
어디라도 저장하지 않으면 소용이 없다.

reverse는 목록의 순서를 역순으로 하여 반환하지만, 
sort는 ascii 코드값의 순서대로 '정렬'을 한다는것이 다르다.

=cut

	say sort @list = 1..10; # 10987654321
	say @list; # 12345678910
