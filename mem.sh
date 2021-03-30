#runBWAmem

read -p "reference: " sequence
read -p "reads: " reads
read -p "aligment name: : " aligment

echo $sequence
echo $reads

bwa index $sequence

bwa mem $sequence $reads > $aligment.sam

cat $aligment.sam  | samtools sort > $aligment.bam

samtools flagstat $aligment.bam


