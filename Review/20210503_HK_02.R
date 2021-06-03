#2021.05.03. MON
#Hankyeong

#01. 기초 통계 개념인 분산 배우기.
height <- c(164,166,168,170,172,174,176)
#step1. 편차(원소값-평균) 구하기
deviation_height <- height-mean(height) ; deviation_height 

#TIP. 편차의 합은 항상 0이 나옴.

#step2. 편차 제곱 구하기.
#WHY? 편차는 합이 0이 되므로 통계적으로 사용할 수 없음.
deviation_to_the_2_height <- (deviation_height)^2 ; deviation_to_the2_height

#step3. 편차 제곱에서 (n-1)만큼 나누기.
deviation_to_the_2_division_n_1_height <- deviation_to_the_2_height / 6 

#step4. 해당 원소의 값을 모두 더하기. = 분산(Variance)
sum_deviation_to_the_2_division_n_height <- sum(deviation_to_the_2_division_n_1_height)
sum_deviation_to_the_2_division_n_height ; var(height)

#02. 정규성 검정인 샤피로 윌크 테스트 검정 사용하기.
#    H0: 표본의 모집단이 정규분포를 따름. (==)
#    H1: 표본의 모집단이 정규분포를 따르지 않음. (!=)
set.seed(2021)
data_1 <- sample(-1000:1000,100)
options(scipen=100)
shapiro.test(data_1) 
#result, p-value가 유의수준 5%보다 작으므로 대립가설을 수용함.

#Q. 표본의 개수가 30개가 넘었는데 왜 중심극한정리를 따르지 않는가?
#A. 난수로 추출해서?

data_2 <- rnorm(n=2000,mean=100,sd=25)
shapiro.test(data_2) #p-value가 유의수준 5%보다 크므로 대립가설을 기각함.

#03. data_1과 data_2의 히스토그램을 비교하여 분포 확인하기.
par(mfrow=c(1,2))
hist(data_1)
hist(data_2)