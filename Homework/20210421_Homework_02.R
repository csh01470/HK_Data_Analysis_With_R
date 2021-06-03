#2021.04.21. WED
#Hankyeong

#Q1. 데이터 프레임을 만드시오
# fruit       price   volume
# apple       1800    24
# strawberry  1500    38
# watermelon  3000    13
df_fr <- data.frame(fruit=c("apple","strawberry","watermelon"),
                    price=c(1800,1500,3000),
                    volume=c(24,38,13)) 

#Q1-2. 앞에서 만든 데이터 프레임을 이용해 과일가격평균, 판매량평균을 구하시오.
mean(df_fr$price) ; mean(df_fr$volume)

#Q2. 다음의 출력결과를 참고해 paste()함수를 이용하여 재현하시오. 
#    [1] "C1" "C2" "C3" ... "C10"
paste("C",c(1,2,3,4,5,6,7,8,9,10),sep="") 
paste0("C",1:10)

#Q3. A1, A2, A3, B1, B2, B3, C1, C2, C3로 표현되는 자료를 paste()함수를 이용해 만드시오.
c(paste0("A",c(1,2,3)),paste0("B",c(1,2,3)),paste0("C",c(1,2,3)))