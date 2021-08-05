#! /usr/bin/python3
with open ('cho_1_non_mappers.fastq') as f:
  mylist=[]
  s=0
  a=0
  for line in f:
    if s < 4:
      mylist.append(line)
      s=(s+1)
  
    else:
      mylist = [j.rstrip() for j in mylist]
      str1 = mylist[1]
      str3 = mylist[3]
      n=str1.find('GATC')
      if n==-1:
        a+=1
      else:	
        print(mylist[0], str1[0:(n+1)], mylist[2], str3[0:(n+1)], sep = '\n')
        print(mylist[0], str1[(n+1)::], mylist[2], str3[(n+1)::], sep = '\n')
      mylist = []
      mylist.append(line)
      s=1

