#!/usr/bin/env perl


use 5.010;
use strict;
use warnings;

=pod

=encoding utf-8

=head1 while 제어구조

C<while> 은 조건이 참인 동안 블록안의 코드를 반복해서 수행하는 제어구조이다

	my $count = 0;
	while ($count < 10) {
		$count += 2;
		print "cocunt is now $count\n";
	}

만약, 처음부터 조건식이 거짓이라면 아무것도 수행하지 않을것이다.


=over

=item 

=back

=cut


my $count = 0;
while ($count < 10) {
	$count += 2;
	print "cocunt is now $count\n";
}

=head2 SEE ALSO

L<< perlsyn/"Compound Statements" >>

=cut
