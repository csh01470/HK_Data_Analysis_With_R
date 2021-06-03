#2021.04.29. THUR
#Hankyeong

#01. Web Crawling & Text mining
#step1. URL 링크 설정하기.
main_url <- "https://movie.naver.com/movie/bi/mi/pointWriteFormList.nhn?code=62586&type=after&onlyActualPointYn=N&onlySpoilerPointYn=N&order=newest&page="

#step2-1. 웹크롤링 시작하기.
library(rvest)
main_url
reply_list <- character()
star_list <- numeric()
date_list <- character()

for(i in 1:2709){
  
  url <- paste(main_url,i,sep="")
  content <- read_html(url)
  node_1 <- html_nodes(content, ".score_reple p")
  node_2 <- html_nodes(content, ".score_result .star_score em")
  node_3 <- html_nodes(content, ".score_reple em:nth-child(2)")
  
  reply <- html_text(node_1)
  star <- html_text(node_2)
  date <- html_text(node_3)
  date <- as.Date(gsub("\\.","-",date)) #date 변수를 Date type으로 바꾸기.
  
  reply_list <- append(reply_list,reply)
  star_list <- append(star_list,star)
  date_list <- append(date_list,date)
  
  cat(paste(i,"페이지를 크롤링 중입니다.","\n",sep=""))
}

#step2-2. 크롤링한 데이터를 데이터 프레임으로 변경하기. 
crawling_df <- data.frame(COMMENT=reply_list,STAR=star_list,DATE=date_list)

#step3. 비정형 데이터 전처리
library(stringr)
crawling_df_e1 <- str_replace_all(crawling_df$COMMENT,"[^[가-힣] ]","")
head(crawling_df_e1,100)

#step4-1. 형태소 분리 준비하기. 
Sys.setlocale("LC_ALL","C")
Sys.setlocale("LC_ALL","korean")
library(KoNLP)
useSejongDic()
useNIADic()

#step4-2. 형태소 분리하기.
text_category <- SimplePos22(crawling_df_e1)

#step5. 체언 추출하기
text_c_n1 <- str_match_all(text_category,"[가-힣]{1,}/N[A-Z]{1}")

#step6. 변수명 간략화하기.
term <- text_c_n1

#step7. 리스트에서 벡터로 변경하기.
term_unlist <- unlist(term)

#step8. 태그 제거하기.
term_ul_eta <- str_replace_all(term_unlist,"/+[A-Z]{1,2}","")

#step9. 1글자인 단어들 제거하기. 
term_ul_eta_2char <- ifelse(nchar(term_ul_eta)<=1,NA,term_ul_eta)

#step10. 빈도표를 만들고 필요없는 단어 삭제하기.
sort(table(term_ul_eta_2char), decreasing = T)
term_ul_eta_2char_esw <- str_replace_all(term_ul_eta_2char,"영화","")

#step11. 빈도를 내림차순하여 최종 빈도표 만들기.
text_mining <- sort(table(term_ul_eta_2char_esw),decreasing=T)

#step12. 텍스트 마이닝 시각화하기.
library(wordcloud2)
wordcloud2(text_mining,
           rotateRatio = 0,color = "random-light", backgroundColor = "black")