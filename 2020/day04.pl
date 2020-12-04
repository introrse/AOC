# 2020 AOC Day 4 solution in Perl
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

sub has {
    my($string,@substrings) = @_;
    for my $ss (@substrings) {
        if (index($string,$ss) == -1) { return 0; }
    }
    return 1;
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

use File::Slurp;

my $file = read_file('day04.txt');

my @passports = split( "\n\n", $file );
print "Found ".int(@passports)." passports \n";

my $validintl = 0;
my $validnpc = 0;

time_block {
    for my $passport ( @passports ) {
        my @fields = split(/\s+/, $passport);
#        print(int(@fields)," fields: ", join(", ", @fields), "\n");
        if (has( $passport, "byr:", "iyr:", "eyr:", "hgt:", "hcl:", "ecl:", "pid:", "cid:" )) {
            $validintl++; 
        }

        if (has( $passport, "byr:", "iyr:", "eyr:", "hgt:", "hcl:", "ecl:", "pid:" ) and !has($passport, "cid:")) {
            $validnpc++; 
        }
    }

    print("Part 1: \n$validintl valid international passports\n$validnpc valid North Pole credentials\nMeaning we let through ".($validintl + $validnpc)." of the ".int(@passports)." total passports\n");
};


my $valid_phase2=0;

time_block {

    sub passfield {
        my($passdata,$key) = @_;
        my($value) = ($passdata =~ /$key:(\S+)/);
        return $value;
    }


    my %fvals;
    foreach my $k ('byr','iyr','eyr','hgt','hcl','ecl','pid') {
        $fvals{$k} = {};
    }
    
    for my $passport ( @passports ) {
        if (!has( $passport, "byr:", "iyr:", "eyr:", "hgt:", "hcl:", "ecl:", "pid:" )) {
            next;
        }

        my %fields;
        foreach my $k ('byr','iyr','eyr','hgt','hcl','ecl','pid') {
            $fields{$k} = passfield($passport,$k);
        }

        next unless $fields{'byr'} and $fields{'byr'} =~ /^\d\d\d\d$/ and $fields{'byr'} >= 1920 and $fields{'byr'} <= 2002;
        next unless $fields{'iyr'} and $fields{'iyr'} =~ /^\d\d\d\d$/ and $fields{'iyr'} >= 2010 and $fields{'iyr'} <= 2020;
        next unless $fields{'eyr'} and $fields{'eyr'} =~ /^\d\d\d\d$/ and $fields{'eyr'} >= 2020 and $fields{'eyr'} <= 2030;
        next unless $fields{'hgt'};


        if ($fields{'hgt'} =~ /^(\d+)cm$/) {
            next unless 150 <= $1 and $1 <=193;
        } elsif ($fields{'hgt'} =~ /^(\d+)in$/) {
            next unless 59 <= $1 and $1 <=76;
        } else {
            next;
        }
        
        next unless $fields{'hcl'} and $fields{'hcl'} =~ /^#[0-9a-f]{6}$/;

        next unless $fields{'ecl'} and $fields{'ecl'} =~ /^(amb|blu|brn|gry|grn|hzl|oth)$/;
        next unless $fields{'pid'} and $fields{'pid'} =~ /^\d{9}$/;
        
        foreach my $k ('byr','iyr','eyr','hgt','hcl','ecl','pid') {
            $fvals{$k}->{ $fields{$k} } = 1;
        }

        print "Valid passport: ",$passport, "\n\n";
        $valid_phase2++;
    }

    print("Part 2: \n$valid_phase2 valid passports of the ".int(@passports)." total passports\n");

    foreach my $k (keys %fvals) {
        print("\n\nAccepted $k values\n");
        foreach my $v (sort keys %{$fvals{$k}}) {
            print("  ".$v."\n");
        }
    }
};



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
        
