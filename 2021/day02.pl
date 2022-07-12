#!/opt/local/bin/perl -W

use strict;
use File::Slurp;

my @input = read_file("input02.txt") or die "Couldn't read puzzle 2 input\n";
chomp(@input);

my $h = 0;
my $d = 0;

for my $move (@input) {
    my($cmd,$n) = split(" ", $move);
    if ($cmd eq "forward") {
        $h += $n;
    } elsif ($cmd eq "down") {
        $d += $n;
    } elsif ($cmd eq "up") {
        $d -= $n;
        die if $d < 0;
    } else {
        die("Problem with move line $move\n");
    }
#    print("After $move, h=$h, d=$d\n");
}

print("Part A: At end of stored program position is h=$h, d=$d.  Product ", $h*$d, "\n");


$h = 0;
$d = 0;
my $aim = 0;

for my $move (@input) {
    my($cmd,$n) = split(" ", $move);
    if ($cmd eq "forward") {
        $h += $n;
        $d += $aim * $n;
        die if $d < 0;
    } elsif ($cmd eq "down") {
        $aim += $n;
    } elsif ($cmd eq "up") {
        $aim -= $n;
    } else {
        die("Problem with move line $move\n");
    }
    print("After $move, h=$h, d=$d\n");
}

print("Part B: At end of stored program position is h=$h, d=$d.  Product ", $h*$d, "\n");

