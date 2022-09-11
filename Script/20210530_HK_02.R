#2021.05.30. SUN
#Hankyeong

#00. 시스템 언어 설정하기.
Sys.setlocale("LC_ALL","C")
Sys.setlocale("LC_ALL","korean")

#01. ramyeon 데이터셋으로 주성분 분석하기.
#step1. 데이터셋 불러오기 및 탐색하기.
ramyeon_raw <- read.csv("d:/R_project/Hankyeong_DataAnalytics/Data/ramen.csv")
ramyeon <- ramyeon_raw
str(ramyeon) ; dim(ramyeon)
head(ramyeon) 

#step2. 변수들의 결측치 파악하기.
library(dplyr)
is.na(ramyeon[,-1]) %>% colSums()

#step3. 변수들의 요약통계량 파악하기 
summary(ramyeon[,-1])

#step4-1. 변수들의 분포 파악하기, histogram()
par(mfrow=c(1,3))
hist(ramyeon$면)
hist(ramyeon$그릇)
hist(ramyeon$국물)
dev.off()

#TIP. 해당 데이터셋은 scaling되어있음을 확인할 수 있음.

#step4-2. 변수들의 분포 파악하기, boxplot()
boxplot(ramyeon[,-1])

#step5. 변수들의 산점도 및 상관관계 파악하기.
plot(ramyeon[,-1])
cor(ramyeon[,-1])

#step6. 주성분분석 시행하기.
ramyeon_pca <- prcomp(ramyeon[,-1])
ramyeon_pca

#step7. 주성분분석 구조 파악하기.
str(ramyeon_pca)
summary(ramyeon_pca)
ramyeon_pca$rotation
ramyeon_pca$x

#step8. screeplot()으로 Elbow Point 파악하기.
screeplot(ramyeon_pca, type="lines", main="Scree Plot")

#step9. biplot()으로 주성분과 데이터 성격 파악하기. 
biplot(ramyeon_pca)

#step9. 차원 추출하기.
ramyeon_pca_vect <- ramyeon_pca$x[,c(1,2)]

#02. USArrest 데이터셋으로 주성분 분석하기.
#step1. 데이터셋 불러오기 및 탐색하기.
usarrest_raw <- as.data.frame(USArrests) 
usarrest <- usarrest_raw
str(usarrest) ; dim(usarrest)
head(usarrest)

#step2. 변수들의 결측치 파악하기.
is.na(usarrest) %>% colSums()

#step3. 변수들의 요약통계량 파악하기 
summary(usarrest)

#step4-1. 변수들의 분포 파악하기, histogram()
par(mfrow=c(2,2))
hist(usarrest$Murder)
hist(usarrest$Assault)
hist(usarrest$UrbanPop)
hist(usarrest$Rape)
dev.off()

#step4-1. 변수들의 분포 파악하기, boxplot()
boxplot(usarrest)

#step5. 변수들 standardizaiton scaling하기.
usarrest_scale <- scale(usarrest) %>% as.data.frame()

#step6. 변수들의 산점도 및 상관관계 파악하기.
plot(usarrest_scale)
cor(usarrest_scale)

#step7. 주성분분석 시행하기.
usarrest_pca <- prcomp(usarrest_scale)
usarrest_pca

#TIP. 주성분분석 전 scaling을 깜빡했다면,
usarrest_pca <- prcomp(usarrest, scale=T)

#step8. 주성분분석 구조 파악하기.
str(usarrest_pca)
summary(usarrest_pca)
usarrest_pca$rotation
usarrest_pca$x

#step9. screeplot()으로 Elbow Point 파악하기.
screeplot(usarrest_pca, type="lines", main="Scree plot")

#step10. biplot()으로 변수들 간 관계 해석하기.
biplot(usarrest_pca)

#step11. 필요 변수 추출하기.
usarrest_pca_vect <- usarrest_pca$x[,1:2] %>% as.data.frame()

#TIP. PCA는 웬만하면 95%의 설명력을 가지는 차원까지 추출하는 것이 좋음.
#     OR 최대 3차원까지,