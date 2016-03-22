freq <- function (fileName,param)
{
	data <- read.csv(fileName,header=T) #input data set
	library(plyr) #use this lib for count function
	count(data,param) #count function displays the name and its frequency
}
	