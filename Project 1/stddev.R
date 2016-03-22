stddev <- function(fileName, param)
{
	data <- read.csv(fileName)
	sd(data[,param], na.rm=FALSE) #sd function to calculate sd of given parameter
}