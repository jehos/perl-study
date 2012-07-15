#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;

=encoding utf-8

=head1 영속적인 사설변수 할당을 위한 state

사용자 함수를 호출할때마다 변수가 매번 초기화되는것을 방지하기 위해
c<state> 를 활용하여 영속적인 변수로 만들 수 있다.

이것은 마치 C에서 static 변수를 선언하는것과 비슷한데,
함수를 호출할때마다 해당 변수의 값이 초기화되지 않고 보존된다.

단! 이것은 C<my> 처럼 렉시컬 변수를 선언해주는 것이기 때문에,
C<my> 와 함께 사용될 수 없다.

=cut

marine();
marine();

sub marine{
	state $n = 0;	# 전역변수 $n
	$n += 1;
	say "hello, sailor number $n";
}	


=head1 한계

현재 배열변수나 해쉬는 C<state> 를 사용할 수 없다

=cut
