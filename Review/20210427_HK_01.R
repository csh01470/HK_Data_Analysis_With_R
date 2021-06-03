#2021.04.27. TUE
#Hankyeong

#01. ggplot2 패키지를 이용해 상자 그림 만들기.
library(ggplot2)
ggplot(mpg, aes(x=drv,y=hwy)) + 
  geom_boxplot()

#TIP. boxplot()를 이용해 상자 그림 그리기.
boxplot(hwy~drv,data=mpg)

#02. 여러가지 문자열 제어 함수
#(1) nchar(): 문자열의 길이를 반환하는 함수 
nchar("Data_Analytics_With_R")
nchar(grep_ex)

#(2) substr(): 문자열에서 일부분을 반환하는 함수 = excel에서 mid()
substr("940815-1******",3,6)

#(3) strsplit(): 문자열을 특정 기준으로 나누어 벡터로 반환하는 함수
strsplit("010-8901-****","-")

#(4) grep(): 벡터에서 정규표현식(조건)에 따른 위치값을 반환하는 함수
fruit <- c("apple","banana","strawberry","cherry","avocado")
grep("^a",fruit)

#TIP. 정규표현식 관련 주소
#     http://regexp.elex.pe.kr/regular-expression

#03. stringr 패키지 활용하기.
#(1) str_extract()를 이용해 문자열 추출하기.
library(stringr)
str_extract("CSH28CGE28CMJ26BSH27LKH28",
            "[0-9]{2}")
str_extract_all("CSH28CGE28CMJ26BSH27LKH28",
                "[0-9]{2}")
#PLUS, ~_all()을 이용하면 리스트로 결과를 반환함.

#(2) str_replace()를 이용해 문자열 대체하기.
str_replace("사랑 사랑 누가 말했나~.","사랑","간식")
str_replace_all("사랑 사랑 누가 말했나~.","사랑","간식")

#(3) str_locate()를 이용해 문자열 내에서 특정 문자열의 위치 구하기.
str_locate("Data Analytics With R","With")

#(4) str_length()를 이용해 문자열의 길이 구하기.
str_length("Data Analytics With R")

#(5) str_to_upper(), str_to_lower()를 이용해 문자열의 대소문자 변경하기.
str_to_upper("Data Analytics With R")
str_to_lower("Data Analytics With R")             

################################ PRACTICE ######################################
#PRACTICE. 상자 그림 연습하기.
library(dplyr)
mpg_class_css <- mpg %>% filter(class %in% c("compact","subcompact","suv")) 
head(mpg_class_css)
ggplot(mpg_class_css,aes(x=class,y=cty)) + 
  geom_boxplot()

#PRACTICE. github에서 titanic데이터셋 불러오기.
dt_titanic <- read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/COUNT/titanic.csv")
str(dt_titanic)
dim(dt_titanic)

#PRACTICE. titanic 데이터셋을 가지고 평균 막대표 그리기.
dt_titanic_class_mean <- dt_titanic %>% 
  group_by(class) %>% 
  mutate(survived_num = ifelse(survived=="yes",1,0)) %>% 
  summarise(survived_mean=mean(survived_num))
ggplot(dt_titanic_class_mean,aes(x=class,y=survived_mean)) + 
  geom_col()

#PRACTICE. dt_titanic_class_mean데이터셋을 외부로 저장하기.
write.table(dt_titanic_class_mean,"d:/Rproject/Hankyeong_DataAnalytics/dt_titanic_class_mean.txt",
            row.names=F,
            sep=";")
################################################################################