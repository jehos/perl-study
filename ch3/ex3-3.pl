#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;

=pod

=encoding utf-8

=head1 ch3-3 연습문제

입력의 끝까지 (줄로 구분된) 문자열 목록을 읽는 프로그램을 작성합니다. 
그리고 아스키 문자 순서로 출력합니다. 다시말해서, 만약에 fred, barney, wilma, 
betty 문자열을 입력하면, 출력은 barney betty fred wilma 가 될 것입니다. 

모든 문자열이 하나의 줄 또는 여러줄로 출력되나요? 다른모양으로 출력되나요?

	my @friends = <STDIN>;
	@friends = sort @friends;
	print "@friends";

	--입력--
	bcd
	cdf
	asd
	--출력-
	asd
	 bcd
	 cdf

출력에서 한줄씩 내려가 있고, 동시에 한칸씩 밀린모습을 하고 있는데, 
이것은 함께 입력되는 단어에 줄바꿈 문자가 같이 있는 경우이다.

=cut


my @friends = <STDIN>;
@friends = sort @friends;
print "@friends";


=pod

이를 막기위해서는 chomp 연산자를 통해 줄바꿈 문자를 삭제해주면 된다


	chomp(@friends = <STDIN>);
	@friends = sort @friends;
	print "@friends";

	--입력--
	bcd
	cdf
	asd
	--출력--
	asd bcd cdf

=cut

chomp(@friends = <STDIN>);
@friends = sort @friends;
print "@friends";
