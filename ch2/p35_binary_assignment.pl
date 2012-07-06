#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;

=pod

=encoding utf-8

=head1 이원할당 연산자

변수(lvalue) 가 할당연산자 C<=> 양쪽에 나타날 경우, 
이원 할당 연산자 L<< binary assignment|http://perldoc.perl.org/perlop.html#Assignment-Operators >> 를 사용하여 축약할 수 있다.

=over

=item 예시

아래의 두 코드는 의미가 동일하다.

	$fred = $fred + 5;
	$fred += 5;

=back

=cut

my $fred = 0;

say $fred = $fred + 5;
say $fred += 5;

=over

=item 예시2

문자열의 연결에도 쓰일 수 있다.

	$str = $str . " ";
	$str .= " ";

=back

=cut


my $str = "string";

$str = $str . " add";
$str .= " test";

say $str;

=over

=item 수상한 문장

perldoc L<< assignment operator|
http://perldoc.perl.org/perlop.html#Assignment-Operators >> 부분에서 
조금 수상한 부분을 발견.

"although without duplicating any side effects that 
dereferencing the lvalue might trigger, such as from tie(). 
Other assignment operators work similarly."

이게 뭔소리지...

=back

=cut
