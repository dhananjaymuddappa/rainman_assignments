piechart <- function(fileName, param)
{  
     	data <- read.csv(fileName, header=T)
      column_data <- count(data, param) #use count function to count the frequency of a given name
	names <- column_data[1] #store names 
	frequency <- column_data[2] #store frequency of the names
	frequency <- as.numeric (unlist(frequency)) #convert from list to numeric
	names <- as.character(unlist(names))#convert from list to characters
	pie(frequency,labels=names,radius=0.9, main="Pie Chart of Names")
	#draw piechart using pie function
}