#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;

=pod

=encoding utf-8

=head1 문자열 내에서 배열의 보간

스칼라와 마찬가지로 배열값도 큰 따옴표로 둘러싼 문자열 안에서는 보간이 
일어난다.

	my @rocks = qw { flinstone slate rubble };

	# 재밌는건 보간이 일어날때와 변수를 출력할때 결과가 다르단건데,
	# 보간이 일어날때는 각 요소마다 자동으로 공백이 삽입된다.
	# 변수만 출력하는 경우에는 요소들이 줄줄이 붙어서 나온다
	say "quarts @rocks limestone\n";
	say @rocks;

=cut

my @rocks = qw { flinstone slate rubble };
say "quarts @rocks limestone\n";
say @rocks;

=pod

즉, 이메일 주소같은걸 그냥 쓰면 이것을 배열변수로 읽을 수 있다.

	my $email = "fred@bedrock.edu"; # @bedrock 을 보간하려 할것임 [X]

	my $email = "fred\@bedrock.edu"; # 백슬러시로 보간방지 [O]
	my $email = 'fred@bedrock.edu'; # 작은따옴표로 보간방지 [O]

=cut


=pod

다음의 코드에서, 첨자를 접근할때의 상황을 생각해보자, 
배열의 요소에 접근할때도 보간이 일어나게 되는데,

	my @fred = qw(hello dolly);
	my $y = "2*4";
	say $fred[$y-1];

가령 이 경우에는 문자열인 C<$y> 가 숫자를 기대하는 C<-> 연산자를 만나면
2를 반환하기때문에, 결과적으로는 $fred[2-1] 과 같은 형태가 될것이다.

=cut 


my @fred = qw(hello dolly);
my $y = "2*4";
say "This is $fred[$y-1]'s house";


=pod

변수 보간시, 다른 변수와의 혼동을 피하고 싶다면, 명확하게 변수의 범위를 
지정하여 회피할 수 있다.

=cut

# 분명, @fred와 $fred는 다르다..
my @fred = qw (eating rocks is wrong);
my $fred = "right";

# 그러나 $fred[0] 과 같은 형태로 접근한다면,
# 결코 $fred 에는 접근할 수 없게될것이다.
say "this is $fred[3]\n";

# 만약 $fred 에만 접근하고 싶다면, 다음과 같이 표현할 수 있다.
say "this is ${fred}[3]";
say "this is $fred"."[3]";
say "this is $fred\[3]";


