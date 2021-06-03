#2021.04.27. TUE
#Hankyeong

#01. koNLP 패키지 설치하기.
#step1. Java 경로 설정하고 확인하기. 
Sys.setenv(JAVA_HOME="C:/Program Files/Java/jre1.8.0_291")
Sys.getenv("JAVA_HOME")

#step2. rJava 패키지 설치하기.
install.packages("rJava", dependencies = T)
library(rJava) 

#step3. KoNLP패키지 설치를 위한 준비하기.
install.packages("remotes")
library(remotes)
install_github("haven-jeon/KoNLP",upgrade="never",
               INSTALL_opts=c("--no-multiarch"))

#step4. Rstudio 언어설정을 초기화하고, 한국어로 설정하기.
Sys.setlocale("LC_ALL","C")
Sys.setlocale("LC_ALL","Korean")

#step5. 사전 설정하기.
library(KoNLP)
useNIADic()

#02. 애국가에서 명사 추출해서 워드클라우드 만들기.
#step1. 애국가(가사) 데이터셋 준비 후 명사 추출하기.
word_data <- readLines("d:/R_project/Hankyeong_DataAnalytics/Data/애국가(가사).txt")
word_dt_noun <- sapply(word_data,
                       extractNoun, #명사만 추출
                       USE.NAMES=F) ; word_dt_noun

#step2. 사용자 정의 사전에 새로운 단어를 별도로 추가하기.
add_words <- c("백두산","남산","철갑","가을","하늘","달")
buildDictionary(user_dic=data.frame(add_words,rep("ncn",length(add_words))),
                replace_usr_dic=T)
word_dt_n_2 <- sapply(word_data,extractNoun,USE.NAMES=F) ; word_dt_n_2

#TIP. 사용자 정의 사전 함수 재정의(간략화)하기.
add_words_2 <- data.frame(term=c("백두산","남산","철갑","가을","하늘","달"),
                          tag="ncn")
buildDictionary(user_dic = add_words_2,replace_usr_dic=T)

#step3. 리스트를 벡터로 변환하기.
word_dt_n_2_vect <- unlist(word_dt_n_2) ; word_dt_n_2_vect
word_dt_n_2_vt_table <- table(word_dt_n_2_vect) ; word_dt_n_2_vt_table

#step4. 벡터에서 2개 이상인 글자만 필터링 하기.
word_dt_n_2_vect_2 <- Filter(function(x){ nchar(x) >= 2 }, word_dt_n_2_vect)
word_dt_n_2_vt_2_table <- table(word_dt_n_2_vect_2) ; word_dt_n_2_vt_2_table

#step5. 데이터 정렬하기.
sort(word_dt_n_2_vt_2_table, decreasing=TRUE)

#step6. wordcloud2 패키지로 텍스트마이닝 결과 시각화하기. 
install.packages("wordcloud2")
library(wordcloud2)
wordcloud2(word_dt_n_2_vt_2_table)

#TIP. 배경 등 색상 추가하기. 
wordcloud2(word_dt_n_2_vt_2_table, 
           color="random-light",
           backgroundColor="black")

#03. stringr 패키지를 사용해 단어를 필터링하여, 워드클라우드 생성하기.
#step1. str_extract_all()를 이용해 한글만 추출하기.
library(stringr)
word_dt_n_2_filter <- str_extract_all(word_dt_n_2, "[가-힣]{2,}")

#step2. unlist()를 이용해 리스트를 벡터로 변환하기.
word_dt_n_2_fl_vect <- unlist(word_dt_n_2_filter) 

#step3. 데이터 정렬하기.
word_dt_n_2_fl_vt_table <- table(word_dt_n_2_fl_vect)

#step4. 텍스트마이닝 결과 시각화하기.
wordcloud2(word_dt_n_2_fl_vt_table, 
           color="random-light",
           backgroundColor="black")
