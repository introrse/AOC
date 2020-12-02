# 2020 AOC Day 1 solution in Perl
# Ada's approach, coded in Perl by Jason to compare speed to the naive approach in day01.pl

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
    print "Part 1 -- Found 1010 x 1010 = ". (1010*1010) . "\n" if ( (grep {$_ == 1010} @lines) >= 2);

    my @lessthan = grep {$_<1010} @lines;
    my @greaterthan = grep {$_>1010} @lines;
    
    for ( my $i=0; $i<@lessthan; $i++ ) {
        for ( my $j=0; $j<@greaterthan; $j++ ) {
            if ($lessthan[$i] + $greaterthan[$j] == 2020) {
                print("Part 1 --  Found two that sum to 2020: $lessthan[$i] x $greaterthan[$j] = ". $lessthan[$i] * $greaterthan[$j] ."\n");
            }
        }
    }
};


time_block {

    my @lessthan = grep {$_<1010} @lines;
    my @greaterthan = grep {$_>1010} @lines;

    for ( my $i=0; $i<@lessthan; $i++ ) {
        for ( my $j=$i+1; $j<@lessthan; $j++ ) {
            for ( my $k=0; $k<@greaterthan; $k++ ) {
                if ($lessthan[$i] + $lessthan[$j] + $greaterthan[$k] == 2020) {
                    print("Part 2 -- Found three that sum to 2020: $lessthan[$i] x $lessthan[$j] x $greaterthan[$k] = ". $lessthan[$i] * $lessthan[$j] * $greaterthan[$k] ."\n");
                }
            }
            for ( my $k=$j+1; $k<@lessthan; $k++ ) {
                if ($lessthan[$i] + $lessthan[$j] + $lessthan[$k] == 2020) {
                    print("Part 2 -- Found three that sum to 2020: $lessthan[$i] x $lessthan[$j] x $lessthan[$k] = ". $lessthan[$i] * $lessthan[$j] * $lessthan[$k] ."\n");
                }
            }
        }
    }
};


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# Results

# Read 200 lines
# Part 1 --  Found two that sum to 2020: 796 x 1224 = 974304
# Elapsed time 0.000194s
#
# Part 2 -- Found three that sum to 2020: 332 x 858 x 830 = 236430480
# Elapsed time 0.000808s


# For comparison, the times from day01.pl were 
# Elapsed time 0.001519s
# Elapsed time 0.117217s
