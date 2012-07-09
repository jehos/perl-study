#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;


=pod

=encoding utf-8

=head1

1. [5분!] 원의 반지름이 12.5 일때, 원주를 구하는 프로그램을 작성하세요,
원주는 2pi 에 반지름을 곱한 값입니다. (대략 3.141592654.... 에 2를 곱한값)
결과값은 78.5 입니다

	use Math::Trig ':pi';

	my $radius = 12.5;
	say my $circumference = 2*(pi) * $radius;

=cut

use Math::Trig ':pi';

print "반지름을 입력하세요 : ";
my $radius = <STDIN>;
if ( $radius < 0) {
	$radius = 0;
}
say my $circumference = 2*(pi) * $radius;

=over

=item 자릿수를 한정하는 방법?

예제를 풀어보면, 78.5398163397448 라는 숫자가 나오는데, 
특정 자릿수 이하로 한정지을 수 있는 방법은 없을까?
아예 정수화 하려면 use integer; 해버리면 되버리겠지만...

소숫점 몇번째 자리까지, 같은 방법으로 한정짓는 방법은 없을까?

가령, 출력할때는 C<sprintf> 같은 함수를 통해 format 을 이용할 수 있지만, 
그냥 일반 값을 한정짓고 싶다면?

그런데, 생각해보니 굳이 그렇게 일반값을 한정지을 경우가 있긴할까? 
보통 형변환이 일어날때 narrow conversion 일어나는 경우엔 
알아서 값이 깎여나갈텐데.. (물론 값손실에 대해 고려를 해야겠지만)

=back

=cut
