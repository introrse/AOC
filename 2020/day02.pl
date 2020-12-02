# 2020 AOC Day 2 solution in Perl
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

my @lines = read_file('day02.txt');
chomp(@lines);


time_block {
    my $pass1 = 0;
    for my $l (@lines) {
        my($min,$max,$letter,$password)  = ($l =~ /^(\d+)-(\d+) (.): (.+)$/);
        $min and $max and $letter and $password or die("Regex failed on line: " . $l);
        #    print("Looking for $letter, between $min and $max in $password\n");

        my $justletter = join( '', grep {$_ eq $letter} split('',$password)  );
        $pass1++ if ( $min <= length($justletter)  and  length($justletter) <= $max );
    }

    print("Part 1: $pass1 valid passwords \n");
};

time_block {
    my $pass2 = 0;
    for my $l (@lines) {
        my($min,$max,$letter,$password)  = ($l =~ /^(\d+)-(\d+) (.): (.+)$/);
        $min and $max and $letter and $password or die("Regex failed on line: " . $l);

        $pass2++ if ( substr($password,$min-1,1) eq $letter xor substr($password,$max-1,1) eq $letter );
    }

    print("Part 2: $pass2 valid passwords \n");
};

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# Results

# Part 1: 416 valid passwords 
# Elapsed time 0.004326s
#
# Part 2: 688 valid passwords 
# Elapsed time 0.001460s
