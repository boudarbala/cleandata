library(XML)
require(plyr)
require(stringr)

downloadfile <- function() {
    URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
    destfile <- "data/restaurants.xml"
    
    if (!file.exists("data")) {
        dir.create("data")
    }
    
    ## TODO: Check file age, download again if older than xxx 
    if (!file.exists(destfile)) {
        download.file(URL, destfile, method="curl")
    }
    
    doc <- xmlTreeParse(destfile, useInternal=TRUE)
    rootNode <- xmlRoot(doc)
    zipcodes <- xpathSApply(rootNode, "//zipcode", xmlValue)
    sum(str_count(zipcodes, "21231"))
}
