#Write a function that reads a directory full of files and reports
#the number of completely observed cases in each data file. The function
#should return a data frame where the first column is the name of the file
#and the second column is the number of complete cases. A prototype of this
#function follows


  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  

complete <- function(directory="specdata", id = 1:332) {
  juuri="~/Dataa/specdata/"
  tiedosto=paste(juuri,directory,"/", sep="")
  setwd(tiedosto)
  tiedostot=list.files()
  lkm=c()
  nrot=c()
  
  for (i in id){
    tiedot=read.csv(paste(tiedosto,tiedostot[i], sep=""))
    nro=as.integer(substr(tiedostot[i],1,3))
    nrot=c(nrot,nro)
    validien_lkm=nrow(na.omit(tiedot))
    lkm=c(lkm, validien_lkm)
  }
  df=data.frame(nrot, lkm)
  colnames(df)=c("id","nobs")
  df
}
#complete("specdata", c(2, 4, 8, 10, 12))

