# 2020 AOC Day 3 solution in Perl
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

my @lines = read_file('day03.txt');
chomp(@lines);
my $linelen = length($lines[0]);

sub at($$) {
    my($x,$y) = @_;
#    print("at $x $y\n");
    $x = $x % $linelen;
    my $v = substr($lines[$y], $x, 1);
#    print("  x-> $x     value=$v\n");
    return $v;
}


time_block {
    my $x = 0;
    my $y = 0;
    my $count = 0;

    while ($y < @lines) {
        $x += 3;
        $y += 1;
        last if $y >= @lines;
        $count++ if (at($x,$y) eq "#"); 
    }

    print("hit $count trees\n");
};

sub check_slope($$) {
    my($dx,$dy) = @_;
    my $x = 0;
    my $y = 0;
    my $count = 0;

    while ($y < @lines) {
        $x += $dx;
        $y += $dy;
        last if $y >= @lines;
        $count++ if (at($x,$y) eq "#"); 
    }
    print "On slope $dx,$dy, hit $count trees\n";
    return $count;
}

time_block {
    my $totaltrees = 1;
    $totaltrees *= check_slope(1,1);
    $totaltrees *= check_slope(3,1);
    $totaltrees *= check_slope(5,1);
    $totaltrees *= check_slope(7,1);
    $totaltrees *= check_slope(1,2);
    print "Product is $totaltrees\n";
}


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# Results

# Part 1:
# hit 234 trees
# Elapsed time 0.000159s

# Part 2:
# On slope 1,1, hit 79 trees
# On slope 3,1, hit 234 trees
# On slope 5,1, hit 72 trees
# On slope 7,1, hit 91 trees
# On slope 1,2, hit 48 trees
# Product is 5813773056
# Elapsed time 0.000630s
        
