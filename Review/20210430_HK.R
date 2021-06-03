#2021.04.30. FRI
#Hankyeong

#01. 실전! 서울 서초구 중 한식이 가장 많은 지역 찾기.
#step1. 데이터셋 불러오기 및 탐색하기.
seochogu_raw <- read.csv("d:/R_project/Hankyeong_DataAnalytics/Data/서울특별시 서초구_음식점_20201022.csv")
str(seochogu_raw)
dim(seochogu_raw)
library(dplyr)
distinct(seochogu_raw, 업태명)

#step2. 필요한 열 추출하기.
seochogu <- seochogu_raw[,c("소재지.지번.","업태명")]
head(seochogu)

#step3. 소태지.지번. 변수 "~동"으로 끝나는 변수로 정제하기.
library(stringr)
i = 1 
for(i in 1:nrow(seochogu)){
form=paste0("seochogu$dong <- str_sub(seochogu$소재지.지번.,1,str_locate(seochogu$소재지.지번.,'동')[",
            i,
            ",2])")
eval(parse(text=form))
  }

#step4. 동별 한식 업소 갯수 확인하기.
seochogu_count <- seochogu %>% 
  filter(업태명=="한식") %>% 
  group_by(dong) %>% 
  summarise(count=n()) %>% 
  arrange(desc(count)) ; seochogu_count
  
#step5. 트리맵을 이용해 시각화하기.
library(treemap)
treemap(seochogu_count,
        index="dong", vSize="count") #index=variable, vSize=count value