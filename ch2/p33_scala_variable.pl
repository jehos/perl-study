#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;

=pod

=encoding utf-8

=head1 스칼라변수

하나의 값을 갖는 가장 간단한 자료형이다. 
C<$> 로 시작하는 변수명을 가지며, 대소문자를 구분한다. 
C<$&> 형태로 스칼라를 레퍼런스 형태로 참조하게 할 수도 있다. 

=over

=item 쉘에서의 차이점

쉘에서도 변수명에 C<$> 를 붙여 사용하지만, 
처음 변수할당할때엔 C<$>를 붙이지 않는것이 차이점이다.

=item 적절한 변수이름의 선택

사용목적을 알 수 있는 것으로 변수명을 정하면 좋다.
$ARGV 처럼 모두 대문자로 이루어져 있으면 특별한 변수이다. (파일핸들같은)

변수명으로 많이 쓰는 형식으로 L<< 헝가리안 표기법|http://en.wikipedia.org/wiki/Hungarian_notation >> 이 있고, 
가독성을 위해 밑줄을 연결해 구분하거나, 낙타등 표기법(camel-case) 으로 구분하기도 한다.

헝가리안 표기법은 기능에 따라 변수명의 prefix를 정하는 방법으로, 
변수명만 봐도 어떤 변수명인지 확연히 알 수 있어 익혀놓는것이 좋겠다.

=back

=cut 

# Hungarian notaion example
my $lAccountNum;	#long integer값이 들어가는 변수


# Case-Sensitive example
my $Fred = undef;
my $FRED = undef;

say "$Fred";
say "$FRED";


=over

=item 스칼라 변수의 할당

할당을 위해 등호 C<=> 를 사용한다. 
왼쪽(L-Value, 주소를 가지고 있는 값)에는 변수이름을, 
오른쪽(R-Value, 주소를 가지고 있지 않은값)에는 
값을 나타내는 표현식(expression)을 사용한다. 

	$fred = 17;				# $fred 에 17 할당
	$barney = 'hello';		# $barney 에 다섯 문자로 이루어진 'hello' 문자열 할당
	$barney = $fred + 3;	# $fred 의 현재값에 3을 더한 값(20)을 $barney에 할당
	$barney = $barney * 2;	# $barney 에 $barney * 2 한 값인 40을 할당

=item 스칼라 변수 할당과 사용에 있어서 특이사항

C<use warnings;> 옵션을 켰을경우, 변수의 scope를 명확히 지정해 주어야 했다.

	say "my $Fred";

	Global symbol "$Fred" requires explicit package name at ./p33_scala_variable.pl line 36.
	Global symbol "$FRED" requires explicit package name at ./p33_scala_variable.pl line 37.

이러면 안되는것같다... 귀찮아도 선언과 사용이 구분되어야 할것같다. 

	my $Fred= undef;
	say "$Fred";

=back


=cut
