#!/usr/bin/env perl

use 5.010;
#use strict;
#use warnings;

=pod

=encoding utf-8

=head1 사용자함수

사용자 함수를 사용할때는 C<&> 펄 식별자가 함께 붙지만, 
내장 함수의 경우에 한해서는 C<&> 기호를 뺄 수 있다.
되도록이면 함수를 사용할때 C<&> 붙이는것이 속 편하다.

변수와 이름이 겹쳐도, 이름공간을 따로 사용하기 때문에 상관없지만, 
동일한 변수명이 겹쳐있으면 사람이 헷갈릴 수 있기 때문에 왠만하면 
동일하게 짓지 않도록 한다.  

사용자 함수의 정의는 다음과 같은 형태로 구현된다

	sub marine{
		$n += 1; # 여기서 $n은 전역변수이다
		say "hello, sailor number $n!";
	}

=cut

my $n;
sub marine{
	$n += 1; # 여기서 $n은 전역변수이다
	say "hello, sailor number $n!";
}

&marine;	# 이렇게 함수를 부르는 행위를
&marine;	# 호출(invoke) 한다고 한다. 
&marine;	# 사실 왜 call 이 아닌가 좀 궁금하긴하다.
&marine;	# 
&marine;	# 사실 하는일은 두개가 정확히 동일하긴한데,
&marine;	# call 은 이른 바인딩, 
&marine;	# invoke 는 늦은바인딩으로 대변되는 것 같다.


=head1 사용자 함수 정의의 주의점

첫째로, 함수의 정의는 특별한 기교를 사용하지 않는한, 언제나 전역(global)이다.
 사설(private) 한 함수는 존재하지 않는다. 
(질문, 그럼 입력값의 올바름은 사용자가 알아서 판단해야 하는가?)

둘째로, 같은이름을 두번 사용하면 새로 정의된 함수가 이전함수를 덮어쓴다. 
(note: 이것도 오버라이딩 되는구나.. 
use strict; 쓰면 내장함수와 사용자 함수는 이름공간이 다를테니 위험없겠지?)

셋째로, 블록 밖에 선언된 전역변수는 함수안에서 사용할 수 있다. 
전역변수를 변경하는것은 예기치 못한 상황을 초래할 수 있으므로 주의해야 한다.
만약 전역변수를 꼭 변경해야 할 일이 있다면 되도록 블록안에서 처리하도록 한다.

넷째로, C 처럼 굳이 함수의 선언이 전방에 위치하지 않아도 된다. 
펄 코드 어느곳에 위치하더라도 정확하게 함수를 인지할것이다. 
그러나 유지보수의 편의나 관례등의 이유로 코드의 앞쪽에 선언하는것을 
선호하긴 한다.


그러나, 함수에서 사용하는 변수는 함수가 선언되기 전에 위치해야하는것같다.

	sub sum_of_fred_and_barney {
		say "Hey, you called the sum_of_fred_and_barney subroutine!";
		$fred + $barney;	# 빈 문맥처럼 보이지만 이 값이 반환값이 된다. 
	}

	my $fred = 2;
	my $barney = 4;
	say my $betty = 3 * &sum_of_fred_and_barney; # 결과가 0이 나온다.

=cut

=head1 반환값

보통 함수에서 특정 값을 반환하게 하여 다른 작업을 수행하는 경우가 많기때문에 
굳이 반환에 해당하는 문법을 사용하지 않고도 반환값을 사용할 수 있게 만들었다

펄에서는 제일 마지막에 연산한 값을 자동으로 반환한다.

	sub sum_of_fred_and_barney {
		say "Hey, you called the sum_of_fred_and_barney subroutine!";
		$fred + $barney;	# 빈 문맥처럼 보이지만 이 값이 반환값이 된다. 
	}

	my $fred = 2;
	my $barney = 4;
	my $betty = 3 * $sum_of_fred_and_barney;


=cut


my $fred = 2;
my $barney = 4;

sub sum_of_fred_and_barney {
	say "Hey, you called the sum_of_fred_and_barney subroutine!";
	$fred + $barney;	# 빈 문맥처럼 보이지만 이 값이 반환값이 된다. 
}

say my $betty = 3 * &sum_of_fred_and_barney;


=head1 반환값 사용시의 주의점

그러나, B<마지막 연산한 값을 자동으로 반환> 한다는 점에 주의해야한다. 
별 생각없이 적어놓은 다른 함수들의 반환값이 대신 반환될 수도 있기 때문이다

	sub return_ng_case {
		$result = 2+3;
		say $result;
	}	# 이 루틴의 반환값은 5가 아니라 say 함수의 반환값인 0이 될것이다

이처럼 사용자 함수에 코드를 추가할때는 마지막 표현식을 평가한 값을 
반환하기때문에 주의해야한다.

	sub larger_of_fred_or_barney{
		if ($fred > $barney){
			$fred;
		} else {
			$barney;
		} # if문의 결과에 따라, $fred 혹은 $barney 가 반환될것이다
	}

=cut

sub larger_of_fred_or_barney{
	if ($fred > $barney){
		$fred;
	} else {
		$barney;
	} # if문의 결과에 따라, $fred 혹은 $barney 가 반환될것이다
}

say &larger_of_fred_or_barney;
