#2021.04.29. THU
#Hankyeong

#01. 네이버 영화 평점 웹크롤링하기. 
install.packages("revest")
library(rvest)

#step1. URL 링크 설정
main_url <- "https://movie.naver.com/movie/bi/mi/pointWriteFormList.nhn?code=62586&type=after&onlyActualPointYn=N&onlySpoilerPointYn=N&order=newest&page="

#step2. 웹크롤링을 위한 for문 세팅하기.
reply_list <- character()
star_list <- numeric()
date_list <- character()
page_url <- 1

#step3. 웹크롤링 시작하기.
for(page_url in 1:2709){
  
  url <- paste(main_url,page_url,sep="")
  content <- read_html(url)
  node_1 <- html_nodes(content, ".score_reple p")
  node_2 <- html_nodes(content, ".score_result .star_score em")
  node_3 <- html_nodes(content, ".score_reple em:nth-child(2)")
  
  reply <- html_text(node_1)
  star <- html_text(node_2)
  date <- html_text(node_3)
  date <- as.Date(gsub("\\.","-",date)) #date 변수를 날짜 유형으로 변환하기.
  
  reply_list <- append(reply_list,reply)
  star_list <- append(star_list,star)
  date_list <- append(date_list,date)
  
  cat("Web crawling ",page_url," page.","\n",sep="")
}

#step4. 추출한 reply, star, date 변수를 데이터프레임으로 변환하기.
crawling_df <- data.frame(COMMENT=reply_list,STAR=star_list,DATE=date_list)