install.packages("twitteR")
install.packages("wordcloud")
install.packages("tm")

library(twitteR)
library(wordcloud)
library(tm)

download.file(url = "http://curl.haxx.se/ca/cacert.pem", destfile = "E:\\DATA\\tutorials\\Data Science\\project\\twitter\\cacert.pem")

#to get your consumerKey and consumerSecret see the twitteR documentation for instructions
consumer_key <- 'nv7WOzLUS9DDxBduaEMOOSe8k'
consumer_secret <- 'nMvdMztiaowztAdmKnzMcubIvrT2UszHjes1j3gJ51Zc3IPEw4'
access_token <- '2311430767-eSPOZz1vlR1OcZKMmUjnE6QzyvBcYAY6g0PcVsN'
access_secret <- 'NURQgqe1Qa8UQBsyGWbCxcXFyQXab3g3t2ENVx6C1hMgl'
setup_twitter_oauth(consumer_key,
                    consumer_secret,
                    access_token,
                    access_secret)

#the cainfo parameter is necessary only on Windows
r_stats <- searchTwitter("datascience ", n=1500)
#should get 1500
length(r_stats)

#save text
r_stats_text <- sapply(r_stats, function(x) x$getText())

r_stats_text
RemoveHTTP <- function(tweet) {
  gsub('http[[:alnum:][:punct:]]+', '', tweet)
}
RemoveAtPeople <- function(tweet) {
  gsub('@\\w+', '', tweet)
}
RemoveHTTP(r_stats_text)
RemoveAtPeople(r_stats_text)
r_stats_text

r_stats_text <- sapply(r_stats_text,function(row) iconv(row, "latin1", "ASCII", sub=""))
r_stats_text

#create corpus
r_stats_text_corpus <- Corpus(VectorSource(r_stats_text))
r_stats_text_corpus <- tm_map(r_stats_text_corpus, content_transformer(tolower))
r_stats_text_corpus <- tm_map(r_stats_text_corpus, removePunctuation)
#r_stats_text_corpus$text <- sapply(r_stats_text_corpus$text,function(row) iconv(row, "latin1", "ASCII", sub=""))
r_stats_text_corpus <- tm_map(r_stats_text_corpus, function(x)removeWords(x,stopwords()), mc.cores=1)
wordcloud(r_stats_text_corpus,colors=brewer.pal(8, "Dark2"))
