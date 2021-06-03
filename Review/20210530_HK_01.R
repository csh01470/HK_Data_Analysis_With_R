#2021.05.30. SUN
#Hankyeong

###################### I. 범주형 변수(데이터)에 대한 논의 ######################
#01. 일반 변수와 Factor형 변수의 차이점 1
#(1) plot()창에서 자동으로 빈도 chart로 변환함.
vector_1 <- c(1,2,3,3,4,4,5)
plot(vector_1)
vector_2 <- as.factor(vector_1)
plot(vector_2)
#PLUS. vector_1을 빈도 chart로 변환하려 할 경우, table()를 이용함.
plot(table(vector_1))

#(2) Factor형 변수에는 데이터에 레벨(level)이 부여됨.
str(vector_1)
str(vector_2)

#(3) Factor형 변수는 문자형 변수와 다르게 split()의 적용이 불가함.

#02. R에서 Factor형 변수의 전산 처리방법
#(1) EX1:
#vector_2를 정의할 때, vector_1를 레벨이 존재하는 정수로 값을 정의(할당)하고,
#그 정수값을 다시 더미변수로 변환해서 사용함.

#(2) EX2:
#변수 x는 계절(봄, 여름, 가을, 겨울)을 할당한 문자형 데이터이고, 
#이를 Factor형 데이터로 변환할 경우 다음과 같음.
# 계절 => 계절1 계절2 계절3 계절4
#  봄       1     0     0     0
# 여름      0     1     0     0
# 가을      0     0     1     0
# 겨울      0     0     0     1

#(3) 그러므로, Factor형 데이터는 시스템 리소스(메모리)를 많이 할당함을 알 수 있음. (0값이 ㅈㄴ 많아짐.)
#    이러한 이유로 Factor화 할 때 메모리를 잘 활용할 수 있도록 고안하는 방법이 여러가지 있음.
#    ex) 원-핫 인코딩, ...

############## II. Machine Learning의 종류와 현 추세에 대한 논의 ###############
#01. Machine Learning의 종류 1-1: 지도학습의 회귀(Regression)
#(1) General Linear Model + Lasso(L1 norm) or Ridge(L2 norm) or Elasticnet(L1+L2)

#(2) Random Forest

#(3) Support Vector Regression

#02. Machine Learning의 종류 1-2: 지도학습의 분류(Classification)
#(2) 분류(Classification)
#(1) Logistic Regression + Lasso(L1 norm) or Ridge(L2 norm) or Elasticnet(L1+L2)

#(2) k-nn

#(3) naive-bayes

#(4) Random Forest

#(5) Support Vector Machine

#03. Machine Learning의 종류 2: 비지도학습
#(1) PCA

#(2) k-means, k-medoids

#(3) Hierarchical clustering

#TIP. 전통 통계학에서는 변수들의 인과관계를 독립변수와 종속변수로 표현하지만,
#     IT업계에서는 독립변수를 Feature, 종속변수를 target(or lable)이라고 표현함.

###################### III. Domain Knowledge에 대한 논의 #######################
#01. 데이터셋에 대한 논의
#(1) 데이터를 볼 때 "왜(Why)"와 그러한 이유를 잘 파악하는 것이 중요함.
#PLUS. Data Scientist가 가져야할 가장 중요한 자질은 궁금해 하는 것임.

#(2) Chart를 보고 1차원적으로 해석할 것이 아니라, 비통계인인 Client의 입장까지도 고려할 것
#PLUS. 일반적인 대중 편견을 파악하기 위해선 웹크롤링 후 텍스트 마이닝이 효과적임. 

#(3) 데이터셋의 변수와 속성과 집계 환경, 값에 대한 의미 모두를 이해해야함.
#PLUS. 데이터셋을 전처리한 근거(이상치 처리 등) 역시 타당해야함.

#(4) 데이터는 특정값에 편향되지 않아야함. 하지만 이유가 존재한다면 괜찮음.

#(5) 데이터 분석을 마쳤다는 것은, 그 데이터셋에 대해 완벽하게 이해했음을 의미함.

#02. 회사 생활에서의 조언
#(1) 너가 신입일 때 가장 중요한 판단요소는 전문적인 업무 해결능력이 아니라, 
#    이 직군에 대한 어느정도의 지식을 갖고 의사소통할 준비가 되어있는가를 보는 것임.

#(2) 회사에서 신입일 때, 소일거리하면서 멍 때리지말고 특히 회의할 때 맥을 짚어라.

#(3) 상사가 개새끼이더라도 분명 배울게 있어서 남아 있는거니 잘 배워서 이직하자. 낄

#TIP. R^2 >= 0.8이면 변수간 종속성이 너무 강해서 실무에서 안씀. 그러나 0.7 이상이면 괜찮음.
