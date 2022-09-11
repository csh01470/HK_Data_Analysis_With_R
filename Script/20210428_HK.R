#2021.04.28. WED
#Hankyeong

#01. oracle_alert_testdb.log로 텍스트마이닝 & 워드클라우드 만들기.
alert_dt <- readLines("d:/R_project/Hankyeong_DataAnalytics/Data/oracle_alert_testdb.log")
class(alert_dt)

#step1. 데이터 추출 및 정제하기.
library(stringr)
alert_dt_filter <- grep("^ORA-+",alert_dt,value=T)
alert_dt_fl_sub <- substr(alert_dt_filter,1,9)

#step2. 빈도수 체크하기.
alert_dt_fl_su_table <- table(alert_dt_fl_sub)
sort(alert_dt_fl_su_table, decreasing=T)

#step3. 워드클라우드 생성하기.
library(wordcloud2)
wordcloud2(alert_dt_fl_su_table, 
           size = 3, col="random-light", rotateRatio=pi,
           backgroundColor = "black", shape="pentagon")

#02. stringr 패키지를 이용해 텍스트 추출하기.
#step1. 데이터 추출하기.
alert_dt_filter2 <- str_extract(alert_dt,"^ORA-[0-9]{1,5}")

#step2. 결측치 제거하기.
alert_dt_fl2_elina <- alert_dt_filter2[!is.na(alert_dt_filter2)]

#step3. 빈도수 체크하기.
alert_dt_fl2_ena_table <- table(alert_dt_fl2_elina)
sort(alert_dt_fl2_ena_table, decreasing = T)

#step4. 워드클라우드 생성하기.
wordcloud2(alert_dt_fl2_ena_table, 
           size = 3, col="random-light", rotateRatio=pi,
           backgroundColor = "black", shape="pentagon")