filecreate <- function(datesFile, holidaysFile)
{
	data <- read.csv(fileName) #read the file
	hol <- read.csv(holidaysFile)
	data[,2] = rownames(data) #assign 2nd col name of each row(i.e row serial)
	
	# now to get the day matrix 
	days <- weekdays(as.Date(data$Date, "%m/%d/%Y")) #stores days for corresponding day
	for(i in 1:nrow(data))
	{
		if(days[i] == "Monday")
			data[i,3] <- 1
		else if(days[i] == "Tuesday")
			data[i,4] <- 1
		else if(days[i] == "Wednesday")
			data[i,5] <- 1
		else if(days[i] == "Thursday")
			data[i,6] <- 1
		else if(days[i] == "Friday")
			data[i,7] <- 1
		else if(days[i] == "Saturday")
			data[i,8] <- 1
		else if(days[i] == "Sunday")
			data[i,9] <- 1
	}
	
	#now to get the month matrix
	month <- format.Date(as.Date(dates,"%m/%d/%Y"), "%m")
	for(i in 1:nrow(data))
	{
		if(month[i] == "01")
			data[i,10] <- 1
		else if(month[i] == "02")
			data[i,11] <- 1
		else if(month[i] == "03")
			data[i,12] <- 1
		else if(month[i] == "04")
			data[i,13] <- 1
		else if(month[i] == "05")
			data[i,14] <- 1
		else if(month[i] == "06")
			data[i,15] <- 1
		else if(month[i] == "07")
			data[i,16] <- 1	
		else if(month[i] == "08")
			data[i,17] <- 1
		else if(month[i] == "09")
			data[i,18] <- 1
		else if(month[i] == "10")
			data[i,19] <- 1
		else if(month[i] == "11")
			data[i,20] <- 1
		else if(month[i] == "12")
			data[i,21] <- 1
	}
	
	#get week number using week1 1-8 week2 9-15 week3 16-24 week4 25-31 
	date <- as.integer(format.Date(as.Date(dates,"%m/%d/%Y"), "%d"))
	for(i in 1:nrow(data))
	{
		if(date[i]>0 && date[i]<9 )
			data[i,22] <- 1
		else if(date[i]>=9 && date[i]<16 )
			data[i,23] <- 1
		else if(date[i]>=16 && date[i]<25 )
			data[i,24] <- 1
		else if(date[i]>=25 && date[i]<31 )
			data[i,25] <- 1
	}
	
	#to assign holidays using given excel holiday sheet
	holmon <- format.Date(as.Date(hol$Date,"%m/%d/%Y"), "%m")
	holdate <- format.Date(as.Date(hol$Date,"%m/%d/%Y"), "%d")
	holname <- as.character(hol$Holiday.Name)
	holarr <- cbind(holdate,holmon,holname)
	for(j in 1:nrow(holarr))
	{
		for(i in 1:nrow(data))
		{
			if(as.integer(holarr[j,1]) == date[i] && as.integer(holarr[j,2]) == as.integer(month[i]))
			{
				data[i,26]=1
				data[i,27]=holarr[j,3]
			}
		}
	}
	
	#convert na to 0
	data[is.na(data)] <- 0
	
	write.csv(data,"data.csv")
}
	