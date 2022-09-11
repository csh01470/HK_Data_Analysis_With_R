#2021.04.20. TUE
#Hankyeong

#01. 범주(Factor)형 벡터 생성하기.
grade <- c("A","A","B",0,"C")
factor_1 <- factor(grade,
                   levels=c("C","B","A"),
                   ordered=TRUE) ; factor_1

#02. 변수의 유형(type)을 확인하고 변환하기.
#(1) class(): 변수의 유형을 확인하는 함수
vector_1 <- c(1,2,5,"10") ; vector_1
class(vector_1) #class() ~ 문자의 유형을 묻는 함수 

#(2) as.TYPE(): 객체의 유형을 변환하기 위해 사용하는 함수
vector_1_num <- as.numeric(vector_1) 
#TIP. 유형를 바꾸고자 할 땐 변수를 새로 정의(할당)해야함.
#WHY? as.TYPE()만 사용할 경우, 값만을 출력함.
as.numeric(vector_1) 

#TIP. 범주형 벡터를 숫자로 변환하기.
factor_num <- as.numeric(factor_1)
factor_num

#TIP. Warning message는 경고로써 중요성이 크지 않음. (=어느정도 무시해도 됨) 

#03. 벡터의 원소를 오름차순 및 내림차순하기.
sample_1 <- c(sample(-10:10,20,replace=F),NA)
#(1) sort()를 이용해 오름차순 적용하기.
sort(sample_1)

#(2) sort()를 이용해 내림차순 적용하기.
sort(sample_1,decreasing = TRUE)
#PLUS. 내림차순한 벡터 변수로 할당하기.
sample_1_sort <- sort(sample_1,decreasing = TRUE) ; sample_1_sort

#04. which(): 벡터에서 조건에 따른 원소의 위치값을 출력하는 함수. 
#(1) which()를 이용해 원소가 0보다 작거나 같은 원소의 위치값(순서) 출력하기.
which(sample_1<=0)

#(2) 위의 위치 순서를 기반으로 원소값 출력하기.
sample_1[which(sample_1<=0)]

#05. rm.na 파라미터를 이용해 함수 내에서 결측치(NA) 처리하기. 
sum(sample_1) ; mean(sample_1)
sum(sample_1,na.rm = TRUE) ; mean(sample_1,na.rm = T)
#PLUS. na.rm 파라미터가 함수 내에 존재하지 않을 수도 있음.

#06. 여러 가지 함수를 통해 행렬 정의하기.
#(1) matrix(): 행렬을 정의하는 함수
vector_1 <- c(1:6)
matrix_1 <- matrix(vector_1,nrow=2,ncol=3) ; matrix_1
matrix_2 <- matrix(vector_1,nrow=3,ncol=2) ; matrix_2
#PLUS. byrow 파라미터를 통해 데이터를 행순서로 입력하기.
matrix_3 <- matrix(vector_1,nrow=3,ncol=2,byrow=TRUE) ; matrix_3

#(2) cbind(): 열을 기준으로 행렬을 정의하는 함수
vector_2 <- c(5,40,50:52)
vector_3 <- c(30,5,6:8)
matrix_4 <- cbind(vector_2,vector_3) ; matrix_4

#TIP. R의 데이터 입력 순서는 열(Column)기준임. 

#(3) rbind(): 행을 기준으로 행렬을 정의하는 함수
matrix_5 <- rbind(vector_2,vector_3) ; matrix_5

#TIP. row(행), col(열) 헷갈림에 주의할 것!

#07. 행렬 인덱싱하기.
#(1) 첫 번째 행 출력하기.
matrix_5[1,] 

#(2) 두 번째 열 출력하기.
matrix_5[,2] 

#08. Data.frame(): 데이터 프레임을 정의하는 함수
name <- c("KJH","LYJ","BDH","KMJ")
eng <- c(90,80,60,70)
math <- c(50,60,100,20)
df_grade <- data.frame(name,eng,math)

#09. apply(): 행 or 열에 대해 일괄적으로 계산하는 함수
#(1) 행(1)을 기준으로 합산하기.
apply(df_grade[,-1],1,sum)
#(2) 열(2)을 기준으로 평균 계산하기.
apply(df_grade[,-1],2,mean)

#TIP. csv 파일을 R로 불러오기
df_midterm <- read.csv("d:/R_project/Hankyeong_DataAnalytics/Data/csv_exam.csv")

#10. aggregate(): 그룹별로 요약하는 함수
#(1) class를 그룹화 해 math 변수를 합산하기
aggregate(math~class, data=df_midterm, sum)
#(2) class를 그룹화 해 english 변수를 평균 계산하기.
aggregate(english~class, data=df_midterm, mean) 

#TIP. rnorm(u,sigma,n): 모평균 u, 모표준편차 sigma의 정규분포를 따르는 데이터를 n개 추출하는 함수
rnorm_1 <- rnorm(100,80,5)

#TIP. round(data,n): data의 값의 소수점 n을 기준으로 반올림하는 함수
rnorm_1_r <- round(rnorm_1,digits=0) ; rnorm_1_r

#TIP. str(): 데이터의 구조(Structure)와 변수, 관측치의 개수를 파악하는 함수
str(df_grade)

#11. 패키지 설치 및 관리하기.
#(1) 패키지 설치하기.
install.packages("psych")

#(2) 패키지 메모리에 활성화하기. 
library("psych")

#(3) 현재 메모리에 가동된 패키지 확인하기.
search()

#(4) R에서 사용된 경로 확인하기.
.libPaths() 

#12. 패키지에 포함된 함수(외장함수) 사용하기.
library(psych)
describe(sample_1)

#13. readxl 패키지를 이용해 엑셀 파일(xlsx,xls)을 R로 불러오기.
install.packages("readxl") 
library("readxl")
#(1) 1.xlsx의 1번 시트(sheet) 불러오기
dataset_1 <- read_excel("d:/R_project/Hankyeong_DataAnalytics/Data/1.xlsx",
                     sheet = 1)

#(2) 1.xlsx의 2번 시트 불러오기
dataset_2 <- read_excel("d:/R_project/Hankyeong_DataAnalytics/Data/1.xlsx",
                       sheet = 2)

#(3) 1.xlsx의 3번 시트 불러오기
dataset_3<- read_excel("d:/R_project/Hankyeong_DataAnalytics/Data/1.xlsx",
                       sheet = 3)


#14. R Markdown 이용하기.
#(1) R Markdown은 주로 정리한 보고서(문서)를 작성하고자할 때 사용함.

#(2) 메뉴탭에서 'File'-'new File'-'R markdown...'을 클릭하여 .rmd 활성화

#(3) Ctrl + Alt + I ~ 을 통해 chunk(코드묶음)를 넣을 구간 만들어서, 작성한 코드 기입

#(4) 'knit' 버튼을 클릭하고 원하는 파일 형식을 지정한 뒤 출력하면 됨. 

#15. 내부데이터 외부로 저장하기
write.csv(x = df_grade,
          file="d:/R_project/Hankyeong_DataAnalytics/practice.csv",
          row.names=F) 

#TIP. row.names 파라미터를 TRUE시 행번호 저장, FALSE시 행번호 생략함.