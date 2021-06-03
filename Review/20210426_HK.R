#2021.04.26. MON
#Hankyeong

#Tip. Ctrl + (1) : 스크립트 창으로 전환
#Tip. Ctrl + (2) : 콘솔창으로 전환

#01. 문자형 데이터를 날짜형 데이터로 변환하기.
power_reactor <- read.table("d:/R_project/Hankyeong_DataAnalytics/Data/power_reactor.txt",
                            header=T,
                            sep="|")
power_reactor$ReportDt <- as.Date(power_reactor$ReportDt,format="%m/%d/%y")
head(power_reactor,5)

#02. ggplot2 패키지 활용하기.
#(1)geom_point()를 이용해 산점도 만들기.
library(ggplot2)
mpg <- as.data.frame(mpg)
ggplot(data=mpg, aes(x=displ,y=hwy)) + 
  geom_point() + #산점도 추가

#TIP. aes(x=variable1,y=variable2) 파라미터는 그래프의 x축, y축 정의하는 것임.

#(2) goem_col()를 이용해 평균 막대 그래프 만들기.
library(dplyr)
mpg_drhw_mean <- mpg %>% 
  group_by(drv) %>% 
  summarise(hwy_mean=mean(hwy)) ; df_mpg
ggplot(mpg_drhw_mean,aes(x=drv,y=hwy_mean)) +
  geom_col()

#(3) geom_bar()를 이용해 빈도 막대 그래프 만들기.
ggplot(mpg, aes(x=class)) + 
  geom_bar()

#(4) geom_line()를 시계열 그래프(=선 그래프) 만들기.
ggplot(economics, aes(x=date,y=unemploy)) +
  geom_line()