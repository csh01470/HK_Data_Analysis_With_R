#2021.04.23. FRI
#Hankyeong

#Q1. ggplot2의 mpg데이터셋을 이용해 제조사 별로 "suv" 자동차의 도시 및 고속도로 
#    통합 연비 평균을 구해, 내림차순으로 정렬하고 1~5위까지 출력하시오.
mpg_1 <- as.data.frame(ggplot2::mpg)
str(mpg_1)

#Sol1.
library(dplyr)
mpg_1_cl_suv <- mpg_1[mpg_1$class=="suv",]
mpg_1_cl_suv$ch_total <- mpg_1_cl_suv$cty+mpg_1_cl_suv$hwy
mpg_1_cl_suv %>% 
  group_by(manufacturer) %>% 
  summarise(ch_mean=mean(ch_total)) %>% 
  arrange(desc(ch_mean)) %>% 
  head(5)
  
#Sol2.
mpg_1 %>% 
  filter(class=="suv") %>% 
  group_by(manufacturer) %>% 
  mutate(ch_total=cty+hwy) %>% 
  summarise(ch_mean=mean(ch_total)) %>% 
  arrange(desc(ch_mean)) %>% 
  head(5)