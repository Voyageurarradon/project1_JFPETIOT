##############  read the file in the working directiory###################################"
household_power_consumption <- read.csv("~/household_power_consumption.txt", sep=";")
attach(household_power_consumption)
############## to check the names of the variables#####################"
colnames(household_power_consumption)
##############  transformation in a data .frame#################"""
fichier1=data.frame(household_power_consumption)
attach(fichier1)

Sub_metering_1=as.numeric(as.character(Sub_metering_1))
Sub_metering_2=as.numeric(as.character(Sub_metering_2))
Sub_metering_3=as.numeric(as.character(Sub_metering_3))
################## Creation of a Date variable#################
fichier1$Date_c=as.Date(fichier1$Date,format="%d/%m/%Y")


######### sub file with only 1st and 2nd February################"

fichier1_2fev=fichier1[fichier1$Date_c=="2007-02-01" | fichier1$Date_c=="2007-02-02",]
fichier1_2fev=data.frame(fichier1_2fev)
fichier1_2fev$x=format(as.POSIXct(paste(fichier1_2fev$Date_c,fichier1_2fev$Time)), "%Y-%m-%d %H %M %S")
fichier1_2fev$x[1:10]

detach(household_power_consumption)
detach(fichier1)
attach(fichier1_2fev)
fichier1_2fev$xy=as.factor(fichier1_2fev$x)


fichier1_2fev$Sub_metering_1=as.numeric(as.character(fichier1_2fev$Sub_metering_1))
fichier1_2fev$Sub_metering_2=as.numeric(as.character(fichier1_2fev$Sub_metering_2))
fichier1_2fev$Sub_metering_3=as.numeric(as.character(fichier1_2fev$Sub_metering_3))


png("plot3.png", bg="transparent", width=480, height=480)
plot(fichier1_2fev$Sub_metering_1~fichier1_2fev$xy,type="l",lty=1,xaxt="n",yaxp=c(0,30,3),xlab=" ",ylab="Energy Sub metering",ylim=c(0,35))
lines(fichier1_2fev$Sub_metering_2~fichier1_2fev$xy,type="l",lty=1,col="red")
lines(fichier1_2fev$Sub_metering_3~fichier1_2fev$xy,type="l",lty=1,col="blue")
lines(fichier1_2fev$xy,fichier1_2fev$Sub_metering_1,type="l",lty=1,lwd=1,col="black")
legend("topright",col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1))
mtext(c("Thu","Fri","Sat"),side=1, line=1,at=c(1,1441,2880))
dev.off()
