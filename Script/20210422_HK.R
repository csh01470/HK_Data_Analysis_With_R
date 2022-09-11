#2021.04.22. THU
#Hankyeong

#00. 시스템 언어 설정
Sys.setlocale("LC_ALL","C")
Sys.setlocale("LC_ALL","korean")

#01. 비정형 데이터 불러오기.
#(1) readLines() : 텍스트 라인을 불러오는 함수
txt_1 <- readLines("d:/R_project/Hankyeong_DataAnalytics/Data/구매후기.txt") ; txt1 
#PLUS. readLines()함수는 소문자 l이 아니라 대문자 L임!

#(2) UTF-8로 인코딩하여 비정형 데이터 불러오기.
txt_1_error <- readLines("d:/R_project/Hankyeong_DataAnalytics/Data/구매후기_utf8.txt") ; txt1_error
txt_1_encoding <- readLines("d:/R_project/Hankyeong_DataAnalytics/Data/구매후기_utf8.txt",
                           encoding="UTF-8") ; txt1_encoding

#02. read.table() : table 형식의 txt파일을 불러오는 함수
dataset_1 <-  read.table("d:/R_project/Hankyeong_DataAnalytics/Data/전공.txt",
                    header=T); dataset_1

#TIP. 구분자가 존재할 경우 sep 파라미터를 사용할 것  
dataset_2 <-  read.table("d:/R_project/Hankyeong_DataAnalytics/Data/전공2.txt",
                    sep=":",
                    header=T) ; txt3

#03. 행의 조건을 통해 데이터셋의 부분집합 할당하기.
data(iris)
#(1). $를 이용해 부분집합 할당하기.
df_1 <- iris[iris$Species=="setosa",]

#(2). subset()을 이용해 부분집합 할당하기.
df_2 <- subset(iris,Species =="setosa")

#(3). dplyr패키지의 filter()를 이용해 부분집합 할당하기.
library(dplyr)
df_3 <- filter(iris, Species == "setosa")

#04. ifelse()를 이용하여 조건에 따른 파생변수 만들기.
library("readxl")
exdata_1 <- read_excel("d:/R_project/Hankyeong_DataAnalytics/data/Sample1.xlsx")
exdata_1$AGE50_YN <- ifelse(exdata_1$AGE>=50,"Y","N") ; exdata_1
exdata_1$AGE_GR10 <-  ifelse(exdata_1$AGE>=50,"A1.50++",
                            ifelse(exdata_1$AGE>=40&exdata_1$AGE<50,"A2.4049",
                                   ifelse(exdata_1$AGE>=30&exdata_1$AGE<40,"A3.3039",
                                          ifelse(exdata_1$AGE>=20&exdata_1$AGE<30,"A4.2029",
                                                 "A5.1019")
                                          )
                                   )
                            ) ; exdata_1

#TIP. 콘솔창에서 ESC를 눌러 프롬프트를 초기화할 수 있음.

#05. table(): 변수에 따른 빈도표를 출력하는 함수
mpg <- as.data.frame(ggplot2::mpg)
table(mpg$manufacturer)

#06. qgplot2의 qplot()를 이용해 막대 그래프 생성
library(ggplot2)
dev.new()
qplot(mpg$manufacturer) 

#TIP. dev.new(): 새 그래픽 디바이스 출력하는 함수

#07. 인덱스를 이용해 데이터 수정하기.
head(mpg,2)
#(1) mpg 데이터셋의 둘 째 레코드(행)의 trans 변수(열)을 auto(90)으로 변경하기.
mpg[2,"trans"] <- "auto(90)"

#(2) #sep_mpg의 첫 째 레코드의 class 열을 suv로 변경하기.
mpg[1,"class"] <- "suv"
head(mpg,2)

#08. 결측치(Missing Value) 제거하기.
df_4 <- data.frame(sex=c("M","F",NA,"M","F"),
                   score=c(5,4,3,4,NA)) ; df_4
#PLUS. 결측치 표기는 대문자로 쓰고, 곁따옴표("")를 사용하지 않음.
#(1) 결측치 확인하기.
is.na(df_4)

#(2) 결측치의 빈도표 출력하기.
table(is.na(df_4))
table(is.na(df_4$sex))
table(is.na(df_4$score))

#TIP. 결측치를 포함한 상태로 score 변수의 기술통계를 실시하면 NA가 출력됨.
sum(df_4$score) ; mean(df_4$score)

#(3) dplyr 패키지의 filter()를 이용해 score 변수의 결측치 삭제하기. 
library("dplyr")
df_4 %>% filter(is.na(score)) 
df_4 %>% filter(!is.na(score)) #결측치가 있는 행을 제외한 df_ex 데이터셋 출력
df_4_rmna <- df_4 %>% filter(!is.na(score))

#Tip. Ctrl + Shift + (M) : Pipe Operator(%>%)의 단축키

#(4) 결측치를 제거한 데이터셋의 score 변수의 합계, 평균 확인하기
mean(df_4_rmna$score) ; sum(df_4_rmna$score)

#TIP. score 변수와 sex 변수의 결측치를 제거한 데이터셋 만들기.
df_4_rmna_all <- df_4 %>% filter(!is.na(score)&!is.na(sex)) ; df_4_rmna_all
df_4_rmna_all_2 <- na.omit(df_4) 