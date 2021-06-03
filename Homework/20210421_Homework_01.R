#2021.04.21. WED
#Hankyeong

#Q1. ggplot 내장 데이터인 mpg 데이터 세트를 불러오시오.
library(ggplot2)
data("mpg")

#(1) mpg 데이터세트를 co_mpg 사본으로 저장하고,
#    저장한 co_mpg 데이터 세트를 이용하여 "suv"와 "compact"를 추출하시오.
co_mpg <- mpg
co_mpg[co_mpg$class=="suv",]
co_mpg[co_mpg$class=="compact",]

#(2) 추출한 각 데이터를 co_suv변수와 co_compact변수로 저장하시오.
co_suv <- co_mpg[co_mpg$class=="suv",] 
co_compact <- co_mpg[co_mpg$class=="compact",]

#(3) "suv"와 "compact"의 '도시 및 고속도로 통합 연비' 평균을 구해 chpg변수에 저장하시오.
co_suv$chpg <- (co_suv$cty + co_suv$hwy)/2
co_compact$chpg <- (co_compact$cty + co_compact$hwy)/2

mean(co_suv$chpg)
mean(co_compact$chpg)