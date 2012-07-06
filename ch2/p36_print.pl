#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;

=pod

=encoding utf-8

=head1 print()

C<print> 연산자를 통해 출력하게 할 수 있다. 
출력방향을 지정하지 않으면 표준출력(모니터) 로 출력된다.

=head2 예제

	print FILEHANDLE LIST

	print FILEHANDLE

	print LIST

	print


list나 문자열을 출력할 수 있고, 성공하면 true를 반환한다. 
FILEHANDLE은 filehandle의 레퍼런스가 값인 스칼라변수일 수 있다.
(2중으로 레퍼런스 된건 안되는듯??) 

FILEHANDLE이 생략되면 표준출력으로 출력되고, 
LIST 가 생략되면 C<$_> 으로 출력된다.

=cut

my $meal = "brontosourus steak";

print "$meal.\n";


=head2 큰따옴표 보간(double-quote interpolation)

큰따옴표 로 묶여있을땐 변수보간이 일어난다. 
(꼭 큰따옴표만이 아니라 다른 문자열에서도 보간은 일어나긴 한다.)

때문에 큰따옴표 안에서 C<$> 를 쓰려면, 역슬래시를 붙여 
C<$> 기호의 의미를 지워야 한다.

	my $fred = 'hello';
	print "The name is \$fred";
	print 'The name is $fred' . "\n";


그러나 변수보간이 일어날때 자칫 잘못 읽을 가능성이 있다.
변수이름에 중괄호쌍을 이용해 묶어서 정확하게 표현해준다.

	$what = "steak";
	$n = 3;

	print "fred ate $n ${what}s.\n";

=cut

my $what = "steak";
my $n = 3;

print "fred ate $n ${what}s.\n";
