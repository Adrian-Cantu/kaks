#!/usr/bin/perl -w 
use strict;
use Getopt::Long;
use Term::ANSIColor;
my $help;
my $query;
my $subject;
my $blast;
my $out_file;

GetOptions (
    'help'       => \$help,
    'query=s'    => \$query,
    'subject=s'  => \$subject,
    'blast=s'    => \$blast,
    'out=s'      => \$out_file,
);            
&help if ($help);
# my %codon=&codon_table;

#-outfmt '6 qseqid sseqid qseq qstart qend qframe sseq sstart send sframe'
#------------0-------1-----2-----3------4----5------6----7------8----9-----
##--------------------- aqui va el codigo -----------------------------------

open OUT ,'>',$out_file;
select(OUT);

open BLAST,'<',$blast;
my %is_query_printed;
while (<BLAST>) {
    chomp;
    my @fields=split;
    next if ($fields[5] < 0 );


    my $query_seq=`grep -A 1 '$fields[0]' $query | grep -v '>' `;
    chomp $query_seq;
    $query_seq= uc $query_seq;
    my $min_query = $fields[3] >= $fields[4] ? $fields[4] : $fields[3] ;
    my $dist_query=abs($fields[3] - $fields[4]);
    my $slice_query=substr($query_seq , $min_query -1 , $dist_query + 1);
    
   
#     my $max_query = $fields[3] >= $fields[4] ? $fields[3] : $fields[4] ;
   
   
   my $subject_seq=`grep -A 1 '$fields[1]' $subject | grep -v '>' `;
    chomp $subject_seq;
    $subject_seq= uc $subject_seq;
    my $min_subject = $fields[7] >= $fields[8] ? $fields[8] : $fields[7] ; 
    my $dist_subject=abs($fields[7] - $fields[8]);
    my $slice_subject=substr($subject_seq, $min_subject -1 , $dist_subject +1 );
    if ($fields[9] < 0 ) { $slice_subject=&reverse_complement_IUPAC($slice_subject);}
    
    print "$fields[0]##$fields[1]\n$slice_query\n$slice_subject\n\n";
    
    
    
#     $slice_subject= ( '-' x ($min_query -1) ) . $slice_subject . ( '-' x (length($query_seq) - $max_query ));
   #$slice_subject=join(' ',unpack("(A3)*", $slice_subject));
#     unless ($is_query_printed{$fields[0]}==1) {
#         print ">$fields[0]\n$query_seq\n";
#         $is_query_printed{$fields[0]}=1;
#     }    
#     print ">$fields[1]\n$slice_subject\n";
   # print STDERR color ("red"), "---------", color ("reset");
}    




##-------------------- aqui termina el codigo -------------------------------
sub help{ 
    my $helpT = qq(
<app> realiza magia que sera descrita proximamente
    
-h imprime esta pagina
    
para mas documentacion usar "perldoc <app>"
);
    print $helpT;
    exit;
    }

    
sub codon_table
{
    my %codon;
    $codon{"TTT"}="F";
    $codon{"TTC"}="F";
    $codon{"TTA"}="L";
    $codon{"TTG"}="L";
    $codon{"CTA"}="L";
    $codon{"CTG"}="L";
    $codon{"CTT"}="L";
    $codon{"CTC"}="L";
    $codon{"ATA"}="I";
    $codon{"ATC"}="I";
    $codon{"ATT"}="I";
    $codon{"ATG"}="M";
    $codon{"GTA"}="V";
    $codon{"GTC"}="V";
    $codon{"GTT"}="V";
    $codon{"GTG"}="V";
    $codon{"TCA"}="S";
    $codon{"TCT"}="S";
    $codon{"TCG"}="S";
    $codon{"TCC"}="S";
    $codon{"CCT"}="P";
    $codon{"CCA"}="P";
    $codon{"CCC"}="P";
    $codon{"CCG"}="P";
    $codon{"ACA"}="T";
    $codon{"ACT"}="T";
    $codon{"ACG"}="T";
    $codon{"ACC"}="T";
    $codon{"GCT"}="A";
    $codon{"GCA"}="A";
    $codon{"GCC"}="A";
    $codon{"GCG"}="A";
    $codon{"TAT"}="Y";
    $codon{"TAC"}="Y";
    $codon{"TAA"}="*";
    $codon{"TAG"}="*";
    $codon{"CAT"}="H";
    $codon{"CAC"}="H";
    $codon{"CAA"}="Q";
    $codon{"CAG"}="Q";
    $codon{"AAT"}="N";
    $codon{"AAC"}="N";
    $codon{"AAG"}="K";
    $codon{"AAA"}="K";
    $codon{"GAT"}="D";
    $codon{"GAC"}="D";
    $codon{"GAG"}="E";
    $codon{"GAA"}="E";
    $codon{"TGG"}="W";
    $codon{"TGA"}="*";
    $codon{"TGC"}="C";
    $codon{"TGT"}="C";
    $codon{"CGT"}="R";
    $codon{"CGC"}="R";
    $codon{"CGG"}="R";
    $codon{"CGA"}="R";
    $codon{"AGA"}="R";
    $codon{"AGG"}="R";
    $codon{"AGT"}="S";
    $codon{"AGC"}="S";
    $codon{"GGG"}="G";
    $codon{"GGC"}="G";
    $codon{"GGA"}="G";
    $codon{"GGT"}="G";
    return %codon;
}    


sub reverse_complement_IUPAC {
        my $dna = shift;

    # reverse the DNA sequence
        my $revcomp = reverse($dna);

    # complement the reversed DNA sequence
        $revcomp =~ tr/ABCDGHMNRSTUVWXYabcdghmnrstuvwxy/TVGHCDKNYSAABWXRtvghcdknysaabwxr/;
        return $revcomp;
}




=head1 VERSION

This documentation refers to <app> version 0.0.1

=head1 SYNOPSIS

-

=head1 USE

-

=head1 OPTIONS

-

=head1 DESCRIPTION

-

=head1 CONFIGURATION AND ENVIRONMENT

-

=head1 DEPENDENCIES

-

=head1 INCOMPATIBILITIES

-

=head1 BUGS AND LIMITATIONS

There are no known bugs in this app.
Please report problems to Vito Adrian Cantu <vito@ibt.unam.mx>

=head1 AUTHOR

Vito Adrian Cantu <vito@ibt.unam.mx>

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2013 Vito Adrian Cantu <vito@ibt.unam.mx>. All rights reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.
 
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
