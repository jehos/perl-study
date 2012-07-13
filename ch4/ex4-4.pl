#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;

=encoding utf-8

=head1 ch4-4, 연습문제

인자로 입력한 이름의 사람에게 환영인사를 하되,
마지막에 인사한 사람의 이름도 같이 알려주는 greet 사용자 함수를 작성하세요

=cut


sub greet{
	state $last;
	unless ($last){
		say "Hi @_[0]! You are the first one here!";
		$last = @_[0];
	} else {
		say "Hi @_[0], $last is also here!";
		$last = @_[0];
	}
}

greet("Fred");
greet("Barney");
greet("wilma");
	
