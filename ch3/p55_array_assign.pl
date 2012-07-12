#!/usr/bin/env perl

use 5.010;
use warnings;
use strict;

=pod

=encoding utf-8

=head1 목록할당

	my ($fred, $barney, $dino) = ("flinstone", "rubble", "undef");

이는 다음과 같은 표현이다.

	my $fred = "flinstone";
	my $barney = "rubble";
	my $dino = "undef";

펄은 할당작업을 수행하기 전에 목록을 먼저 만들어 두기 때문에 swap 이 쉽다

	($fred, $barney) = ($barney, $fred);


만약 변수들의 갯수가 다르다면 무시된다.
	
	# 오른쪽 항이 더 많을때는 값이 무시됨
	($fred) = qw(flinstone rubble) # rubble 은 무시됨

	# 왼쪽 항이 더 많을때는, 해당 변수가 undef로 초기화됨
	($fred, $barney, $dino) = qw(flinstone rubble); # $dino에는 undef

배열에 할당하고 싶다면, 배열변수명을 입력하면 된다. 
이때, 배열의 원소로 올 수 있는것은 오직 스칼라 변수밖에 없다. 
따라서 배열의 원소로 배열같은건 올 수 없다. 

	my @array = qw( Able/Affirm
					Baker
					Charlie
					Dog
					Easy
					Fox
					George
					How
					Item/Interrogatory
					Jig/Johnny
					King
					Love
					Mike
					Nab/Negat
					Oboe
					Peter/Prep
					Queen
					Roger
					Sugar
					Tare
					Uncle
					Victor
					William
					X-ray
					Yoke
					Zebra
				)
	
그러나 대입되는 여러개의 배열변수가 있다면, 그중 첫번째만 인식하고 
나머지는 죄다 버리게된다.

	# 오직 @a 만 a b c d e f g 가 들어가고 @b 와 @c 는 undef 로 취급
	my (@a,@b,@c) = qw / a b c /, qw / e f g/;

=cut


my ($fred, $barney, $dino) = ("flinstone", "rubble", "undef");
($fred, $barney, $dino) = qw(flinstone rubble); # $dino에는 undef


my @call = qw( Able/Affirm
				Baker
				Charlie
				Dog
				Easy
				Fox
				George
				How
				Item/Interrogatory
				Jig/Johnny
				King
				Love
				Mike
				Nab/Negat
				Oboe
				Peter/Prep
				Queen
				Roger
				Sugar
				Tare
				Uncle
				Victor
				William
				X-ray
				Yoke
				Zebra
			);
my @empty = ();
my @number = 1..15;

# 이때, 빈목록과 undef는 요소로 들어가지 않는다
my @none = (@empty, undef);
say $#none; # 0 

my @stuff = (@call, 1..5, qw! a b c d !);

# 깊은복사(deep copy) 를 수행하는것을 알 수 있다.
# 복사하기 전에 새 목록을 만든다고 했다는걸 기억하자
my @copy = @stuff;
say $stuff[0] = "none!";
say $copy[0];


=head1 깊은복사와 얕은복사

L<< Copying Data Structure|
http://docstore.mik.ua/orelly/perl/cookbook/ch11_13.htm >> 

데이터 구조를 복사해야 할 경우, 깊은복사와 얕은복사에 대해 언급하고 있다. 

=over

=item 얕은복사(Swallow copy)

레퍼런스만 복사하는 방법으로, 추가적인 데이터를 생성하지 않는다.

	my @original = (\@a, \@b, \@c);
	my @surface = @original;

=item 깊은복사(Deep Copy)

레퍼런스의 중복없이 전체의 구조를 똑같이 생성한다, 
이 때 1단계 깊이의 참조만 복사된다.(FIXME!!!)

=back

=cut

