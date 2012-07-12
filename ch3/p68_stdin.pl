#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;

=pod

=encoding utf-8

=head1 목록 문맥에서의 <STDIN>

줄단위 입력 연산자인 <STDIN> 은 스칼라문맥과 목록문맥에서 다르게 반응한다. 
스칼라 문맥에서 <STDIN> 은, 첫번째 줄 구분자가 나타날때까지만 입력받지만, 
목록문맥에서는 남아있는 모든 줄을 배열의 각각의 요소로써 입력받는다. 

물론 이때에도, <STDIN> 의 특성상 줄바꿈 문자까지도 입력으로 받기 때문에 
chomp 연산자를 통해 줄바꿈 문자를 삭제해주면 좋다.


	# Ctrl + d 와 같이 EOF 신호를 받기전까지 계속 입력받는다.
	chomp(my @line = <STDIN>);

=cut

chomp(my @line = <STDIN>);
say @line;


=pod

거대한 로그파일과 같이, 만약 한번에 읽어들이는 데이터의 양이 많다면, 
파일의 용량만큼 메모리를 점유할 것이다.

=cut
