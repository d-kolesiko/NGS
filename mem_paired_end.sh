#mem_paired_end

read -p "reference: " REF
read -p "read1: " R1
read -p "read2: " R2
read -p "aligment name: : " aligment


bwa index $REF

bwa mem $REF $R1 $R2 > $aligment.sam 2>> bwa.log.txt

cat $aligment.sam  | samtools sort > $aligment.bam

samtools flagstat $aligment.bam

samtools index $aligment.bam

