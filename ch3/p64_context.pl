#!/usr/bin/env perl

use 5.010;
#use strict;
#use warnings;

=pod

=encoding utf-8

=head1 스칼라문맥과 목록문맥

펄에서 가장 중요한 부분이라고 한다. 펄은 자연어의 특성을 따르는데, 
그 중에 자연어처럼 '문맥' 에 따라 달리 해석한다.

펄에서는 스칼라가 쓰일 것 같은 자리에는 스칼라 처럼, 
목록처럼 쓰여야 할 자리에는 목록 문맥을 대입하여 처리한다.

	5 + something # something 은 스칼라 변수로 취급, + 가 스칼라 연산자라서.
	sort something # something 은 목록으로 취급, sort가 목록 연산자라서.

가끔 reverse 처럼 스칼라와 목록 문맥 모두에서 쓰이는 예가 있기도 하다.

	say my @context = qw /aa bb cc dd ee/;
	my $scala = reverse @context;	# 스칼라로 해석된다
	my @list = reverse @context;	# 목록으로 해석된다

=cut


say my @context = qw /aa bb cc dd ee/;
my $scala = reverse @context;	# 스칼라로 해석된다
my @list = reverse @context;	# 목록으로 해석된다

say "$scala";
say "@list";


=head1 펄에서 표현식은 항상 문맥에 적합한 값을 반환한다

	@people = qw/ fred barney betty /;
	@sorted = sort @people;	# 목록문맥에 목록문맥은 목록이 대입된다
	$number = @people;	# 스칼라문맥에 목록문맥이 들어가면 갯수가 대입된다

=cut

say my @people = qw/ fred barney betty /;
say my @sorted = sort @people;
say my $number = @people;

=head1 스칼라 문맥에서 목록문맥이 사용될 경우

보통 그런 경우라면, 문맥은 연산자에 의해 결정될 때가 많으므로 
해당 연산자를 만든 사람의 도움말을 봐야한다. 

어떤 표현식은 스칼라 문맥에서 전혀 값을 가지지 못할때도 있기 때문이다.
가령 스칼라 문맥에서 sort는 undef 를 반환한다. 
갯수를 굳이 정렬할 필요는 없기 때문이다.

reverse 연산자는 목록문맥을 만났을때는 목록을 역순으로 반환하지만, 
스칼라 문맥을 만나면 목록을 문자열로 붙이고 뒤집어서 스칼라로 반환한다.

사실, 이런것들을 모두 외울때까지는 계속 설명서를 붙잡고 있어야 한다.

=cut

say $number = defined sort @people;	# undef
say $number = defined reverse @people;	# defined

=pod

목록문맥에서 "스칼라값" 이 대입되면, 값 요소를 가지는 "목록" 으로 만든다.

	@fred = 6 * 7;
	@barney = "hello";

$fred[0] 과 $barney[0] 에서 접근할 수 있다

=cut


	my @fred = 6 * 7;
	my @barney = "hello";

	say $fred[0];
	say $barney[0];


=pod

목록을 초기화 하기 위해선 어떤방법을 써야 할까?

	my @list = undef;

이것은 @list에 스칼라로 된 목록으로 undef 값을 입력하는것이다,
정말로 목록을 초기화 하고 싶다면 빈 목록을 대입할 수 있을것이다.

	my @list = ();


때때로, 목록을 스칼라처럼 취급해야 할때가 있다.

	my @rocks = qw/ talc quartz jade obsidian /;
	say "I have,". scalar @rocks ." rock!";

본래 C<@rocks> 는 보간되어 목록으로 해석되겠지만, C<scalar> 연산자로 
마치 스칼라처럼 취급할 수 있다.

=cut

my @rocks = qw/ talc quartz jade obsidian /;
say "I have ". scalar @rocks ." rock!";
