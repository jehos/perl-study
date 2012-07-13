#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;


=encoding utf-8

=head1 앰퍼샌드C<&> 생략하기

사용자 함수를 호출할때 C<&> 를 붙이지만, 생략가능한 규칙이 있다.

B<컴파일러가 사용자 함수를 호출하기전, 사용자 정의를 먼저 발견할 경우>,
B<문법을 통해 사용자 함수 호출이라는것을 인지할 경우>
내장함수처럼 앰퍼샌드 기호 없이 사용자 함수를 호출 할 수 있다.

=over

=item 호출 이전에 선언이 되어있는 예시

	sub division {
		$_[0] / $_[1];
	}

	say my $quotient = division 355, 113;

=item 문법만으로 사용자 함수호출이란것을 인지할 수 있는경우

함수호출시 매개변수 목록을 괄호로 넘겨주는 문법을 통해 알 수 있다.

	# 매개변수를 괄호로 넘겨줌으로써, 함수임을 인지
	say division(355,113);	

=back

=cut


sub division {
	$_[0] / $_[1];
}

say my $quotient = division 355, 113;	# 호출부분이 선언보다 뒤에있음

say division(355,113);	# 매개변수를 괄호로 넘겨줌으로써, 함수임을 인지


=head1 주의할것, 앰퍼샌드C<&> 를 쓸수밖에 없는경우

사용자 함수가 내장함수의 이름과 동일할경우에는 반드시 &를 써야한다.
사용자 함수가 내장함수를 오버라이딩하기때문에, 
이름공간을 명확히 하기 위해 C<&>를 붙여야한다.

	sub chomp {
		say "Munch, munch!";
	}

	&chomp;	# 반드시 &를 써야함!

=cut


sub chomp {
   say "Munch, munch!";
}

&chomp;	# 반드시 &를 써야함!
