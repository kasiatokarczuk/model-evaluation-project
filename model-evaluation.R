# ----Part 1----

# Task 1
dane <- read.csv2("C:/Users/kasia/Desktop/project-git/weather.csv")

# Task 2
str(dane)
summary(dane)

# Task 3
#Variables that may be irrelevant for the model predicting annual average precipitation: id, DWD_ID, STATION.NAME, FEDERAL.STATE, PERIOD (i.e., directly related to meteorological stations)
dane <- subset(dane, select = -c(id, DWD_ID, STATION.NAME, FEDERAL.STATE,PERIOD))

# Task 4
rows <- nrow(dane)
dane <- na.omit(dane)
rows_removed <-rows - nrow(dane)
rows_removed

# Task 5
dim(dane)

# Task 6
library(caTools)
split <- sample.split(dane, SplitRatio = 0.7,group=NULL)
train_data <- subset(dane, split == TRUE)
test_data <- subset(dane, split == FALSE)

# Task 7
zm_ob_train = as.vector(train_data['MEAN.ANNUAL.RAINFALL'])
zm_ob_test = as.vector(test_data['MEAN.ANNUAL.RAINFALL'])
zm_ob_train
zm_ob_test
matrix_test = data.matrix(test_data[colnames(test_data) != 'MEAN.ANNUAL.RAINFALL'])
matrix_train = data.matrix(train_data[colnames(train_data) != 'MEAN.ANNUAL.RAINFALL'])

# Task 8
library(GGally)
ggpairs(dane)

# Task 9
correlation_matrix <- cor(dane)
correlation_matrix

# Task 10
library(corrplot)
corrplot(correlation_matrix, method = "number")

# Task 11
filtr <- abs(cor(dane['MEAN.ANNUAL.RAINFALL'],dane)) >= 0.5
filtr

# Task 12
library(GGally)
ggpairs(dane[as.vector(filtr)])

  

# ----Part 2----
  
# Task 1
model = lm(MEAN.ANNUAL.RAINFALL ~ 1, train_data)[1]
model<- as.double(model)
srednia<-mean(dane$MEAN.ANNUAL.RAINFALL)
wyniki<-c(srednia,model)
wyniki

# Task 2
rmse_df <- data.frame(
  Model = character(),
  RMSE_Train = numeric(),
  RMSE_Test = numeric(),
  stringsAsFactors = FALSE
)

# Task 3
library(Metrics)
predicted<-lm(MEAN.ANNUAL.RAINFALL ~ 1, train_data)
observed<-predicted$fitted.values
predicted <- train_data$MEAN.ANNUAL.RAINFALL
rmse_train1<- sqrt(mean((predicted-observed)^2))
rmse_train1

# Task 4
model = lm(MEAN.ANNUAL.RAINFALL ~ 1, train_data)
predicted = predict(model, test_data)
observed = test_data$MEAN.ANNUAL.RAINFALL
rmse_test1<-sqrt(mean((predicted - observed)^2))
rmse_test1

# Task 5
model2 = lm(MEAN.ANNUAL.RAINFALL ~ ALTITUDE, train_data)
predicted2 = model2[5]
observed2 = train_data$MEAN.ANNUAL.RAINFALL
rmse_train2<-sqrt(mean((predicted2$fitted.values - observed2)^2))

# Task 6
predicted2 = predict(model2, test_data)
observed2 = test_data$MEAN.ANNUAL.RAINFALL
rmse_test2<-sqrt(mean((predicted2 - observed2)^2))
rmse_test2

# Task 7
model3 = lm(MEAN.ANNUAL.RAINFALL ~ MAX.RAINFALL, train_data)
predicted3 = model3[5]
observed3 = train_data$MEAN.ANNUAL.RAINFALL
rmse_train3<-sqrt(mean((predicted3$fitted.values - observed3)^2))
rmse_train3

# Task 8
predicted3 = predict(model3, test_data)
observed3 = test_data$MEAN.ANNUAL.RAINFALL
rmse_test3<-sqrt(mean((predicted3 - observed3)^2))
rmse_test3

# Task 9
model4 = lm(MEAN.ANNUAL.RAINFALL ~ MAX.RAINFALL + ALTITUDE , train_data)
predicted4 = model4[5]
observed4 = train_data$MEAN.ANNUAL.RAINFALL
rmse_train4<-sqrt(mean((predicted4$fitted.values - observed4)^2))
rmse_train4

r_squared <- summary(model4)$r.squared
r_squared

#R² is 0.7289122, which means that approximately 72.89% of the variability in the annual average precipitation has been explained by the independent variables (ALTITUDE and MAX.RAINFALL) in the model. The model fits the data quite well.

# Task 10
predicted4 = predict(model4, test_data)
observed4 = test_data$MEAN.ANNUAL.RAINFALL
rmse_test4<-sqrt(mean((predicted4 - observed4)^2))
rmse_test4

# Task 11
rmse_df <- data.frame(
  Model = c("Bazowy", "Regresja liniowa (ALTITUDE)", "Regresja liniowa (MAX.RAINFALL)", "Regresja liniowa wielokrotna"),
  RMSE_Train = c(rmse_train1, rmse_train2,rmse_train3,rmse_train4),
  RMSE_Test = c(rmse_test1, rmse_test2,rmse_test3,rmse_test4)
)

print(rmse_df)


  
# ----Part 3----
  
# Task 1
model5 = lm(MEAN.ANNUAL.RAINFALL ~ ALTITUDE + log(ALTITUDE) + ALTITUDE*ALTITUDE, train_data)
predicted5 = model5[5]
observed5 = train_data$MEAN.ANNUAL.RAINFALL
rmse_train5<-sqrt(mean((predicted5$fitted.values - observed5)^2))
rmse_train5

# Task 2
predicted5 = predict(model5, test_data)
observed5 = test_data$MEAN.ANNUAL.RAINFALL
rmse_test5<-sqrt(mean((predicted5 - observed5)^2))
rmse_test5

# Task 3
model6 = lm(MEAN.ANNUAL.RAINFALL ~ MAX.RAINFALL + log(MAX.RAINFALL) + MAX.RAINFALL*MAX.RAINFALL, train_data)
predicted6 = model6[5]
observed6 = train_data$MEAN.ANNUAL.RAINFALL
rmse_train5<-sqrt(mean((predicted6$fitted.values - observed6)^2))
rmse_train5

# Task 4
predicted6 = predict(model6, test_data)
observed6 = test_data$MEAN.ANNUAL.RAINFALL
rmse_test6<-sqrt(mean((predicted6 - observed6)^2))
rmse_test6

# Task 5
model7 = lm(MEAN.ANNUAL.RAINFALL ~ 1, train_data)
step(model7, scope = as.formula(MEAN.ANNUAL.RAINFALL ~ ALTITUDE + MAX.RAINFALL + MEAN.CLOUD.COVER + MEAN.ANNUAL.AIR.TEMP), direction = 'forward')

# Task 6
model8 = lm(MEAN.ANNUAL.RAINFALL ~ MAX.RAINFALL + MEAN.ANNUAL.AIR.TEMP +
              MEAN.CLOUD.COVER, data = train_data)
predicted8 = model8[5]
observed8 = train_data$MEAN.ANNUAL.RAINFALL
rmse_train8<-sqrt(mean((predicted8$fitted.values - observed8)^2))
rmse_train8

# Task 7
predicted8 = predict(model8, test_data)
observed8 = test_data$MEAN.ANNUAL.RAINFALL
rmse_test8<-sqrt(mean((predicted8 - observed8)^2))
rmse_test8

# Task 8
model9 = lm(MEAN.ANNUAL.RAINFALL ~ ALTITUDE + MAX.RAINFALL + MEAN.CLOUD.COVER + MEAN.ANNUAL.AIR.TEMP, train_data)
step(model9, direction = 'backward')

# Task 9
model10 = lm(MEAN.ANNUAL.RAINFALL ~ MAX.RAINFALL + MEAN.ANNUAL.AIR.TEMP +
               MEAN.CLOUD.COVER, data = train_data) 
predicted10 = model10[5]
observed10 = train_data$MEAN.ANNUAL.RAINFALL
rmse_train10<-sqrt(mean((predicted10$fitted.values - observed10)^2))
rmse_train10 

# Task 10
predicted10 = predict(model10, test_data)
observed10 = test_data$MEAN.ANNUAL.RAINFALL
rmse_test10<-sqrt(mean((predicted10 - observed10)^2))
rmse_test10