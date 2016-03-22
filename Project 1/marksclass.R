marksclass <- function (fileName)
{
	data <- read.csv(fileName)
	#data frame
	student_class <- data.frame("Name" = character(49), 
					    "Average" = numeric(49), 
					    "Class" = character(49), 
					     stringsAsFactors=FALSE) 
	numeric_data <- data[5:13]
	summed <- rowSums(numeric_data[, c(1, 2, 3,4, 5,6,7,8,9)]) #sum of each student
	avg <- round(summed/9,digits=2)#get average marks of each student

	student_class[,1] <- data$Student.Name #assign name to 1st col of dataframe
	student_class[,2] <- avg #assign calculate avg to 2nd col of dataframe
	
	#assign class
	for (i in 1:49)
	{
		if(avg[i] >=70)
			student_class[i,3] <- "DISTINCTION"
		else if(avg[i] <70 && avg[i]>=60)
			student_class[i,3] <- "FIRST CLASS"
		else 
			student_class[i,3] <- "SECOND CLASS"
	}
	#check if student has failed in any subject and assign failed class if they have
	for (i in 1:49)
	{
		for (j in 1:9)
		{
			if(numeric_data[i,j] < 35)
			{
				student_class[i,3] <- "FAILED"
				break
			}
		}
	}

	student_class #display the data
}
	
	