#runBWAmem

read sequence
read reads
read aligment

echo $sequence
echo $reads

bwa index $sequence

bwa mem $sequence $reads > $aligment.sam

cat $aligment.sam  | samtools sort > $aligment.bam

samtools flagstat $aligment.bam


