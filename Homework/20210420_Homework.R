#2021.04.20. TUE
#Hankyeong

#Q1. 다음의 변수들을 생성하시오.
#(1) 1부터 10사이의 벡터를 만들어 v1에 변수 저장하기
v1 <- 1:10 

#(2) v1의 각 원소 값들에 2를 곱한 결과로 v2 변수 만들기
v2 <- 2*v1

#(3) v2 변수에서 최댓값을 추출해 max_v 변수 만들기
max_v <- max(v2)

#(4) v2 변수에서 최솟값을 추출해 min_v 변수 만들기
min_v <- min(v2)

#(5) v2 변수에서 평균값을 추출해 avg_v 변수 만들기
avg_v <- mean(v2)

#(6) v2 변수에서 원소들을 합산해 sum_v 변수 만들기
sum_v <- sum(v2)

#(7) v2 변수에서 5번째 원소만 제외한 결과로 v3 변수 만들기
v3 <- v2[-5]

#(8) v1, v2, v3, max_v, min_v, avg_v, sum_v를 화면에 출력하기
print(v1);print(v2);print(max_v);print(min_v);print(avg_v);print(sum_v);print(v3)

#Q2. seq() 또는 rep() 함수를 이용하여. 다음과 같이 구성되는 벡터를 생성하시오. 
#    (각 변수들의 명칭은 v4,v5,v6,v7,v8로 정의하시오.)
#(1) 1,3,5,7,9
v4 <- seq(1,9,by=2) ; v4

#(2) 1,1,1,1,1
v5 <- rep(1,time=5) ; v5

#(3) 1,2,3,1,2,3,1,2,3,
v6 <- rep(c(1,2,3),time=3) ; v6

#(4) 1,1,2,2,3,3,4,4
v7 <- rep(c(1,2,3,4),each=2) ; v7

#(5) A,A,B,B
v8 <- rep(c("A","B"),each=2) ; v8

#Q3. 1부터 100으로 구성되는 10개의 중복되지 않은 데이터를 추출해 nums라는 변수를 만듬.
nums <- sample(1:100,10,replace=FALSE)
#(1) 50보다 큰 원소 값들만 출력함.
nums[nums>=50]
nums[which(nums>=50)]

#(2) 50보다 작거나 같은 원소들의 인덱스(위치값, 좌표값)를 출력함.
which(nums<=50)

#(3) 최대값을 저장하고 있는 원소의 인덱스를 출력함.
which(nums==max(nums))

#(4) 최소값을 저장하고 있는 원소의 인덱스를 출력함.
which(nums==min(nums))

#(5) 오름차순으로 정렬한 결과를 출력함.
sort(nums)

#(6) 내림차순으로 정렬한 결과를 출력함.
sort(nums,decreasing = TRUE)

#(7) nums 변수에서 원소들을 각각 A, B, C, ..., H, I, J로 명명하시오
names(nums) <- c("A","B","C","D","E","F","G","H","I","J")

#TIP. names() :: 벡터의 원소들에 rows name 부여 

#Q4. 1부터 10까지 출력하는데 3씩 증가하는 형태로 저장되는 벡터를 정의하여 v9 변수에 저장한 뒤,
#    R의 내장 벡터를 활용해 v9의 각 원소에 A, B, C, D라는 이름을 부여하시오.
v9 <- seq(1,10,by=3)
v9_factor <- factor(x=v9,
                    levels=c(1,4,7,10),
                    labels=c("A","B","C","D"))

#Q5. 1부터 20으로 구성되는 5개의 중복되지 않은 데이터를 추출하여 score1이라는 벡터를 만듬.
set.seed(2021)
score1 <- sample(1:20,5,replace=F)
#(1) Friends라는 이름으로 "둘리", "또치", "도우너", "희동", "듀크" 값으로 벡터를 만듬
Friends <- c("둘리","또치","도우너","희동","듀크")
df1 <- data.frame(Friends,score1)

#(2) 점수가 가장 높은 친구의 이름을 출력함.
df1[which(score1==max(score1)),1]

#(3) 점수가 가장 낮은 친구의 이름을 출력함.
df1[which(score1==min(score1)),1]

#(4) 점수가 10점보다 높은 친구의 이름들을 출력함.
df1[which(score1>=10),1]