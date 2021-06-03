#2021.05.06. FRI
#Hankyeong

#01. one-way ANOVA 검정하기.
#step1. 데이터셋 불러오기 및 탐색하기.
eud_raw <- read.csv("d:/R_project/Hankyeong_DataAnalytics/Data/three_sample.csv")
str(eud_raw)
head(eud_raw)
unique(eud_raw$method)

#step2. 변수 전처리하기 및 필요 변수만 추출하기.
library(dplyr)
edu_ena <- eud_raw %>% 
  filter(!is.na(score))
edu_df <- edu_ena[,c("method","score")] 

#step3. method 별로 그룹 나누기
group_1 <- edu_df[edu_df$method==1,] 
group_2 <- edu_df[edu_df$method==2,] 
group_3 <- edu_df[edu_df$method==3,] 

#step4. 그룹 별 박스플롯 비교하기.
boxplot(group_1$score,group_2$score,group_3$score)$stat

#step5. 박스플롯 내에서 이상치 제거하기.
group_1$score <- ifelse(group_1$score>6.5,NA,group_1$score)
group_1 <- group_1[!is.na(group_1$score),]
group_2$score <- ifelse(group_2$score>8.5,NA,group_2$score)
group_2 <- group_2[!is.na(group_2$score),]
boxplot(group_1$score,group_2$score,group_3$score)$stat

#step4. 그룹 별 평균 비교하기.
mean(group_1$score) ; mean(group_2$score) ; mean(group_3$score)

#step5. 가설 설정하기.
#H0: 세 그룹간 score 변수의 평균 차이는 없다.
#H1: 세 그룹간 score 변수의 평균 차이는 있다.

#step6. group_2는 관측치 수가 28개이므로, 정규성 검정하기.
options(scipen = 100)
shapiro.test(group_2$score)
qqnorm(group_2$score) ; qqline(group_2$score, col="red")
#정규성 검정 시 group_2의 W값의 p-value는 0.2757이므로 귀무가설을 채택함.

#step7. 그룹의 등분산성 검정하기. bartlett
bartlett.test(data=edu_df,score~method)
#등분산성 검정 시 p-value<0.00000.. 이므로 대립가설을 채택함.
#즉, 각 그룹의 분산은 동일하지 않음.

#step8. ANOVA 검정하기.
edu_df_anova <- aov(data=edu_df,score~method,var.equal=F)
edu_df_anova
summary(edu_df_anova)

#Q. aov()함수는 왜 var.equl 파라미터가 존재하지 않는가?
#A. ANOVA 검정은 등분산성을 가정하고 만들어진 함수이기 때문임.

#step8-2. oneway.test 검정하기.
edu_df_anova_2<- oneway.test(data=edu_df,score~method,var.equal=F)
edu_df_anova_2

#step9. 결론 도출하기.
#ANOVA-test를 통해 계산된 F값의 p-value는 0.137로써 유의수준 0.05보다 크다.
#즉, 귀무 가설을 채택한다. 다시 말해 세 그룹간의 평균 차이는 존재하지 않는다.

#step10. 사후검정하기.