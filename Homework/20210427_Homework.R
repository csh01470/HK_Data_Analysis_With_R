#2021.04.27. TUE
#Hankyeong

#Q1. 다음의 Data2 데이터 객체를 대상으로 정규표현식을 적용하여 문자열을 처리하시오.
Data2 <- c("2017-02-05 수입 3000원","2017-02-06 수입 4500원","2017-02-07 수입 2700원")
library(stringr)
#(1). 일자별 수입을 다음과 같이 출력하시오. 
#   output: "3000원", "4000원", "5000원"
str_extract_all(Data2,"[0-9]{4}[가-힣]{1}")
#PLUS. string_extract_all에서 조건을 여러 개 부여할 때 &(and operator)를 사용할 필요 없음.

#(2). 위의 출력한 결과를 Data2_1에 저장하고 이를 벡터로 변환하시오.
Data2_1 <- str_extract_all(Data2,"[0-9]{4}[가-힣]{1}")
Data2_1 <- unlist(Data2_1)

#Q2. R에서 제공하는 CO2데이터셋을 대상으로 다음과 같은 단계로 파일을 저장하시오.
#    step1. treatment 칼럼 값이 "nonchilled"인 경우 "co2_df1.csv"파일로 저장하시오.
#    step2. treatment 칼럼 값이 "chilled"인 경우 "co2_df1.csv"파일로 저장하시오.
data(CO2)
str(CO2)
dim(CO2)
CO2_df1 <- CO2[CO2$Treatment=="nonchilled",]
CO2_df2 <- CO2[CO2$Treatment=="chilled",]
write.csv(CO2_df1,"D:/R_project/Hankyeong_DataAnalytics/co2_df1.csv")
write.csv(CO2_df2,"D:/R_project/Hankyeong_DataAnalytics/co2_df2.csv")