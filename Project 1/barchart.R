barchart <- function (fileName, param)
{
	data <- read.csv(fileName,header=T) #input data set
	library(plotly)
	column_data <- count(data, param) #use count function to count the frequency of a given name
	names <- column_data[1] #store names 
	frequency <- column_data[2] #store frequency of the names
	frequency <- as.numeric (unlist(frequency)) #convert from list to numeric
	name2 <- as.character(unlist(names))#convert from list to characters
	barplot(frequency, names.arg=name2, horiz=TRUE, las=1, cex.names=0.5, border=NA)
 
}