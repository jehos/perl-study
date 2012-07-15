#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;


=encoding utf-8

=head1 ch4-1, 연습문제

숫자 목록의 총합을 반환하는 이름이 total인 사용자 함수를
작성하세요.

(도움말: 사용자 함수는 어떤 입출력(I/O) 도 수행하지 않도록 합니다.
간단히 매개변수를 처리한 후 결과값을 호출자에게 반환하도록 합니다)

다음 예제 프로그램을 실행해서 사용자 함수가 제대로 동작하는지
확인해보세요, 첫번째 숫자그룹을 모두 더하면 결과는 25입니다


=cut

my @fred = qw/ 1 3 5 7 9 /;
my $fred_total = total(@fred);

say "The total of \@fred is $fred_total.";

sub total {
	my $result = 0;
	foreach (@_){ 
		$result += $_;
	}
	return $result;
}

=head1 ch4-2, 연습문제

이전 연습문제의 사용자 함수를 이용해서 숫자 1부터 1000까지 합을 계산하라

=cut

say total(1..1000);

=head1 ch4-3, 연습문제

숫자 목록을 인자로 받아서, 평균값보다 큰 값들을 반환하는
&above_average 사용자 함수를 작성하세요.

(도움말: 숫자의 합을 숫자의 개수로 나누어서 평균값을 구하는
또다른 사용자 함수를 만드세요)

다음의 검사 프로그램을 이용해서 여러분이 만든 사용자 함수를 점검하세요

=cut

@fred = above_average(1..10);
say "\@fred is @fred";
say "(Should be 6 7 8 9 10)";

my @barney = above_average(100, 1..10);
say "\@barney is @barney";
say "(Should be just 100)";

sub above_average {
	my $avr = total(@_) / scalar @_;
	my @result;
	foreach (@_){
		if ($_ > $avr){
			push @result, $_;
		}
	}
	return @result;
}

