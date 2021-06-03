#2021.04.21. WED
#Hankyeong

#01. par()와 히스토그램(Histogram) 사용하기.
set.seed(2021)
rnorm1 <- rnorm(100,0,1) 
rnorm2 <- rnorm(100,0,25)
#(1) par(mflow=c(n,m)): 플롯창의 그래프 구성을 몇칸(n행,m열)로 구성하는 함수
par(mfrow=c(1,2)) 

#(2) hist(): 데이터를 히스토그램으로 시각화하는 함수
hist(rnorm1)
hist(rnorm2)

#02. 데이터프레임 인덱싱(Indexing)하기.
exam <- read.csv("d:/R_project/Hankyeong_DataAnalytics/data/csv_exam.csv")
#(1)math가 50점이상이면서(and) class가 2반인 학생들 출력
exam[exam$math>=50 & exam$class==2,]

#(2) english가 90점 미만이거나(or) science가 50점 미만인 학생들 출력
exam[exam$english>=90 | exam$science<50,] 

#03. %in%: Match Operator, 포함 여부를 확인하는 특수 연산자 
v1 <- c(1,3,5,7,9)
10 %in% v1 

#04. paste(): 원소를 붙여 스칼라로 변환하는 함수
paste(1,2,3,4)
#PLUS. sep 파라미터로 구분자를 정의할 수 있음.
paste(1,2,3,4,sep="-")

#TIP. paste0(): paste()에서 sep 파라미터가 ""로 설정된 함수
paste0(1,2,3,4)

#05. t(): 전치 행렬(Transpose Matrix)을 만드는 함수
matrix_1 <- matrix(c(1:9),nrow=3,byrow=T) ; matrix_1
t(matrix_1)

#06. array(): 배열(Array, 여러개의 층(차원)으로 구성된 행렬)을 만드는 함수
array_1 <- array(c(1:6),dim=c(2,2,3)) ; array_1

#TIP. 요구되는 원소의 수가 부족할 경우, 데이터의 원소를 재순환시킴.
#     ex) array_1의 (2,1,3) (2,2,3)

#07. 배열 인덱싱
#(1) 2번 차원 인덱싱
array_1[,,2]

#(2) 1번 차원의 2번 열 인덱싱
array_1[,2,1]

#08. list(): 리스트를 만드는 함수
#생략

#TIP. 리스트는 데이터 프레임과 달리, 변수의 길이가 동일한 필요가 없음.

#09. 데이터셋 탐색하기
data("iris")
#(1) head(data,n): 데이터셋의 앞부분 n개 데이터 출력하는 함수
head(iris,n=10)

#(2) tail(data,n): 데이터셋의 끝부분 n개 데이터 출력하는 함수
tail(iris,n=10)

#(3) nrow(): 행의 갯수를 확인하는 함수
nrow(iris)

#(4) ncol(): 열의 갯수를 확인하는 함수
ncol(iris)

#(5) dim(): 행과 열의 수를 파악하는 함수 
dim(iris)

#(6) ls(): 데이터셋의 변수(컬럼)명을 확인하는 함수
ls(iris)

#10. 인덱싱을 이용해 데이터셋의 변수, 행 추출하기.
#(1) iris 데이터셋의 5열을 제외한 모든 열 추출
sample_ir_1 <- iris[,-5]

#(2) iris 데이터셋의 2번부터 30번의 행 추출  
sample_ir_2 <- iris[2:30,]

#Tip. View(): 데이터셋을 뷰어로 조회하는 함수
View(iris)

#11. 데이터셋의 변수명 변경하기
#(1) dplyr 패키지의 rename()
library("dplyr")
iris = rename(iris,sepal_length=Sepal.Length,sepal_width=Sepal.Width)

#(2) colnames()
colnames(iris) = c("sepal_length","sepal_width","petal_length","petal_width","species")
#PLUS. colnames()는 변수 전체의 이름을 설정해야함.

#12. $(dollor sign)을 이용하여 파생변수 만들기
iris$sepal_sum = iris$sepal_length + iris$sepal_width
