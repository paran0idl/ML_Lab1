library(openxlsx)
data<-read.xlsx("spambase.xlsx")
n=dim(data)[1]
set.seed(12345)
id=sample(1:n, floor(n*0.5))
train=data[id,]
test=data[-id,]

logit<-glm(Spam~.,data=train,family = "binomial")
summary(logit)
pre<-predict(logit,test)
pre_class<-as.integer(pre>0.5)

# not exactly same result
cft<-table(test$Spam,pre_class)
cft
tp <- cft[2, 2]
tn <- cft[1, 1]
fp <- cft[2, 1]
fn <- cft[1, 2]
print(accuracy <- (tp + tn)/(tp + tn + fp + fn))



## Warning
library(kknn)
r<-kknn(Spam~.,train=train,test=test,k=1)
fit<-fitted(r)
fit<-as.integer(fit>0.5)
#table(fit,test$Spam)
cft<-table(fit,test$Spam)
cft
tp <- cft[2, 2]
tn <- cft[1, 1]
fp <- cft[2, 1]
fn <- cft[1, 2]
print(accuracy <- (tp + tn)/(tp + tn + fp + fn))
