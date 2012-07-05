#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;


=pod

=encoding utf-8

=head1 문자열의 연결(concatenate)

문자열의 연결은 C<.> 연산자로 할 수 있다.

	say "hello " . "world!";
	say "hello" . ' ' . "world!";
	say 'hello world' . "!";

=cut

say "hello " . "world!";
say "hello" . ' ' . "world!";
say 'hello world' . "!"; 


=head1 문자열의 반복

문자열의 반복은 C<x> 연산자로 할 수 있다.

	say "fred" x 3;
	say "barney" x (4+1);
	say 5 x 4;

=cut

say "fred" x 3;
say "barney" x (4+1);
say 5 x 4;

