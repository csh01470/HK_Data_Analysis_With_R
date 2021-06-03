#2021.04.30. FRI
#Hankyeong

#Q1. 1학년 1반, 2반, 3반 학생 5명씩의 중간고사와 기말고사 성적이 기록된 엑셀 파일을 이용해
#    다음과 같은 과정에 따라 분석하시오. 
#    처음 시작하는 R 데이터 분석 p.248~249
#(1)1학년중간고사 파일(middle_mid_exam.xlsx)을 middle_mid_exam 변수에 저장하시오.
library(readxl)
middle_mid_exam <- read_excel("d:/R_project/Hankyeong_DataAnalytics/Data/middle_mid_exam.xlsx")
head(middle_mid_exam)

#(3)문항에서 저장한 middle_mid_exam 변수를 활용해 반별 영어 점수의 평균과 합계,
#   반별 수학 점수의 평균과 합계를 각각 구하여라. 
library(dplyr)
middle_mid_exam %>% 
  group_by(CLASS) %>% 
  summarise(sum(MATHEMATICS),mean(MATHEMATICS),sum(ENGLISH),mean(ENGLISH))

#(4)middle_mid_exam 변수를 이용해 수학 점수가 80점 이상인 1반 학생 수를 구하라. 
middle_mid_exam %>% 
  filter(MATHEMATICS>=80 & CLASS=="class1") %>% 
  summarise(n())

#(5)middle_mid_exam 변수를 활용해 수학 점수는 내림차순으로 정렬하고 영어 점수는 
#  오름차순으로 정렬하라.
middle_mid_exam %>% 
  arrange(desc(MATHEMATICS),ENGLISH)

#(6)middle_mid_exam 변수를 활용해 수학 점수가 80점 이상이고, 영어 점수가 85점 이상인
#   학생 수를 구하라.
middle_mid_exam %>% 
  filter(MATHEMATICS >= 80 & ENGLISH >= 85) %>% 
  summarise(n())