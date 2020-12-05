# 2020 AOC Day 5 solution in Perl
# Jason Campbell

use strict;
use warnings;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

use File::Slurp;

my $file = read_file('day05.txt');
$file =~ tr/BFRL/1010/;
my @passes = split( "\n", $file );
print "Found ".int(@passes)." boarding passes\n";

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# Part 1

print(  (map {eval('0b'.$_ )} sort @passes )[-1], " is highest seatid\n" );

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# Part 2

my %sc;   # count of seats taken by row

# Count seats scpied in each row
foreach (@passes) { $sc{ eval('0b'.substr($_,0,7)) }++ }

# Scan rows looking for one with exactly one seat available
# and where the rows before and after are full
my @goodrows = grep { $sc{$_-1}==8 and $sc{$_+1}==8 and $sc{$_}==7 }  1..126;

# For each row found above, find the empty seat
foreach my $r (@goodrows) {
    my %seats;
    my $prefix = sprintf("%07b", $r);
    foreach (grep(/^$prefix/, @passes)) { $seats{eval('0b'.substr($_,7))} = 1 }
    foreach (0..7) {
        if (not exists $seats{$_}) {
            print("Seat $r, $_ looks good, seatid = ", ($r * 8 + $_), "\n");
        }
    }
}



# - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# Results

# Found 824 boarding passes
# 878 is highest seatid
# Use of uninitialized value within %sc in numeric eq (==) at ./day05b.pl line 31.
# Use of uninitialized value within %sc in numeric eq (==) at ./day05b.pl line 31.
# Use of uninitialized value within %sc in numeric eq (==) at ./day05b.pl line 31.
# Use of uninitialized value within %sc in numeric eq (==) at ./day05b.pl line 31.
# Use of uninitialized value within %sc in numeric eq (==) at ./day05b.pl line 31.
# Use of uninitialized value within %sc in numeric eq (==) at ./day05b.pl line 31.
# Use of uninitialized value within %sc in numeric eq (==) at ./day05b.pl line 31.
# Use of uninitialized value within %sc in numeric eq (==) at ./day05b.pl line 31.
# Use of uninitialized value within %sc in numeric eq (==) at ./day05b.pl line 31.
# Use of uninitialized value within %sc in numeric eq (==) at ./day05b.pl line 31.
# Use of uninitialized value within %sc in numeric eq (==) at ./day05b.pl line 31.
# Use of uninitialized value within %sc in numeric eq (==) at ./day05b.pl line 31.
# Use of uninitialized value within %sc in numeric eq (==) at ./day05b.pl line 31.
# Use of uninitialized value within %sc in numeric eq (==) at ./day05b.pl line 31.
# Use of uninitialized value within %sc in numeric eq (==) at ./day05b.pl line 31.
# Use of uninitialized value within %sc in numeric eq (==) at ./day05b.pl line 31.
# Use of uninitialized value within %sc in numeric eq (==) at ./day05b.pl line 31.
# Use of uninitialized value within %sc in numeric eq (==) at ./day05b.pl line 31.
# Use of uninitialized value within %sc in numeric eq (==) at ./day05b.pl line 31.
# Use of uninitialized value within %sc in numeric eq (==) at ./day05b.pl line 31.
# Use of uninitialized value within %sc in numeric eq (==) at ./day05b.pl line 31.
# Use of uninitialized value within %sc in numeric eq (==) at ./day05b.pl line 31.
# Use of uninitialized value within %sc in numeric eq (==) at ./day05b.pl line 31.
# Seat 63, 0 looks good, seatid = 504
