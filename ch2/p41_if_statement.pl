#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;

=pod

=encoding utf-8


=head1 boolean 값

모든 스칼라값은 if 제어 구조의 조건으로 사용할 수 있다.

펄에서는 true/false 과 같은 boolean 형이 따로 존재하지 않지만, 
몇가지 규칙으로  스칼라값의 주어진 값에 의해 참/거짓 을 판별하게 된다.

"The number 0, the strings '0' and "" , the empty list () , 
and undef are all false in a boolean context. 
All other values are true. Negation of a true value by ! or not returns a 
special false value. When evaluated as a string it is treated as "" , but 
as a number, it is treated as 0. 
Most Perl operators that return true or false behave this way."

* 주어진 값이 숫자일때, 0은 거짓입니다. 그외의 숫자는 참입니다.

* 주어진 값이 문자열 일때, 빈 문자열 C<' '> 은 거짓입니다.
그 이외의 다른 모든 문자열은 참입니다.

* 주어진 값이 숫자나 문자열이 아닌 다른 종류의 스칼라 값인 경우, 이를 숫자나 문자열로 변환하여 다시 참, 거짓을 판단합니다.

* 정리하자면, 오직 숫자 0 혹은 ' ' 빈 문자열의 경우만이 거짓이다.
그러나 유일한 예외가 있는데, '0' 도 문자열'0' 으로 취급되어 참일 것 같지만 
이것도 거짓이다.


=cut


=head1 if 제어구조

C에서 제공되는 if문 구조와 거의 비슷하다, 
boolean 값을 판단하여 블록안쪽의 코드를 수행한다.

	if (EXPR) BLOCK
	if (EXPR) BLOCK else BLOCK
	if (EXPR) BLOCK elsif (EXPR) BLOCK ...
	if (EXPR) BLOCK elsif (EXPR) BLOCK ... else BLOCK

C에서는 제어구조 내에 위치한 코드가 한줄짜리 라면 굳이 블록으로 
묶어주지 않아도 동작했지만 펄에서는 반드시 블록을 묶어줘야 한다.


	$is_bigger = $name gt 'fred';
	if ($is_bigger) {
		# $is_bigger 가 참일 때 수행할 코드
	}

	다른 선택이 필요하다면 C<else> 와 C<elsif> 로 분기할 수 있다.

* 만약, 불리언값의 결과에 not (반대) 의 의미를 덧붙이고 싶다면, 
단항연산자인 C<not> 연산자나 C<!> 기호를 활용할 수 있다.

	if (! $is_bigger) {
		#is_bigger 가 참이 아닐때 블록안을 수행한다
	}

=cut


my $name = 'freda';

if ($name gt 'fred'){
		say "정렬순서로 보면, '$name'은 'fred' 뒤에 있습니다.";
} else {
		say "'$name' 은 'fred' 뒤에 있지 않습니다";
		say "사실 같은 문자열 일 수도 있습니다";
}



=head2 SEE ALSO

L<< 복합 문장(Compound Statements)|
http://perldoc.perl.org/perlsyn.html#Compound-Statements >>
