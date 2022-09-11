#2021.04.23. FRI
#Hankyeong

#01. dpylr 패키지 활용하기. 
#(1) distinct()를 이용해 변수내의 중복값을 제거해서 출력하기.
library(dplyr)
distinct(iris, Species)
#PLUS. 내장함수를 이용해 중복값을 제거해 출력하기
unique(iris$Species)

#(2) mutate()를 이용해 파생변수 정의하여 출력하기.
exam <- read.csv("d:/R_project/Fastcampus_startR/Data/csv_exam.csv") ; head(exam)
exam %>% 
  mutate(total=math+english+science) 
#PLUS. mutate()를 여러가지 파생변수를 한 번에 정의하기.
exam %>% 
  mutate(total=math+english+science,mean=round((math+english+science)/3,2)) %>% 
  head(n=10)
#PLUS. dplyr와 ifelse()함수를 이용해 파생변수 만들기.
exam %>% 
  mutate(sci_PF=ifelse(exam$science>=70,"P","F")) %>% 
  head(5)

#TIP. dplyr 패키지를 활용한 파생변수를 데이터셋에 할당하기.
exam <- exam %>% 
  mutate(total=math+english+science)
head(exam)

#TIP. $를 이용해 파생변수 정의하기.
exam$total <- exam$math+exam$english+exam$science

#(3) arrange()를 이용해 데이터 프레임 정렬하기.
exam %>% 
  mutate(total=math+english+science,mean=round((math+english+science)/3,2)) %>% 
  arrange(total)

#(4) group_by(), summarise()를 이용해 집단별로 집계하기.
exam %>%
  group_by(class) %>% 
  summarise(mean_math = mean(exam$math))

#(5) left_join()를 이용해 (왼쪽으로) 데이터셋 합치기.
test1 <- data.frame(id=c(1,2,3,4,5),
                    midterm=c(60,80,70,90,85)) ; test1
test2 <- data.frame(id=c(1,2,3,4,5),
                    final=c(70,83,65,95,80)) ; test2
total_test <- left_join(test1,test2,
                        by="id") #id 변수를 기준으로

#(6) bind_rows()를 이용해 (아래로) 데이터셋 합치기.
group_1 <- data.frame(id=c(1,2,3,4,5),
                      test=c(60,80,70,90,85)) ; group_1
group_2 <- data.frame(id=c(6,7,8,9,10),
                      test=c(70,83,65,95,80)) ; group_2
group_all <- bind_rows(group_1,group_2) ; group_all

#TIP. 내장함수 rbind()를 이용해 (아래로) 데이터셋 합치기.
group_all_2 <- rbind(group_1,group_2) ; group_all_2
head(group_all,n=3) ; head(group_all,n=3)