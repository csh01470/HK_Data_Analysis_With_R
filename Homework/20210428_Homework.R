#2021.04.28. WED
#Hankyeong

#01. Text-mining
#step0. 시스템 언어 한글로 재설정하기.
Sys.setlocale("LC_ALL","C")
Sys.setlocale("LC_ALL","korean")

#step1. 파일 불러오기.
text_dt <- readLines("d:/R_project/Hankyeong_DataAnalytics/Data/110_jeju.txt")
head(text_dt,5)

#step2. 한글, 영어, 숫자, 공백을 포함하고 특수기호 제거하기.
library(stringr)
text_dt_rpss <- str_replace(text_dt,"[^[A-Za-z가-힣0-9][\t]]","")
head(text_dt_rpss,5)

#step3. 품사 분류하기.
library(KoNLP)
useSejongDic()
useNIADic()
text_dt_rpss_e1 <- SimplePos22(text_dt_rpss)
head(text_dt_rpss_e1)

#step4. 명사 추출하기.
text_dt_rpss_e1_n1 <- str_match(text_dt_rpss_e1,"[가-힣]{1,}+/N+[A-Za-z]{1}")
text_dt_rpss_e1_n2 <- str_match(text_dt_rpss_e1,"[가-힣]{1,}+/N")

#step5. Not Available 제거하기.
text_dt_rpss_e1_n1_ena <- na.omit(text_dt_rpss_e1_n1)
text_dt_rpss_e1_n2_ena <- na.omit(text_dt_rpss_e1_n2)

#PLUS. n1, n2 변수를 합치고, 변수명 간략화하기
text_1 <- c(text_dt_rpss_e1_n2_ena,text_dt_rpss_e1_n1_ena)
head(text_1,25)

#step5. tag 제거하기.
text_1_eta <- str_replace_all(text_1,"/N+[A-Za-z]{1,1}","")
text_1_eta_2 <- str_replace_all(text_1_eta,"/N","")
head(text_1_eta_2,25)

#step6. 빈도표 만들기.
sort(table(text_1_eta_2),decreasing=T)

#step7. 1글자로 구성된 불용어 제거하기. 
text_1_eta_2_esw <- ifelse(nchar(text_1_eta_2)==1,"",text_1_eta_2)
text_3 <- text_1_eta_2_esw[!text_1_eta_2_esw==""]
text_3_table <- sort(table(text_3), decreasing = T)

#step8. 텍스트마이닝 시각화하기.
library(wordcloud2)
wordcloud2(text_3_table, rotateRatio = 0)