#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;

=pod

=encoding utf-8

=head1 shift 와 unshift 연산자

shift와 unshift는 거의 정확히 pop, push 의 반대역할이라고 볼 수 있다.
pop 과 push 가 배열의 끝에서 만 동작했다면, shift와 unshift는 
배열의 시작부분에서 영향준다고 생각할 수 있다.

    shift                         pop
            <===== @array =====>
    unshift                       push
                [ 이런느낌? ]

pop과 마찬가지로 shift를 계속했을때 underflow가 발생하면 undef를 반환한다

=cut

say my @array = qw( dino fred barney );
say my $m = shift(@array);
say my $n = shift @array;

say shift @array;

say unshift @array, 5;
say unshift @array, 1..4;
say my @others = 6..10;
say unshift @array, @others;

say @array;
