#!/usr/bin/perl

my $wt="";
my $mut="";


while(<>) {
	chomp;
	$wt=$wt.$_ if ($. %4==2);
	$mut=$mut.$_ if ($. % 4==3); 
}
my $name=(split(/\//,$ARGV))[-1];
$name=~s/_fig//;
$name=~s/\.axt$//;

print "$name\n";
print "$wt\n";
print "$mut\n"; 
