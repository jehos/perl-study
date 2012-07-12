#!/usr/bin/env perl

use 5.010;
use warnings;
use strict;

=pod

=encoding utf-8

=head1 pop 과 push 연산자

배열의 첨자를 이용하지 않고, 마치 스택처럼 pop과 push 를 활용해 
각 요소에 접근할 수 있다.

사실 배열은 스택과 동일하게 사용할 수 있고, 펄에서는 기본적으로 
배열을 스택처럼 사용할 수 있는 연산을 제공하는데, pop 과 Push 이다.


=over

=item pop

	my @array = 5..9;

	my $fred = pop (@array);
	my $barney = pop @array;


=cut

say my @array = 5..9;

say my $fred = pop (@array);
say my $barney = pop @array;

# 빈문맥
say pop @array;

# 남은 목록
say @array;

=pod

이렇게 계속 빼다가 underflow 가 발생하면 undef를 반환할것이다

=item push

	push(@array, 0);
	push @array, 8;
	push @array, 1..10;
	@others = qw / 9 0 2 1 0 /;
	push @array, @others;


=item push 와 pop을 사용시 주의점

push할때 첫번째 인자값과, pop 할때 하나오는 인자는 반드시 
배열'변수'이어야 한다. 목록상수나 그런거 넣으면 에러낸다. 
목록상수는 불변하는 상수이니까 당연히 안되는게 맞다.

=back

=cut

my @array = ();

say push(@array, 0);
say push @array, 8;
say push @array, 1..10;

say my @others = qw / 9 0 2 1 0 /;
say push @array, @others;

say @array;

=head1 shift
