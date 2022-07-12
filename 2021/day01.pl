#!/opt/local/bin/perl -W

use strict;
use File::Slurp;

my @input = read_file("input01.txt") or die "Couldn't read puzzle 1 input\n";
chomp(@input);

# print("Input values ", join(" ", @input), "\n");

my $timesIncreased = 0;

for ( my $i = 1; $i<@input; $i++ ) {
    $timesIncreased++ if ($input[$i-1] < $input[$i]);
}

print("Part A: Depth readings increased on $timesIncreased occasions\n");

$timesIncreased = 0;

for ( my $i = 3; $i<@input; $i++ ) {
    my $sum1 = $input[$i-3] + $input[$i-2] + $input[$i-1];
    my $sum2 = $input[$i-2] + $input[$i-1] + $input[$i];
    $timesIncreased++ if $sum1 < $sum2;
}

print("Part B: Windowed depth readings increased on $timesIncreased occasions\n");

        
