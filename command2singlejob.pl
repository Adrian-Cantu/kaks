#!/usr/bin/perl
#
print "#!/bin/bash\n";

print "#\$ -N tblast_axt_\n";


while (<>) {
    chomp;
    s/"/"'"'"/g;
    print "sh -c \"/usr/local/blast+/bin/$_\"\n";

}
