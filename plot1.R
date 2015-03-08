
##############  read the file in the working directiory###################################"
household_power_consumption <- read.csv("~/household_power_consumption.txt", sep=";")
attach(household_power_consumption)
############## to check the names of the variables#####################"
colnames(household_power_consumption)
##############  transformation in a data .frame#################"""
fichier1=data.frame(household_power_consumption)
attach(fichier1)
fichier1[1:10,]
class(fichier1$Date)
par(mfrow=c(1,1))
################## Creation of a Date variable#################
fichier1$Date_c=as.Date(fichier1$Date,format="%d/%m/%Y")

######### sub file with only 1st and 2nd February################"

fichier1_2fev=fichier1[fichier1$Date_c=="2007-02-01" | fichier1$Date_c=="2007-02-02",]

detach(household_power_consumption)
detach(fichier1)
attach(fichier1_2fev)


class(fichier1_2fev$Global_active_power)
###########  GAP is not numeric#################################### : corrected here#############
fichier1_2fev$Global_active_power=as.numeric(as.character(fichier1_2fev$Global_active_power))

###########  minimum of GAP is 74 and maximum is 3692 #############
summary(fichier1_2fev$Global_active_power)
##### To obtain values of GAP between 0 and 6 as on the histogram that we must create, we must divide the actual value by 500 Why???### 


png("plot1.png", bg="transparent", width=480, height=480)
hist(fichier1_2fev$Global_active_power,col="red",ylim=c(0,1200), main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()


