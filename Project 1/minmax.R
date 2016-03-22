#function to calculate min or max of a column using apply function
minmax <- function(fileName,i,flag=1) #default max calculated
{
	data <- read.csv(fileName,header=T)
	if(flag == 0) #if flag = 0 then calculate min
		apply(data[i],2,min) 
	else #else calculate max
		apply(data[i],2,max)
}