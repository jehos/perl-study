#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;

=pod

=encoding utf-8

=head1 undef

변수들이 특정한 값으로 초기화되지 않았다면, C<undef> 라는 특수한 값을 가진다. 
펄에서는 NULL값을 undef 라고 부르는데, 이것은 0이나 '' 과는 다른 의미로써,
어떤값도 할당되지 않았다는 의미이다.

=cut

my $i; # undef
my $j = undef; # undef

say $i += 1;
say $j .= "some string";


=head1 defined

C<defined>는 C<undef> 값이 있는지 확인하여 참/거짓을 반환한다. 
이렇게 하는 이유는, 대개 다른 함수들이 동작 실패시 결과값으로 C<undef> 를 
반환하게 되는것을 잡아내기 위해서이다. 

가령 <STDIN> 의 경우에도, 파일의 마지막 EOF 와 만났을때 undef를 반환한다.
이때, 빈줄인지, undef인지 알아내기 위해 C<defined> 함수를 사용한다.


	# <STDIN> 대기중 Ctrl+d 를 누르면 undef 로 초기화된다
	my $madonna = <STDIN>;
	if ( defined($madonna) ) {
		say "The input was $madonna";
	} else {
		say "No input available!\n";
	}

=cut

my $madonna = <STDIN>;
if ( defined($madonna) ) {
	say "The input was $madonna";
} else {
	say "No input available!\n";
}
