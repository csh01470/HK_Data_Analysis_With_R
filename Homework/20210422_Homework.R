#2021.04.22. TUR
#Hankyeong

##Q1. R의 내장데이터셋인 iris데이터셋을 이용하세요.
##(1) 붓꽃 종이 versicolor 이면서 Sepal.Length 이 6이상인 데이터를 color로 저장하시오.
iris <- as.data.frame(iris)
iris_1 <-  iris
ls(iris_1)
str(iris_1)
color <- iris_1[iris_1$Species=="versicolor"&iris_1$Sepal.Length>=6,]

#or
library(dplyr)
color_2 <- iris_1 %>% filter(iris_1$Species=="versicolor" & iris_1$Sepal.Length>=6)

#or
color_3 <- subset(iris_1, iris_1$Species=="versicolor" & iris_1$Sepal.Length>=6)

#검증하기.
head(color,10);head(color_2,10)

##(2) Sepal.Length과 Petal.Length 열만 저장하여 csv로 저장하시오.
iris_1_SLPL <- iris_1[,c(1,3)]

#or
iris_1_SLPL_2 <- data.frame(iris_1$Sepal.Length,
                          iris_1$Petal.Length)
#or
library(dplyr)
iris_1_SLPL_3 <- iris_1 %>% select(Sepal.Length,Petal.Length)

#검증하기.
head(iris_1_SLPL,10);head(iris_1_SLPL_2,10);head(iris_1_SLPL_3,10)

#csv로 저장하기.
write.csv(iris_1_SLPL,
          "d:/R_project/Hankyeong_DataAnalytics/iris_1_slpl.csv",
          row.names=F)