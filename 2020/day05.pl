# 2020 AOC Day 5 solution in Perl
# Jason Campbell

use strict;
use warnings;

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

use File::Slurp;

my $file = read_file('day05.txt');
my @passes = split( "\n", $file );
print "Found ".int(@passes)." boarding passes\n";

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# Part 1

my $highest = 0;
foreach my $p (@passes) {
    $p =~ tr/BFRL/1010/;
    my $seatid = eval('0b'.$p);
            
#    print $p, "  ", $seatid, "\n";;
    if ($seatid > $highest) { $highest = $seatid; }
}

print "Part 1: Highest seatid was $highest\n";

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# Part 2
# A hash is an expensive bitmap, but this is a small plane

my %found;

# Mark seats found
foreach my $p (@passes) {
    $p =~ tr/BFRL/1010/;
    my $seatid = eval('0b'.$p);
    $found{$seatid} = 1;
}

# Scan rows looking for one with exactly one seat available
# and where the rows before and after are full
sub seatsleft {
    my($row) = @_;
    my @left;
    for (my $j=0; $j<8; $j++) {
        if ( !$found{ $row*8 + $j } ) { push(@left,$j); }
    }
    return @left;
}

for (my $i=1; $i<126; $i++) {
    next unless seatsleft($i-1) == 0;
    next unless seatsleft($i+1) == 0;
    my @avail = seatsleft($i);
    next unless @avail == 1;
    my $column = shift @avail;
    
    print("Part 2: Row $i looks good, with availability: ", join(", ", @avail), ", seat-id=", ($i*8 + $column), "\n");
}




# - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# Results

# Found 824 boarding passes
# Part 1: Highest seatid was 878
# Part 2: Row 63 looks good, with availability: 0, seat-id=504

# I happened to be up and solved this one 24 minutes after it dropped, 
# by which point 2969 people already had finished both parts!
