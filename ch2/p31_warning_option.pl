#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;

=pod

=encoding utf-8

=head1 펄의 내장 경고

펄 프로그램에서 의심가는 부분을 찾기 위해 경고옵션을 켤 수 있다.

=over

=item 명령줄에서 C<-w> 옵션으로 켜는 경우

	$ perl -w my_program

=item shbang라인에 추가하는 경우

	#!/usr/bin/perl -w

=item C<use warnings;> 옵션을 사용하는 경우(단, perl 5.6 이상일 경우)

	#!/usr/bin/env perl
	use warnings;


=item 경고메세지와 자세한 설명까지 볼 경우엔 C<use diagnostics;> 사용

	#!/usr/bin/env perl
	use diagnostics;
	
=back

=cut
