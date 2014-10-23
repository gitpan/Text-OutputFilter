#!/pro/bin/perl

use strict;
use warnings;

use Test::More tests => 7;

use_ok "Text::OutputFilter";

my $lm = 4;
@ARGV and $ARGV[0] =~ m/^\d+$/ && ! -f $ARGV[0] and $lm = 0 + shift;

my $buf = "";
tie *STDOUT, "Text::OutputFilter", $lm, \$buf;

my $expect = "";

$expect  = "    I\n";
print "I\n";
is ($buf, $expect, "single arg with newline, line 1");

$expect .= "    am\n";
print "am\n";
is ($buf, $expect, "single arg with newline, line 2");

$expect .= "    Iam\n";
print "I", "am", "\n";
is ($buf, $expect, "three args with newline");

print "I";
is ($buf, $expect, "one arg, no newline");
print "am", "me";
is ($buf, $expect, "two args, no newline");

$expect .= "    Iamme";
close STDOUT;
is ($buf, $expect, "closed");

untie *STDOUT;
