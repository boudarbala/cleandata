library(httr)


# use BROWSE to launch in the browser
repos <- GET("https://api.github.com/users/jtleek/repos",
            authenticate("d42c2695eef5cb77d7c4fa29123a675eeba9a920",
                         "x-oauth-basic","basic"))

json1 <- content(repos)
list(json1[[5]]$name, json1[[5]]$created_at)