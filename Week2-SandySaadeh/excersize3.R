#importing the data
data <- read.table("C:\\Users\\sandy\\Downloads\\whaledata.txt", header= TRUE, sep= "\t")
data
head(data)
names(data)
str(data)
#month is a character and water.noise is also the same
summary(data)
whale.sub <- data[1:10, 1:4]
whale.sub
whale.num <- data[,c(1,3,4)]
whale.num
rows_all_coloumns <- data[c(1:50),]
rows_all_coloumns
rows_coloumns <- data[c(11:101),c(1:7)]
rows_coloumns
head(data)
data_depth <- data[data$depth >1200, ]
data_depth
data_gradient <- data[data$gradient>200, ]
data_gradient
data_median <- median(data$gradient)
data_median
data_gradient_median <- data['month'=="October" & 'water.noise'=="low" & 'gradient'>data_median, ]
data_gradient_median
mean_whales <- mean(data$number.whales, na.rm = TRUE)
var1 <- data[data$depth > 1500 & data$number.whales > mean_whales,]
var1
# Use the subset() function to extract all rows in ’May’ with a time at station
#less than 1000 minutes and a depth greater than 1000 m. Also use subset() 
#to extract data collected in ‘October’ from latitudes greater than 61 degrees
#but only include the columns month, latitude, longitude and number.whales.
var2 <- subset(data,month=="May" &
                 time.at.station<1000 & depth>1000 )
var2
whale.depth.sort <- data[order(data$depth),]
whale.depth.sort
using_aggregate <- aggregate(data[,c(2,4,7,8)], by= list(month= data$month), FUN = mean, na.rm= TRUE)
using_aggregate
#for each level for water noise
table <- table(data$water.noise)
table
the_file <- "C:\\Users\\sandy\\Downloads\\whaledata.txt"
write.table(whale.num, file= the_file, 
                                col.names = TRUE, row.names = FALSE, sep = "\t")
