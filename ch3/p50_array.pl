#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;

=pod

=encoding utf-8

=head1 목록(list), 배열(array)

목록(list)과 배열(array)은 혼용해서 사용하고있지만, 
둘은 다음과 같은 차이를 보인다.

	@array = (1,2,3,4);

C<@array> 는 배열변수이고, 뒤따라 오는 (1,2,3,4) 는 목록이다.
다시말하자면, B<목록은 데이터이고, 배열은 변수이다>

이 배열변수와 목록데이터는 각각 스칼라값을 가진 스칼라변수이며, 
이 값들은 모두 순서를 가지고 있다.

각 원소는 독립적인 스칼라변수 이기 때문에 다양한 값을 가질 수 있지만, 
보통은 같은 유형의 원소를 갖는것이 일반적이다. 

배열의 원소에 접근하기 위해서는 숫자로 된 첨자로 접근이 가능하다.

	my @array;
	$array[0] = 1;
	$array[1] = 2;
	$array[2] = "a";
	$array[3] = "b";

여기서 헷갈릴 수 있는것이, @array의 각 원소에 접근하기 위해 $array[x] 의 
형태를 쓰는데, 이것은 $array 가 아니라는것이다.

	$array != $array[0]

네임스페이스가 다르기 때문에 아예 둘은 다른 존재다. 
그러나 사용할 수 있다고 해서 사용해서는 안되는데, 헷갈리기 때문이다. 하지마.

추가로, 첨자값엔 어떤 숫자값이라도 들어갈 수 있다. 
정수가 아니라면 내림한 정수값으로 자동변환 한다.

첨자가 배열의 밖을 가르킨다면, C<undef> 를 리턴시킨다. 
즉, 그 값에 값을 저장한 적 없으면 그 값은 C<undef> 이다.

특정배열의 마지막 배열첨자를 알기위해 C<$#> 라는 표현을 쓸 수 있는데, 
이를통해 해당 배열의 마지막 요소에 접근 할 수 있다.

	my @array = (1,2,3,4,5....);
	say $#array; # 배열의 마지막 첨자
	say $array[$#array]; # 배열의 마지막 요소

단, 배열첨자는 0부터 시작하기 때문에 C<$#>는 배열의 갯수를 나타내진 않는다. 
마지막 배열첨자와 배열의 요소갯수는 일치하지 않는다.

	$rock[1] = "bedrocks";
	$rock[2] = "slate";
	$rock[3] = "lava";
	$rock[99] = "schist";

맨 마지막 첨자에 접근하고 싶을때 더 간단한 방법이 있는데, $array[-1] 과 
같은 형태로 접근이 가능하다. 물론 -2, -3 ,-4 ... 도 접근은 가능하지만, 
맨 마지막 첨자에 접근하는 용도 이외로는 잘 사용하지 않는다.

=cut

my @fred;
$fred[0] = "yabba";
$fred[1] = "dabba";
$fred[2] = "doo";
say @fred;

$fred[1] = "diddley";
$fred[2] = "whatsis";
say @fred;

my $number = 2.71828;
say $fred[$number];	# 첨자인 $number값은 정수로 내림하여 인식


my $blank;
$blank = $fred[1000]; # return undef
$blank = my $un_used_variable; # return undef

my @rock;
$rock[1] = "bedrocks";
$rock[2] = "slate";
$rock[3] = "lava";
$rock[99] = "schist";
# 이 경우, 마지막 첨자는 99이지만 배열의 갯수가 100개라고는 할 수 없다.
say $rock[$#rock]; # return last element


=head1 목록상수( literal list )

쉼표로 구분한 값의 목록을 괄호로 둘러싼 것이다. 
그러나 그냥 괄호만 둘러쳐도 목록으로 인식한다.

	(1,2,3,4) # 목록이다
	(1,2,3,4,) # 물론 목록이다
	("fred", 4.5) # 당연히 목록이다
	(1..100) # 1~100 까지의 범위 목록이다
	(1)	# 이것도 목록이다
	( ) # 심지어 목록이다


=over

=item C<..> 연산자에 대하여

범위연산자이다, 왼쪽의 스칼라값에서부터 오른쪽 스칼라값까지 1씩 증가한다.

	(1..5)		# (1,2,3,4,5) 와 같다
	(1.7..5.7)	# (1,2,3,4,5) 와 같다.
				# 소숫점 아래의 값은 버려진다
	(5..1)		# 빈목록, 오직 작은값에서 큰값으로만 셉니다.
	(0, 2..6, 10, 12) # (0,2,3,4,5,6,10,12)
	($m..$n)	# $m 과 $n의 현재 값으로 범위를 결정합니다,
	(0..$#rocks) # 앞에서 나왔던 @rocks 배열의 첨자입니다.

목록상수의 원소는 반드시 상수여야 하는것은 아니며, 
상수를 사용하는 시점에 매번 새롭게 연산하는 표현식일 수 있다.

	($m, 17)	# 두개의 값, $m 의 현재값과 17 로 구성
	($m+$o, $p+$q)	# 마찬가지로 두개의 값

요점은, 목록은 어떠한 스칼라값도 가질 수 있다는것.

=back

=cut

=head1 qw(Quote Word) 단축표현

문자열 목록 입력할일이 매우 많기 때문에 단축표현인 C<qw> 가 유용하게 쓰인다.

	qw( fred barney betty wilma dino )

이렇게 인식되는 문자열은 작은따옴표 문자열로 인식한다. 
qw 는 인용을 나타내기때문에 주석을 사용할 수 없다. 
또한 공백문자 또한 삭제되기 때문에 다음과 같이 깔끔하게 정리할 수도 있다

	qw (fred
		barney
		betty
		wilma
		dino)

qw 를 둘러싸고 있는 구분자 쌍은 서로 다를 수 있는데, 
만약 여는 구분자가 '왼쪽' 문자중에 하나라면 '오른쪽' 문자는 닫는문자로 
활용된다.

	qw! fred barney betty wilma dino !
	qw/ fred barney betty wilma dino /
	qw# fred barney betty wilma dino #	# 주석과 같은기호?!
	qw( fred barney betty wilma dino )
	qw{ fred barney betty wilma dino }
	qw< fred barney betty wilma dino >

만약 안에 들어가는 문자열 중 하나가 구분자와 동일하다면 다른 구분자로 
바꿔야 할것이다. 만약 바꾸지 못한다면, 작은따옴표에서 배웠던것을 상기하여, 
역슬래시를 사용해서 닫는 구분자를 문자열 안에 포함시킬 수 도 있다.

	qw! yahoo\! google as msn !

이와 마찬가지로, 역슬래시 자체를 표현하고 싶을땐 C<//> 를 포함시킨다

	qw! if you want show backslash, \\ !

=cut

say qw! fred barney betty wilma dino !;
say qw/ fred barney betty wilma dino /;
say qw# fred barney betty wilma dino #;
say qw( fred barney betty wilma dino );
say qw{ fred barney betty wilma dino };
say qw< fred barney betty wilma dino >;

say qw! yahoo\! !;
say qw/ \\ /;
