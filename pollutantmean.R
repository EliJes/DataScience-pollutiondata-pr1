

##pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)

pollutantmean <- function(directory="specdata", pollutant="sulfate", id=1:332){
  
  juuri="~/Dataa/specdata/"
  setwd(juuri)
  hakemisto=paste(juuri,directory,"/", sep="")
  laskettavat=c()
  for(i in id){ 
    tiedosto=paste(hakemisto,sprintf("%03d",i),".csv", sep="")
    ladataan=read.csv(tiedosto)
    validit=na.omit(ladataan[,pollutant])
    laskettavat=c(laskettavat, validit)
  }
  round(mean(laskettavat), digits=3)
}


