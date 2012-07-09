#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;

=pod

=encoding utf-8

=head1 사용자 입력 가져오기

사용자의 입력을 받을때는 줄단위 입력연산자인 <STDIN> 을 사용할 수 있다. 
생겨먹은게 마치 FILEHANDLE 처럼 생겼다. 그리고 실제로도 표준입력을 
의미하는 파일핸들이다.

좀더 자세한 내용은 같은 책의 Ch5 "입력과 출력" 장에서 자세히 언급되어있다.

사용법은, 스칼라값을 요구하는 곳에서 <STDIN> 을 사용할 때마다, 
표준입출력을 통해, 첫 줄바꿈을 만날때까지 읽어들인다. 
다시말하자면, 줄바꿈 문자가 들어올때까지 계속 대기상태로 기다리게 된다.

	my $name = <STDIN>;

=head2 줄바꿈 문자열의 삭제, C<chomp>

단, 이렇게 입력받은 문자열은 줄바꿈 문자열까지 포함하게 되는데, 
대개 줄바꿈 문자열까지는 필요없으므로 C<chomp> 연산자로 떼어내게 된다.

	my $name = <STDIN>;
	chomp($name);

C<chop> 연산자가 사실 따로 존재한다.
문자열의 맨 마지막 글자를 떼어내는 연산자인데, C<chmop> 는, 
마지막글자가 줄바꿈 문자일 경우에만 한정하여 떼어내는것이 다르다.

입력단위를 인식하는 단위가 줄바꿈이라서 이렇게 입력되는데, 
전역변수인 C<$/> 나 C<$RS> 의 특수변수를 수정하면 다른 기호를 
입력단위로도 사용할 수 있다.

보통, 입력글자가 인식가능한 글자라면 제대로 chomp 는 작동하겠으나, 
만약 사용자가 줄바꿈 문자를 C<undef> 나 숫자로 바꾸게 된다면, 
chomp가 제 역할을 못할것이다.


참고로, 줄바꿈 문자가 숫자(정확히는 \123 같은 숫자상수의 레퍼런스) 
인 경우라면, 해당 숫자 바이트만큼만 읽는것을 뜻한다.


함수이기 때문에 반환값이 존재하는데, 그 값은 삭제한 문자의 갯수이다.
문자열이 두개, 혹은 그 이상의 줄바꿈 문자로 끝난다면, chomp 는 
하나의 줄바꿈 문자만 제거한다.

만약 줄바꿈 문자가 없다면 아무것도 하지 않으며 0을 반환할 것이다.

=cut

chomp(my $line = <STDIN>);
print $line;

say "-----------------";


# 만약 줄바꿈 문자를 바꾸었다고 가정해보자,
# 아래의 예제에서는 'z' 로 줄바꿈 문자를 바꿨고,
# 입력이 abcd z efg z hijk .... 처럼 입력할때
# 제일 처음 만나게되는 줄바꿈 문자 이후로 모두 잘라버릴것이다.
{
	local $/ = "zz";
	chomp(my $line = <STDIN>);
	say $line;
}
