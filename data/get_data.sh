#!/bin/bash
##
## Generates the course folder structure and retrieves the data, just in case
##
## 11th March 2019


echo Data retrieval

cd ~  # goes to the home directory

mkdir -p course/data course/soft # multiple directories can be created at once

cd  ~/course/data

curl http://gattaca.imppc.org/groups/maplab/imallona/teaching/example.bed \
   > example.bed

curl http://gattaca.imppc.org/groups/maplab/imallona/teaching/hg19.genome \
     > hg19.genome

curl -L https://github.com/samtools/samtools/raw/develop/examples/ex1.sam.gz \
  > ex1.sam.gz

curl -O https://molb7621.github.io/workshop/_downloads/SP1.fq

curl -L http://genomedata.org/rnaseq-tutorial/annotations/GRCh38/chr22_with_ERCC92.gtf > chr22_with_ERCC92.gtf

curl -L ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/pilot_data/paper_data_sets/a_map_of_human_variation/low_coverage/sv/CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf.gz > CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf.gz

curl -O https://s3.amazonaws.com/bedtools-tutorials/web/exons.bed

curl -O https://s3.amazonaws.com/bedtools-tutorials/web/hesc.chromHmm.bed

echo Soft installs

## compile bedtools

mkdir -p ~/course/soft

cd ~/course/soft

curl -L https://github.com/arq5x/bedtools2/releases/download/v2.25.0/bedtools-2.25.0.tar.gz \
  > bedtools-2.25.0.tar.gz

tar zxvf bedtools-2.25.0.tar.gz
cd bedtools2
make  # will take time! you could read about Makefiles during compiling time
alias bedtools='~/course/soft/bedtools2/bin/bedtools'

bedtools --help

# compile vcftools

cd ~/course/soft/

curl -L https://sourceforge.net/projects/vcftools/files/vcftools_0.1.13.tar.gz/download > \
   vcftools.tar.gz

tar xzvf vcftools.tar.gz

cd vcftools_0.1.13/

make

alias vcftools="~/course/soft/vcftools_0.1.13/bin/vcftools"

vcftools --help


## packing up

tar czvf ~/course.tgz ~/course
