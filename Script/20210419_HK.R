#2021.04.19. MON
#Hankyeong

#01. Rstudio 시작하기.
#(1) Hello world 출력하기.
print("Hello World")

#(2) Rstudio의 편의 TIP
#Alt  + (-)         : 치환기호(<-) 입력하기.
#Ctrl + (+)         : 화면 확대하기.
#Ctrl + (-)         : 화면 축소하기.
#Ctrl + (A)         : 내용 전체 선택하기.
#Ctrl + (L)         : 콘솔창 지우기
# ;                 : 줄바꿈 요약하기.
#Ctrl + Shift + (C) : 블록 주석 처리하기 

#(3) 워킹디렉토리 위치 파악하기.
getwd()

#(4) 워킹디렉토리 경로 설정하기.
setwd("D:/R/Hankyeong_DataAnalytics")

#TIP. tap을 눌러 경로를 쉽게 확인할 수 있음.
#PLUS. Rproject를 새로 생성할 시, 따로 설정할 필요는 없음.

#02. 객체(Object) 할당하기. 
#(1) 스칼라(Scalar) 할당하기.
scalar_1 <- 10
SCALAR_1 <- 3
scalar_2 <- "apple"
scalar_1 ; SCALAR_1 ; scalar_2

#TIP. R에서는 대문자와 소문자를 구분함.

#(2) 벡터(Vector) 할당하기.
vector_1 <- c(10,9,7)
vector_2 <- c("apple","banana","strawberry")
vector_3 <- c(10,9,"7")
#PLUS. Vector_3는 원소 "7" 때문에 벡터 전체가 문자형으로 할당됨. 
#PLUS. 변수는 전부 한글에서 영어로 정의해야(바꿔줘야)하는게 좋음.

#TIP. 한글이나 word를 통해 소스를 복사할 경우, "" 모양에 주의해야함.

#(5) 벡터의 연산 시행하기.
vector_1 + c(1,2,3)
vector_1 - c(1,2,3)
vector_1 * c(1,2,3)
vector_1 / c(1,2,3)

#TIP. 벡터의 길이(원소의 개수)가 맞지 않는 경우, 작은 벡터에서 원소를 반복해 강제로 길이를 맞춤.
c(1,2,3,4)+c(1,2,3) 

#03. 객체의 인덱싱(indexing,[])과 슬라이싱(slicing,[n:k])
#(1) sample_1의 1번 원소 출력하기.
sample_1[1]

#(2) sample_1의 1번과 2번 원소 출력하기.
sample_1[c(1,2)]

#(3) sample_1의 1번 원소를 제외한 모든 원소 출력하기.
sample_1[-1]

#(4) sample_1의 3번부터 5번 원소까지 출력하기.
sample_1[3:5]

#04. 편의 함수 알아보기.
#(1) seq(n,k): n에서 k까지 정수로 이어지는 수열(sequence)를 만드는 함수
vector_4 <- seq(1,10)         
#PLUS. seq() 함수에 by 파라미터를 넣어 수열의 간격(term)을 지정할 수 있음.
vector_5 <- seq(1,10,by=2)

#TIP. seq(n,k) 함수는 n:k으로 대체하여 사용할 수 있음.
vector_6 <- 1:10


#(2) rep(n,k): replicate의 약자로, 반복하는 벡터를 생성하는 함수. 
vector_7 <- rep("a",times=5)
vector_8 <- rep(c("A","b"),times=3)
#PLUS. each parameter: 벡터의 원소를 각각 배열하게 함.
vector_9 <- rep(c("A","b"),each=3) 
vector_8 ; vector_9

#(3) sample(range,n): 범위(range)를 지정한 표본에서 갯수(n)를 설정해 무작위로 추출하는 함수
sample_1 <- sample(1:10,5)                          
#PLUS. replace parameter : 복원추출 유무를 지정함.
sample_2 <- sample(1:10,5,replace=TRUE)  #replace = TRUE :: 복원추출(TRUE)함.
#PLUS. prop prameter: 각 표본이 뽑힐 확률을 범위별로 지정함. 
sample_3 <- sample(1:10,5,prob=1:10)

#(4) set.seed(): seed number를 저장하여, 다음에도 무작위 추출을 시행시 똑같은 값을 저장하는 함수
set.seed(2021)
sample_4 <- sample(-1000:1000,10)

#(5) mean(): 객체의 평균을 출력하는 함수
mean(sample_1)

#(6) max(): 객체의 최댓값을 출력하는 함수
max(sample_1)

#(7) min(): 객체의 최솟값을 출력하는 함수
min(sample_1)

#(8) summary(): 객체의 요약통계량(최솟값, 1분위수, 중앙값, 평균, 3분위수, 최댓값)을 출력하는 함수
summary(sample_1)

#05. rm(): 객체(변수)를 메모리에서 삭제하는 함수
#(1) 특정 객체 삭제하기.
rm(sample_1)

#(2) 메모리에 할당된 모든 객체 삭제하기.
rm(list=ls())