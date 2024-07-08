#Importing the dataset
df = read.csv("regrex1.csv")

#looking at data
head(df)

#save as png but it keeps saving as a PDF???? plainly visualizing data (must keep space in front of x var)
plot(df$ x,df$y)
png(filename = "r_orig.png")

#get into ggplot for addition of axis titles etc
library(ggplot2)
args = commandArgs()
data = read.csv(args[6])

# Fitting Linear Regression to the Dataset
model = lm(y~x, data = df)

#defining summary stats
summary_stats = summary (model) 
summary_stats
summary_stats$r.squared
coef(model)
coef(model) [1]
coef(model) [2]

#plotting and attempting adding axis titles
ggtitle= "Salary vs Experience"
xlab= "Years of experience"
ylab= "Salary"
y_predict = predict(model, df)
plot(df$ x,df$y)
lines(df$ x,y_predict)
ggplot(df, aes(x =  x, y = y)) + geom_point() + xlab('Experience') + ylab('Salary')
ggplot() +
    geom_point(aes(x = df$ x, y = df$y),
               colour = 'blue') + xlab('Experience') + ylab ('Salary') +
    geom_line(aes(x = df$ x, y = predict(model, newdata = df)),
              colour = 'red')
ggsave("r_lm.png")











