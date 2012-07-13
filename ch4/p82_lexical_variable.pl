#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;

=pod

=encoding utf-8

=head1 렉시컬(Lexical) 변수 선언을 위한 C<my>

C<my> 는 변수를 블록내에서만 사용할 수 있도록 선언해주는 함수이다.
이 선언이 변수에 붙으면, 해당변수의 scope 는 해당 블록 내로 한정된다.

변수의 범위를 최소한으로 제한하면 예측범위를 좁히기 좋다.
C<my> 는 할당문의 문맥을 변경하지 않는다.
my 연산자 빼고 생각하는것과 동일함

	my($num) = @_;	# 목록문맥으로, ($num) = @_; 과 동일함
	my $num = @_; # 스칼라문맥으로, $num = @_; 과 동일함

한번에 다수의 렉시컬 변수를 선언하기 위해서, 괄호로 묶어줄 수 있다.

	my($fred, $barney);	# $fred 와 $barney 를 렉시컬변수로 선언

괄호는 문맥에 따라 때때로 의미가 다르다는것을 유의하자.
위의 두 예제가 그러한 상황을 잘 말해준다.

=cut

{
	my ($fred, $barney);
	my @list
}
