#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;

=pod

=encoding utf-8

=head1 ch3-1 연습문제

입력의 끝까지 줄로 구분된 문자열 목록을 읽어, 
그 목록을 역순으로 출력하는 프로그램을 작성하세요.
만약 키보드로 입력한다면, 입력의 끝 신호로 유닉스에서 Ctrl+D 또는 
윈도우즈에서 Ctrl+Z 를 눌러야 할 것입니다.

=cut

chomp(my $line = <STDIN>);
$line = reverse $line;
say $line;
