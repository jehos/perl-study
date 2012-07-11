#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;

=pod

=encoding utf-8

=head1 기본변수 C<$_>

아무것도 입력하지 않으면 기본으로 입력되는 변수이다. 
다른 스칼라변수와 다를게 하나도 없으며, 명시적으로 언급하지 않을때 
몇몇 함수에서는 이 값을 기본 인자로 사용한다.

덕분에 새로운 변수를 생각해내려고 머리를 쥐어뜯지 않아도 된다...

	foreach (1..10){
		say;
	}

위의 예제코드에는 2개의 C<$_> 가 숨어있다. 
foreach 에서는 제어변수부분이 생략되어있는데, 이것이 묵시적으로는 
C<$_> 로 이해한다. 또한 say 에도 출력할 인자가 명시되지 않았는데, 
이때에도 역시 C<$_> 변수가 사용되는것으로 이해한다.

때문에 위의 코드는 정상적으로 1 부터 10까지 출력된다.


이러한 종류의 기본변수 (내지는 특수변수)들은 훨씬 더 많이 있다.
가령 C<@_> 도 그러한 변수중에 하나이다.

자세한 내용은 perldoc perlvar 에서...

=cut

foreach (1..10){
	say;
}
