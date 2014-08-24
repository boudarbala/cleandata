library(data.table)

downloadfile <- function() {
    URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
    destfile <- "data/Fss06pid.csv"
    
    if (!file.exists("data")) {
        dir.create("data")
    }
    
    ## TODO: Check file age, download again if older than xxx 
    if (!file.exists(destfile)) {
        download.file(URL, destfile, method="curl")
    }
    
    DT <- fread(destfile, sep=",")
    
    DT
}

