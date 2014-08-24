library(xlsx)

downloadfile <- function() {
    URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
    destfile <- "data/gov_NGAP.xlsx"
    
    if (!file.exists("data")) {
        dir.create("data")
    }
    
    ## TODO: Check file age, download again if older than xxx 
    if (!file.exists(destfile)) {
        download.file(URL, destfile, method="curl")
    }
    
    rowIndex <- 18:23
    colIndex <- 7:15
    
    dat <- read.xlsx(destfile, sheetIndex=1, 
                     colIndex=colIndex, rowIndex=rowIndex, header=TRUE)
    
    dat
}

