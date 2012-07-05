#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;

# Single quote

say '';
say 'fred';
say 'don\'t let an apostrophe end this string prematurely!';
say 'the last character of this string is a backslash: \\';
say 'hello\n';
say 'hello
there';
say '\'\\';

# 작은따옴표에서의 숫자표현
say '100';
say '0x100';
say '0100';



# Double quote
say "barney";

# 역슬래시 회피를 통해 줄바꿈을 출력한 예
say "hello world\n";

# 역슬래시 회피를 통해 큰따옴표를 출력하는 예
say "The last character of this string is a quote mark: \"";

# 역슬래시 회피를 통해 tab문자를 출력한 예
say "coke\tspire";

# 큰따옴표에서의 숫자표현
say '100';
say '0x100';
say '0100';


__END__

=pod

=encoding utf-8

=head1 작은따옴표 문자열 상수

=over

=item *

작은따옴표 문자열 상수는 B<작은따옴표로 묶여진 형태의 문자열>을 의미한다.

=item *

B<작은따옴표> 와 B<역슬래시> 를 제외한 모든 문자는 그대로 출력된다. (== 변수 보간이 일어나지 않는다)

=over

=item *

B<작은따옴표> 와 B<역슬래시> 를 기입하기 위해서는 앞에 역슬래시를 붙인다.
B<작은따옴표>의 경우 C<\'> 기입하고, B<역슬래시>는 C<\\> 같은 형태로 쓴다.
B<작은 따옴표 문자열> 에서는 위의 예외말고는 모두 문자열 그대로 출력된다

=item *

B<작은따옴표> 안에서는 이스케이프 문자를 인식하지 못한다.
즉, C<\n> 은 개행문자의 의미가 아닌, "\" 과 "n"의 두개의 문자로 인식한다.

=back

=back

=head1 큰 따옴표 문자열 상수

=over

=item * 

B<큰따옴표로 묶여진 형태의 문자열> 을 의미한다.

=item *
L<작은따옴표 상수|"작은따옴표 문자열 상수"> 와는 다르게, 변수보간이 일어난다.

=over

=item *
B<변수 보간> 이란, 문자열 안의 변수이름을 -> 변수의 현재값으로 대체하는 것을 말한다.

=back

=item *

역슬래시와 특정한 문자를 조합하여 
L<< 역슬래시 회피(backslash escape)|http://perldoc.perl.org/perlrebackslash.html >> 
를 사용할 수 있다.

=back

=cut
