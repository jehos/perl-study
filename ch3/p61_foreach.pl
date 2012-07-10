#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;

=pod

=encoding utf-8

=head1 foreach 제어구조

배열이나 목록을 통째로 처리하기 위한 제어구조, 반복문을 한번씩 
순회할때마다 목록의 요소들을 하나씩 이용한다.

또한, 만약 반복문 이전에 제어변수가 어떤 값으로 초기화 되어있었다면, 
반복문이 끝난 후 제어변수는 본래의 값을 가진다.

	say my $rock = "Rock'n Roll!";

	foreach $rock (qw / bedrock slate lava /) {
		say "one rock is $rock";
	}

	say $rock;
	
=cut

say my $rock = "Rock'n Roll!";

foreach $rock (qw / bedrock slate lava /) {
	say "one rock is $rock";
}

say $rock;

=pod

단, 이때 참고되는 목록은 복사본이 아니라 실제의 레퍼런스 이기 때문에,
순환중에 이 목록의 요소를 변경한다면 기대하지 않은 동작이 나올수도 있다.

	my @rocks = qw / bedrock slate lava /;
	foreach $rock (@rocks) {
		$rock = "\t$rock";
		$rock .= "\n";
	}
	print "The rocks are: \n",@rocks;

=cut

my @rocks = qw / bedrock slate lava /;
foreach $rock (@rocks) {
	$rock = "\t$rock";
	$rock .= "\n";
}

print "The rocks are: \n",@rocks;

