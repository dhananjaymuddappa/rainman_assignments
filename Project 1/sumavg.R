sumavg <- function(fileName, param)
{
	data <- read.csv(fileName)
	total <- sum(data[,param]) #get total
	avg <- total/length(data[,param]) #divide by no. of elements in col to get avg
	avg <- round(avg, digits=2) #round to 2 digits
	paste("Total is", total, "and the average is", avg) #print
}