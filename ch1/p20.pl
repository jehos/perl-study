#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;

my @lines = `perldoc -u -f atan2`;
foreach (@lines){
	s/\w<([^>]+)>/\U$1/g;
	print;
}
