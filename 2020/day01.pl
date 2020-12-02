# 2020 AOC Day 1 solution in Perl
# Jason Campbell

use strict;
use warnings;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# Utility fn to measure elapsed time
use Time::HiRes qw( gettimeofday );
sub time_block(&) {
    my($block) = \&{ shift @_ };
    my $start = gettimeofday();
    $block->();
    print("Elapsed time ".sprintf("%0.6f",gettimeofday()-$start)."s\n\n");
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

use File::Slurp;

my @lines = read_file("day01.txt");
chomp(@lines);
print "Read ".int(@lines)." lines\n";

time_block {
    for ( my $i=0; $i<@lines; $i++ ) {
        for ( my $j=$i+1; $j<@lines; $j++ ) {
            if ($lines[$i] + $lines[$j] == 2020) {
                print("Part 1 --  Found two that sum to 2020: $lines[$i] x $lines[$j] = ". $lines[$i] * $lines[$j] ."\n");
            }
        }
    }
};


time_block {
    for ( my $i=0; $i<@lines; $i++ ) {
        for ( my $j=$i+1; $j<@lines; $j++ ) {
            for ( my $k=$j+1; $k<@lines; $k++ ) {
                if ($lines[$i] + $lines[$j] + $lines[$k] == 2020) {
                    print("Part 2 -- Found three that sum to 2020: $lines[$i] x $lines[$j] x $lines[$k] = ". $lines[$i] * $lines[$j] * $lines[$k] ."\n");
                }
            }
        }
    }
};


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# Results

# Read 200 lines
# Part 1 --  Found two that sum to 2020: 1224 x 796 = 974304
# Elapsed time 0.001519s
#
# Part 2 -- Found three that sum to 2020: 332 x 858 x 830 = 236430480
# Elapsed time 0.117217s
