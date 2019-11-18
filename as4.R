library(openxlsx)
library(ggplot2)

data<-read.xlsx("material/tecator.xlsx")
# n=dim(data)[1]
# set.seed(12345)
#id=sample(1:n,floor(n*0.5))
#id
#train=data[id,]
#test=data[-id,]

# data<-data.frame(Moisture=train$Moisture,Protein=train$Protein)
# #data
# 
# my_model<-function(data,i){
#   form <- Moisture ~ poly(Protein, i)
#   model<-lm(form,data)
#   return(model)
# }
# m<-my_model(data,6)
# y_pred<-predict(m,train)
# mean((y_pred-train$Moisture)^2)
# 
# train_MSE<-c()
# for(i in 1:6){
#   model<-my_model(data,i)
#   y_pred<-predict(model,train)
#   MSE<-mean((y_pred-train$Moisture)^2)
#   train_MSE<-c(train_MSE,MSE)
# }
# 
# test_MSE<-c()
# for(i in 1:6){
#   model<-my_model(data,i)
#   y_pred<-predict(model,test)
#   MSE<-mean((y_pred-test$Moisture)^2)
#   test_MSE<-c(test_MSE,MSE)
# }
# 
# df1<-data.frame(degree=c(1:6),MSE=train_MSE)
# df2<-data.frame(degree=c(1:6),MSE=test_MSE)
# 
# #ggplot()+geom_point(df1,aes(x=degree,y=MSE),color="blue")
# plot1<-ggplot(df1,aes(x=degree,y=MSE))+geom_point(color="blue")
# plot1<-plot1+geom_point(df2,mapping=aes(x=degree,y=MSE),color="red")
# plot1

library(MASS)

n_data<-data.frame(Fat=data$Fat)
n_data<-cbind(n_data,data[,2:101])

#fit<-lm(Fat~.,data=n_data)
#step<-stepAIC(fit,direction = "both")
#step$anova
#summary(step)

library(glmnet)
#covariates=n_data[,-1]
#response=n_data[,1]


# y=test[,1]
# for(i in 1:dim(model$beta)[2]){
#   as.matrix(model$beta[,i])
#   ypred=as.matrix(test[,-1])%*%as.matrix(model$beta[,i])
#   print(sum((ypred-mean(y))^2)/sum((y-mean(y))^2))
#   
# }
# as.matrix(model$beta[,1])
# ypred=as.matrix(test[,-1])%*%as.matrix(model$beta[,1])
# sum((ypred-mean(y))^2)/sum((y-mean(y))^2)





# MSE_v<-c()
# for(i in c(mod_ridge_lambdas$lambda,0)){
#   mod=glmnet(as.matrix(covariates), response, alpha=0,family="gaussian",lambda = i)
#   pred=predict(mod,as.matrix(covaraites))
#   MSE=mean((pred-response)^2)
#   MSE_v<-c(MSE_v,MSE)
# }
# MSE_v
# d<-predict(mod_ridge,as.matrix(covaraites))
# plot(mod_ridge_lambdas, xvar="lambda", label=TRUE)

mod_lasso=cv.glmnet(as.matrix(covariates), response, alpha=1,family="gaussian")
plot(mod_lasso)
mod_lasso$lambda.min
coef(mod_lasso, s = "lambda.min")





