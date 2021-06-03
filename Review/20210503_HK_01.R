#2021.05.03. MON
#Hankyeong

#01. reshape2() 패키지 활용하기.
install.packages("reshape2")
library(reshape2)
airquality <- as.data("airquality")
names(airquality) <- tolower(names(airquality))
#(1) melt()를 이용해서 month, day 변수를 기준으로 모든 열 압축하기.
melt_airquality <- melt(airquality,id.vars=c("month","day"))

#(2) dcast()를 이용해 특정 열 분리하기.
dcast_airquality <- dcast(melt_airquality,month+day~variable)
class(dcast_airquality)

#(3) acast()를 이용해 특정 열 분리하기.
acast_airquality <- acast(melt_airquality,month+day~variable)
class(acast_airquality)

#02. 상관관계를 파악하는 산점도 행렬 그리기.
library(psych)
pairs.panels(iris)

#03. 두 변수간의 산점도 파악하기.
plot(iris$Petal.Width,iris$Petal.Length,
     pch=5) 

#TIP. pch 파라미터는 plotting symbols의 모양 설정함.

#04. 히스토그램 함수 hist()의 기본적인 옵션 파악하기.
hist(iris$Sepal.Length,
     main=" IRIS데이터셋의 꽃 받침의 길이",  #main : plot창의 제목 설정
     xlab="length",                          #xlab : x축(수평축) 이름 설정
     ylab="Frequency",                       #ylab : y축(수직축) 이름 설정
     las=1,                                  #las=1: y축 눈금 수평으로 전환
     col="grey")

#TIP. 사용하고자 하는 색을 알고 싶으면 colors()를 명령하여 확인할 수 있음.

#05. 히스토그램을 도수 빈도가 아니라, 확률밀도로 처리하여 출력하기.
hist(iris$Sepal.Length, freq=F)
#PLUS. 히스토그램에 정규분포 추정 곡선 추가하기.
hist(iris$Sepal.Length, freq=F) ; lines(density(iris$Sepal.Length))