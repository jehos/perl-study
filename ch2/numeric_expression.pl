#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;


# Floating point
say 1.25;
say 255.000;
say 255.0;
say 7.25e45;
say -6.5e24;
say -12e-24;
say -1.2E-23;


# integer
say 0;
say 2001;
say -40;
say 255;
say 61298040283768;
say 61_298_040_283_768;

# octal
say 0377;

# hexa
say 0xff;
say 0x50_65_72_7c;

# decimal
say 0b1111111;
