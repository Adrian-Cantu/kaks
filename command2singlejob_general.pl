#!/usr/bin/perl
#
print "#!/bin/bash\n";

print "#\$ -N kaks\n";


while (<>) {
    chomp;
    s/"/"'"'"/g;
    print "$_\n"

}
