#2021.05.04. TUE
#Hankyeong

#Q1. 0_group.csv 파일을 열어서 group_df로 저장하시오.
group_df <- read.csv("d:/R_project/Hankyeong_DataAnalytics/Data/0_group.csv")

#Q2. group_df 6개 정도 데이터 확인하시오.
head(group_df)

#Q3. group_df 데이터 속성 확인하시오.
dim(group_df)
str(group_df)

#PLUS. 변수 내 이상치 확인
unique(group_df$group)
unique(group_df$sex)

#Q5. 각 변수들 간의 관계를 확인 할 수 있는 상관관계 분석을 해석하시오..
cor(group_df)
plot(group_df)
#(1) group변수와 sex변수는 범주형 변수이므로 그 둘의 상관관계 해석이 무의미함.

#(2) age변수와 level변수는 연속형 변수이므로 상관관계가 양의관계이나 그 값이 0.1827이므로 매우 낮음.

#Q6. group변수에 따른 level 변수 결과를 회귀식을 완성하여 group_lm으로 저장하시오.
group_lm <- lm(data=group_df, level ~ group)

#Q7. 회귀식에 대한 해석하시오.
summary(group_lm)
#(1)분산분석의 결과 F-통계량은 4.58이고, p-value는 0.04191로써 유의수준 0.05에서 유의함.
#   그러므로 해당 회귀선은 유의하다고 해석할 수 있음.

#(2)group변수의 유의성 검정(beta1의 유의성 검정)의 경우 t-값은 2.14이고, p-value는 0.0419로써,
#   유의수준 0.05에서 유의함. 그러므로 beta1(기울기 계수)는 유의하다고 할 수 있음.

#(2-1)group 변수가 한 단위 증가할 때 level 변수는 평균적으로 20.286만큼 증가한다고 해석할 수 있음.

#(3)모형의 설명력을 정의하는 결정계수 R^2은 0.1498로써 추정된 회귀식의 설명력은 매우 낮다고 해석할 수 있음.

#Q8. 회귀모형을 진단하시오.
#(1) 잔차의 정규성
shapiro.test(group_lm$residuals)
#샤피로-윌크 검정의 p-value가 유의수준 0.05보다 작으므로 잔차의 정규성 비만족함을 알 수 있음.

#(2) 잔차의 등분산성
library(lmtest)
bptest(group_lm)
#브레슈-페이건 검정의 p-value가 유의수준 0.05보다 크므로 잔차의 등분산성을 만족함을 알 수 있음.

#(3) 잔차의 독립성
dwtest(group_lm)
#더빈-왓슨 검정의 p-value가 유의수준 0.05보다 크므로 잔차의 독립성을 만족함을 알 수 있음.

#(4) 시각화를 통한 회귀모형 진단하기.
par(mfrow=c(2,2))
plot(group_lm)