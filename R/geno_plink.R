
##' @description geno_plink is a function which can convert genotype data to PLINK data
##' @title a tool converting genotype data to PLINK format
##' @param genoRaw a dataframe or matrix is genotype data from ilumina device,
##'                which have two parts: the first colname represented snps name and '...' represented genotype of different indiviual
##'                Futhermore, genoRaw must own column names of different individual.
##' @param map a logical value. If FLASE, the function will not need the newest60K_Map variable and not require the *.map file.
##'            If TRUE, we will merge the newest 60K map file and obtain the *.map file, but the ID of genoRaw must be Illumina mkName.
##' @param mapName a character represents the name of *.map file
##' @param pedName a character represents the name of *.ped file
##' @param famID a vector represents Family ID
##' @param SIRE a vector represents  Paternal ID
##' @param DAM a vector represents Maternal ID
##' @param SEX a vector indiviual sex  (1=male; 2=female; other=unknown)
##' @param PHE a vector represents The phenotype which can be either a quantitative trait or an affection status column
##' @return two file : *.ped file and *.map file, but *.ped file haven't pedigree information, they are all assigned 0 or 1
##' @author Feng Zhang
##' @details newest60K_Map contains the newest 60k information and all Version 1 and version 2 marks 
##' @importFrom utils write.table


geno_plink <- function(genoRaw,map=FALSE,mapName='res.map',pedName='res.ped',famID,SIRE,DAM,SEX,PHE){

  # prepare the clean genotype data
  if(map){
    colnames(genoRaw)[1]<- "mkName"
    map <- merge(genoRaw[,1,drop=F],newest60K_Map,by="mkName",all.X=TRUE)
    map = map[,c(2,1,3,4)]
    write.table(map,file=mapName,col.names=F,row.names=F,quote=F,sep=" ")
  }

  #ped file
  genoRaw = t(genoRaw[,-1])#only two parts: snpName, genotype for other individual
  ID = rownames(genoRaw)
  if(missing(famID)) famID = 1:nrow(genoRaw)
  if(missing(SIRE)) SIRE = rep(0,nrow(genoRaw))
  if(missing(DAM)) DAM = rep(0,nrow(genoRaw))
  if(missing(SEX)) SEX = rep(1,nrow(genoRaw))
  if(missing(PHE)) PHE = rep(1,nrow(genoRaw))

  #split genotype by space
  for(i in 1:ncol(genoRaw)){
    genoRaw[,i][ genoRaw[,i]=="--" | genoRaw[,i]=="" ] <- "00"
    genoRaw[,i]=paste(substr(genoRaw[,i],1,1),substr(genoRaw[,i],2,2),sep=" ")
    cat(i," ")
  }

  ped = data.frame(famID,ID,SIRE,DAM,SEX,PHE,genoRaw)
  write.table(ped,pedName,col.names=FALSE,row.names=FALSE,quote=FALSE,sep=" ")
}
