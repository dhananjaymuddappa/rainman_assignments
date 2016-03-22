histo <- function(fileName, param)
{
	data <- read.csv(fileName)
	title <- paste("Histogram for",param) #to print title using given parameter
	#draw histogram of given parameter with red bars and black border
	hist(data[,param], main=title,xlab="Subject",border="black",col="red")	
}