#2021.04.23. FRI
#Hankyeong

#TIP. 변수명을 소문자로 바꾸기.
iris <- as.data.frame(iris)
names(iris) <- tolower(names(iris)) ; ls(iris)

#TIP. R에 설치된 패키지 목록을 확인하는 방법
library()

#01. Print(): 입력값을 출력하는 함수
#(1) 기본적인 활용 사례
print(c("red","green","blue"))
#(2) quote 파라미터는 문자형에서 사용되는 ""를 출력할지를 결정함.
print(c("red","grenn","blue"),
      quote=F)
#(2) gap 파라미터는 원소 사이의 여백 값을 지정함.
print(c("red","green","blue"),
      print.gap=3)

#02. cat(): 입력값을 출력하는 함수
#(1) cat()은 print()와 다르게 콘솔창에서 결과표시와 띄어쓰기가 안되있음을 확인할 수 있음.
print(c("red","green","blue")) ; 1+1 
cat(c("red","green","blue")) ; 1+1

#(2) 문자 제어문을 사용해 띄어쓰기를 강제할 수도 있음.
cat(c("red","blue","green"),"\n"); 1+1

#03. 조건문 if(){} & else{}
#HOW? if(condition){TRUE action}else{FALSE action}
sample_1 <- sample(-100:100,1)
#(1) 기본적인 활용 사례 1
if(sample_1>0){
  cat("x=",sample_1,", so x >0",sep="")
} else {cat("x=",sample_1,", so x<=0",sep="")}

#(2) 기본적인 활용 사례 2
if(sample_1%%2==0){
  cat("x=",sample_1,", so x is even.",sep="")
  } else {  cat("x=",sample_1,", so x is odd",sep="")}

#TIP. if문은 ifelse()와 다르게 입력값이 원소(스칼라) 하나일 때만 작용함. 

#04. 조건문 switch() 함수
#HOW? switch(input)(case-value)

sample_2 <- sample(1:5,1)
switch(sample_2, 
       "1" = print("one"),
       "2" = print("two"),
       "3" = print("three"),
       "4" = print("four"),
       "5" = print("five"))

#05. 반복문 for(){}
#HOW? for(variable in vector length){ action&return }
#(1) 기본적인 활용 사례 1
sample_3 <- sample(-1000:1000,10)
for(i in 1:10){ 
  cat(paste("sample_3의 ",
            i,
            "번 원소 값은 ",
            sample_3[i],
            "입니다.",
            "\n",
            sep=""))}

#(2) 기본적인 활용 사례 2
cumu_sum <- 0
for(i in 1:10){ cumu_sum <- cumu_sum + i
                print(cumu_sum)}

#06. 반복문 while(){}
#HOW? while(condition){action}
#(1)
i=1
while(TRUE){
  i = i+1
  print(i)
  if(i==10){
    break
  }
}
#PLUS. 위의 예시는 좋지 못함. 그냥 for()문을 쓰는게 더 실용적임.

#07. 사용자 정의 함수 Function
#HOW? function(variable1=default,variable2=default, ... ){
#              action
#              return(결과값)}
user <- function() {
  answer <- tolower(readline("HI, my name is CSH. Are you CGE? (y/n):"))
  if (substr(answer,1,1)=="n"){cat("You are not CGE.")}
  else{cat("HI, GE!")}
}
user()

#TIP. readline(): 콘솔창에 입력되는 입력되는 값을 스칼라로 저장하는 함수 
#     readline != readLines
c_1 <- readline("Type character:")

#TIP. substr(변수, 시작번째, 마지막번째): 문자열 일부를 추출하는 함수
c_2 <- "Data_Analytics_With_R"
substr(c_1,1,4)
