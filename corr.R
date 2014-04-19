#Write a function that takes a directory of data files and a threshold
#for complete cases and calculates the correlation between sulfate and
#nitrate for monitor locations where the number of completely observed
#cases (on all variables) is greater than the threshold. The function
#should return a vector of correlations for the monitors that meet the
#threshold requirement. If no monitors meet the threshold requirement,
#then the function should return a numeric vector of length 0. A prototype
#of this function follows

  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations


corr <- function(directory, threshold = 0) {
  
  juuri=c("~/Dataa/specdata/")
  directory=paste(juuri,directory,"/", sep="")
  setwd(directory)
  tiedostot=list.files()
  corr_lista=c()
  
  for(i in 1:(as.numeric(length(tiedostot)))){
  validit=na.omit(read.csv(tiedostot[i]))
  nobs=nrow(validit)
  if (nobs>threshold){
  correlation=cor(as.numeric(validit[,2]), as.numeric(validit[,3]))
  corr_lista=c(corr_lista, correlation)
  }
  }
  corr_lista
}


 
  
