#!/bin/bash

REF=EColi_CHO_4plasmCl4.fa
R1=ZDEISCR2-GED-G007WGS-MG-350129749-2-69-F.fq.gz
R2=ZDEISCR2-GED-G007WGS-MG-350129749-2-69-F.fq.gz

#Bwa mem aligment
bwa index $REF

bwa mem -t 3 $REF $R1 $R2 | samtools view -Sbh  | samtools sort > $REF.bam

samtools flagstat $REF.bam

samtools index $REF.bam

#Find SNP and indels
bcftools mpileup -Ou -f $REF $REF.bam | bcftools call -mv -Oz -o $REF.vcf.gz

# extracting discordant paired-end vector alignments
samtools view -h $REF.bam | awk '($3!=$7 && $7!="=")' | samtools view -Sbh > 4BGD_diffchr.bam

#Clipping
samtools view -f 2048 -Sbh $REF.bam > 4BGD_clips.fq.gz
