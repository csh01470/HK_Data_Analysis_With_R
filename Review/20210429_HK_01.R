#2021.04.29. THU
#Hankyeong

#01. 결측값을 제거하여 집계하기. 
exam <- read.csv("d:/Rproject/Hankyeong_DataAnalytics/Data/csv_exam.csv")
exam[c(3,8,15),"math"] <- NA

#01-1. summarise()함수 내 파라미터를 이용해 집계하기.
library(dplyr)
exam %>% 
  summarise(mean(math, na.rm=T),sum(math, na.rm=T), median(math, na.rm=T))

#01-2. 데이터셋에서 결측값을 제거해서 집계하기.
exam_2 <- exam[!is.na(exam$math),]
exam_2 %>% 
  summarise(mean(math),sum(math),median(math))

#01-3. na.omit() 함수를 이용해 데이터셋에서 결측값을 제거하고 집계하기.
exam_3 <- na.omit(exam)
exam_3 %>%
  summarise(mean(math),sum(math),median(math))

#02. 결측값을 평균으로 대체해 집계하기.
exam_4 <- exam
exam_4$math <- ifelse(is.na(exam_4$math)==TRUE,
                    mean(exam_4$math, na.rm=T),
                    exam_4$math)
exam_4 %>% 
  summarise(mean(math),sum(math),median(math))

#03. stem() :: 줄기잎그림 함수
stem(exam$math)

#PRACTICE. ggplot2패키지의 geom_bar() 공부하기.
library(readxl)
sample <- read_excel("d:/Rproject/Hankyeong_DataAnalytics/Data/Sample1.xlsx")
library(ggplot2)
ggplot(sample, aes(x=SEX)) + geom_bar() +
  labs(title="Bar plot",x="SEX",y="Frequency")

#PRACTICE. ggplot2패키지의 geom_boxplot() 공부하기.
ggplot(sample, aes(x=SEX, y=AMT17)) + geom_boxplot()