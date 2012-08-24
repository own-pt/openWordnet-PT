
# stopwords <- read.table("http://members.unine.ch/jacques.savoy/clef/portugueseST.txt", stringsAsFactors = FALSE)
stopwords <- read.table("portugueseST.txt", stringsAsFactors = FALSE)
# Encoding(stopwords$word ) <- "latin1"
Encoding(stopwords$V1) <- "UTF-8"
stopwords$upper <- toupper(stopwords$V1)
names(stopwords) <- c("STOP", "upper")
stopwords$STOP <- TRUE

counts <- read.table("../cpdoc/dhbb/counts-dhbb.csv", sep = "|", stringsAsFactors = FALSE,
                     quote = "\"", comment.char = "")
names(counts) <- c("upper", "count")

data.merged1 <- merge(counts, stopwords, all.x = TRUE)
data.merged1[is.na(data.merged1$STOP), "STOP"] <- FALSE

rows <- unique(c(grep("[!#~.,;?$%&()+*:<>@_/=]", data.merged1$upper),
                 grep("[", data.merged1$upper, fixed=TRUE),
                 grep("]", data.merged1$upper, fixed=TRUE),
                 grep("\\", data.merged1$upper, fixed=TRUE),
                 grep("-", data.merged1$upper, fixed=TRUE),
                 grep("^[0-9].*", data.merged1$upper)))

data.merged1[rows, "STOP"] <- TRUE
          
tmp <- subset(data.merged1, STOP == FALSE)


