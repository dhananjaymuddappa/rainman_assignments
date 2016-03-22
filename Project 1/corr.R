corr <- function(fileName, param1, param2)
{
	data<-read.csv(fileName)
	cc <- cor(data[,param1],data[,param2]) #calculate corr between 2 input parameters
	cc <- round(cc, digits=4) #round to 4 digits
	paste("The correlation coefficient r is: ",cc)
}