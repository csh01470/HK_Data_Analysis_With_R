#2021.05.04. TUE
#Hankyeong

#01. EDA(탐색적 자료분석)하기.
#step1. 데이터 불러오기.
dataset <- read.csv("d:/R_project/Hankyeong_DataAnalytics/Data/dataset.csv",
                    header=T)

#step2. 데이터셋구조 파악하기.
str(dataset) ; dim(dataset)
head(dataset)

#step3. 이상치 변환 및 파악하기.
#①resident 변수
unique(dataset$resident)
table(is.na(dataset$resident))
#②gender 변수
unique(dataset$gender)
dataset$gender <- ifelse(dataset$gender%in%c(1,2),dataset$gender,NA)
table(is.na(dataset$gender))
#③job 변수
unique(dataset$job)
table(is.na(dataset$job))
#④age 변수
dataset$age <- ifelse(dataset$age<20|dataset$age>69,NA,dataset$age)
table(is.na(dataset$age))
plot(dataset$age)
#⑤position 변수
unique(dataset$position)
table(is.na(dataset$position))
#⑥price 변수
dataset$price <- ifelse(dataset$price>7.9|dataset$price<2.1,NA,dataset$price)
table(is.na(dataset$price))
plot(dataset$price)
#⑦survey 변수
unique(dataset$survey)
table(is.na(dataset$survey))

#step4. 중요변수인 price 변수의 이상치 평균으로 대체하기.
dataset$price <- ifelse(is.na(dataset$price),
                        round(mean(dataset$price, na.rm=T),1),dataset$price)    
dataset$price

#step5. resident 변수 코딩 전환하기. 
dataset$resident_2 <- ifelse(dataset$resident==1,"서울특별시",
                           ifelse(dataset$resident==2,"인천광역시",
                                  ifelse(dataset$resident==3,"대전광역시",
                                         ifelse(dataset$resident==4,"대구광역시",
                                                ifelse(dataset$resident==5,"시군구",NA)))))

#step6. age 변수 범주화하기. 
dataset$age_2 <- ifelse(dataset$age<=30,"청년층",
                        ifelse(dataset$age>30 & dataset$age<56,"중년층","장년층"))