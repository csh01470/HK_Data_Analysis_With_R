#2021.04.30. FRI
#Hankyeong

#01. 트리맵 구현하기.
#step0. 시스템 언어 재설정
Sys.setlocale("LC_ALL","C")
Sys.setlocale("LC_ALL","korean")

#step1. 데이터 불러오기.
hospital <- read.csv("d:/R_project/Hankyeong_DataAnalytics/Data/fulldata_01_01_01_P_병원.csv")

#step1-2. 데이터 파악하기.
dim(hospital)
str(hospital)

#step1-3. 영업상태명, 업태구분명의 종류 확인하기.
unique(hospital$영업상태명)
unique(hospital$업태구분명)

#step2. 필요한 행 추출하기.
hos_1 <- hospital[,c("영업상태명","업태구분명","소재지전체주소","도로명전체주소")]

#step3. "서울특별시 강남구"를 기준으로 소재지를 쓸지 도로명을 쓸지 결정하기.
library(stringr)
hos_1$sj_gn <- str_extract(hos_1$소재지전체주소,"서울특별시 강남구 [가-힣]{1,}")
table(is.na(hos_1$sj_gn))
hos_1$dr_gn <- str_extract(hos_1$도로명전체주소,"서울특별시 강남구 [가-힣]{1,}")
table(is.na(hos_1$dr_gn))

#result, 소재지전체주소에서 "서울특별시 강남구 ~"를 포함하는 행의 개수가 86개
#        도로명전체주소에서 "서울특별시 강남구 ~"를 포함하는 행의 개수가 106개이므로,
#        도로명전체주소를 사용함.

hos_1 <- hos_1[,-c(3,5)] #소재지전체주소 삭제

#step4. 분석 시작하기.
library(dplyr)
hos_gn_count <- hos_1 %>% 
  filter(!is.na(dr_gn) & 영업상태명=="영업/정상" & 업태구분명=="병원") %>% 
  group_by(dr_gn) %>% 
  summarise(count=n()) %>% 
  arrange(desc(count))

#step5. 시각화하기.
library(treemap)
treemap(hos_gn_count,index="dr_gn",vSize = "count")