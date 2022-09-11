#2021.05.06. THU
#Hankyeong

#00. 시스템 언어 설정하기.
Sys.setlocale("LC_ALL","C")
Sys.setlocale("LC_ALL","korean")

#01. 실전! 21년 1월, 2월, 3월, 4월의 서울 성북구와 중구의 미세먼지농도 평균 비교하기.
#step1. 데이터셋 불러오기 및 탐색하기.
library(readxl)
seoulair1 <- read_excel("d:/R_project/Hankyeong_DataAnalytics/Data/2101++_airqulity.xlsx", skip=4)
seoulair2 <- read_excel("d:/R_project/Hankyeong_DataAnalytics/Data/2102++_airqulity.xlsx", skip=4)
seoulair3 <- read_excel("d:/R_project/Hankyeong_DataAnalytics/Data/2103++_airqulity.xlsx", skip=4)
seoulair4 <- read_excel("d:/R_project/Hankyeong_DataAnalytics/Data/2104++_airqulity.xlsx", skip=4)

#step2. 전치행렬함수를 이용해 행&열 변환하기.
seoulair1_t <- t(seoulair1)
seoulair2_t <- t(seoulair2) 
seoulair3_t <- t(seoulair3) 
seoulair4_t <- t(seoulair4) 

#step3. 전치 행렬 전처리하기.
library(dplyr)
colnames(seoulair1_t) <- c("서울시 평균","강남구","강동구","강북구","강서구",
                           "관악구","광진구","구로구","금천구","노원구","도봉구",
                           "동대문구","동작구","마포구","서대문구","서초구",
                           "성동구","성북구","송파구","양천구","영등포구","용산구",
                           "은평구","종로구","중구","중랑구")
seoulair1_t <- seoulair1_t[-1,]
seoulair1_t_df <- as.data.frame(seoulair1_t)
colnames(seoulair2_t) <- c("서울시 평균","강남구","강동구","강북구","강서구",
                           "관악구","광진구","구로구","금천구","노원구","도봉구",
                           "동대문구","동작구","마포구","서대문구","서초구",
                           "성동구","성북구","송파구","양천구","영등포구","용산구",
                           "은평구","종로구","중구","중랑구")
seoulair2_t <- seoulair2_t[-1,]
seoulair2_t_df <- as.data.frame(seoulair2_t)
colnames(seoulair3_t) <- c("서울시 평균","강남구","강동구","강북구","강서구",
                           "관악구","광진구","구로구","금천구","노원구","도봉구",
                           "동대문구","동작구","마포구","서대문구","서초구",
                           "성동구","성북구","송파구","양천구","영등포구","용산구",
                           "은평구","종로구","중구","중랑구")
seoulair3_t <- seoulair3_t[-1,]
seoulair3_t_df <- as.data.frame(seoulair3_t)
colnames(seoulair4_t) <- c("서울시 평균","강남구","강동구","강북구","강서구",
                           "관악구","광진구","구로구","금천구","노원구","도봉구",
                           "동대문구","동작구","마포구","서대문구","서초구",
                           "성동구","성북구","송파구","양천구","영등포구","용산구",
                           "은평구","종로구","중구","중랑구")
seoulair4_t <- seoulair4_t[-1,]
seoulair4_t_df <- as.data.frame(seoulair4_t)

#step4. 데이터셋 합치기
seoulair <- rbind(seoulair1_t_df,seoulair2_t_df,seoulair3_t_df,seoulair4_t_df)

#step5. 필요한 변수만 추출해서 새로운 데이터셋 생성하기.
group_sbk <- seoulair[,"성북구"]
group_gk <- seoulair[,"중구"]
length(group_sbk) ; length(group_gk)

#step6. 문자형 원소들을 숫자형 원소로 변환하기.
group_sbk <- as.numeric(group_sbk)
group_gk <- as.numeric(group_gk)

#step7. 두 그룹의 결측치 제거하기.
group_sbk <- group_sbk[!is.na(group_sbk)]
group_gk <- group_gk[!is.na(group_gk)]

#step8. boxplot을 통해 두 그룹의 분포 형태 파악하기.
boxplot(group_sbk,group_gk)

#step9. 두 그룹의 미세먼지 변수 평균 비교하기.
mean(group_sbk) ; mean(group_gk)

#step10. 가설 설정하기.
#H0: 성북구와 중구의 미세먼지 변수의 평균 차이는 없다.
#H1: 성북구의 미세먼지 변수의 평균이 중구의 미세먼지 변수의 평균보다 작다.

#step11. 두 그룹의 등분산성 검정하기.
var.test(group_sbk,group_gk)
#등분산성 검정에서 F분포의 p-value=0.003868 < alpha=0.05이므로 대립가설 채택,
#두 그룹의 분산은 동일하지 않음.

#step12-1. t-test 검정하기.
t.test(group_sbk,group_gk, alternative="less",var.equal = FALSE)
#t-test를 통한 t값의 p-value=0.05211 > alpha=0.05이므로 귀무가설 채택,
#즉, 성북구와 중구의 미세먼지 변수의 평균 차이는 없음. 

#step12-2. z-test 검정하기.
library(BSDA)
z.test(x=group_sbk,y=group_gk,alternative="less",
       sigma.x=sd(group_sbk),sigma.y=sd(group_gk))
#단, 모집단 분산을 불편추정량인 표본집단의 분산으로 대체함.

#step13. 결론 도출하기.
#z-test를 통한 z값의 p-value=0.05142 > alpha=0.05이므로 귀무가설 채택,
#즉, 성북구와 중구의 미세먼지 변수의 평균 차이는 없음. 