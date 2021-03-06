setwd("C:\\Users\\Navneetha\\Desktop\\Sequences.csv")
ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1")
#searches the nuccore database for the ncbi ids given above and outputs it in fasta format
Bburg<-rentrez::entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")
Sequences<-strsplit(Bburg,"\\s{2,}",fixed = F)
Sequences<-unlist(Sequences)
header<-gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences)
seq<-gsub("^>.*sequence\\n([ATCG].*)","\\1",Sequences)
Sequences<-data.frame(Name=ncbi_ids,sequence=seq)
write.csv(Sequences,file = "Sequences.csv")
read.csv(file = "Sequences.csv")
