#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;

=pod

=encoding utf-8

=head1 B<use strict;>

펄은 굉장히 자유로운 언어이기때문에, 약간의 제약을 두는것은 
실수를 방지하는데 큰 도움이 된다.

C<use strict> 프라그마는 컴파일러에게 소스코드의 규칙을 강제하게 하여
안전하지 않은 코드를 방지한다.

대개 소스의 첫머리에 선언한다.


	#!/usr/bin/env perl
	
	use strict;

	use strict "vars";

	use strict qw/ vars refs subs /;

	no strict "vars";



strict 프라그마에 C<subs>, C<vars>, C<refs> 의 세가지 매개변수를
넘길 수 있는데,만약 strict 프라그마를 선언하면서 아무 리스트를
써주지 않으면 모든 부분에서 제약을 건다는 의미다.

=cut

$bambam = 3;
$bam_bam += 1;	# warning!!!

say $bam;	# warning!!
