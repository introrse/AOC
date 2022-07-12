#!/opt/local/bin/perl -W

use strict;
use File::Slurp;

my @input = read_file("input03.txt") or die "Couldn't read puzzle 3 input\n";
chomp(@input);

sub MostCommonBits {
    my @colsums;

    for my $line (@_) {
        my @bits = split('', $line);
        die unless @bits > 3;   # sanity check
        for (my $i=0; $i<@bits; $i++) {
            $colsums[$i] += $bits[$i] eq '1' ? +1 : -1;
        }
    }

    print("Colsums: ", join(", ", @colsums), "\n"); 
    return @colsums;
}


my @colsums = MostCommonBits(@input);

my @gammabits;
my @epsilonbits;

for my $s (@colsums) {
    die if $s == 0;
    push @gammabits, ($s>0) ? '1' : '0'; 
    push @epsilonbits, ($s<0) ? '1' : '0';         
}

my $g = eval('0b' . join('',@gammabits));
my $e = eval('0b' . join('',@epsilonbits));

print("Part A: gamma = $g, epsilon = $e, power consumption = ", ($g*$e), "\n");


sub partB {
    my($findLeastCommon) = @_;

    my @temp = @input; 

    my $currentbitpos = 0;
    while (@temp > 1) {
        my @mostcommon = MostCommonBits(@temp);
        die unless @mostcommon > $currentbitpos;  # catch running off the end

        my $match;
        if ($findLeastCommon) {
            $match = $mostcommon[$currentbitpos] < 0
        } else {
            $match = $mostcommon[$currentbitpos] >= 0
        }
        
        # Downselect input list to only those inputs matching the 'match'
        # value at the current bit position.
        my $countbefore = int(@temp);
        @temp = grep {
            my @bits = split('', $_);
            die unless @bits > $currentbitpos;  # catch running off the end
            my $relevantbit = $bits[$currentbitpos];
            $match ? ($relevantbit eq '1') : ($relevantbit eq '0');
        } @temp;

        print("At pos $currentbitpos, match $match cut list from $countbefore to ", int(@temp), "\n");
        $currentbitpos++;
    }

    if (@temp > 0) {
        my $value = eval('0b' . $temp[0]);
        print("Part B ", $findLeastCommon ? "Least" : "Most", " Common:", $temp[0], " == dec $value\n");
        return $value;
    } else {
        print("Part B ", $findLeastCommon ? "Least" : "Most", " Common: FAILED, no lines left at pos=$currentbitpos\n");
        return 0;
    }
}

print("\n");
my $oxygen = partB(0);

print("\n");
my $co2    = partB(1);

print("\n");

print("Submarine's life support rating (product) = ", $oxygen * $co2, "\n");
