# graph accelerometer and gyro data 

require(ggpubr); require(data.table); require(dplyr); require(reshape2); require(bit64)

acc <- fread("accelerometer-1536446739.csv", header = T)
gyro <- fread("gyro-1536446739.csv", header = T)

plotData <- function(rdat) {
    rdat$timestamp <- rdat$timestamp - rdat$timestamp[1] # normalize
    rdat$timestamp <- as.integer(rdat$timestamp)
    
    dat <- rdat[seq(1, length(rdat$timestamp), 100)] # subsampling
    dat_melted <- melt(dat, id.vars = "timestamp")

    ggline(dat_melted, "timestamp", "value", linetype = "variable", shape = "variable") #plot
}


plotData(acc)
plotData(gyro)

