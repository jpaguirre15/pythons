# Pete Aguirre II 

library("ggplot2")
library("psych")
library("car")
library("MASS")
library("gginference")
library("ez")
library("rstatix")
library("tableone")

#NOTE: You may have to change the letter directory
# Read csv 
data = read.csv("D:/CS772/data.csv", header = TRUE)
# Print data 
# data 

# Seperate headers bc you might need to data frame 
participant_id = data[, c("participant_id")]
group_id = data[, c("group_id")]
task_id = data[, c("task_id")]
time_sec = data[, c("time_sec")]
language = data[, c("language")]
errors = data[, c("errors")]
year = data[, c("year")]
task_completion = data[, c("task_completion")]
py_exp = data[, c("py_exp")]
technique = data[, c("technique")]

# Python 2 and Python 3 (language) subset 
py2 = subset(data, language == "Python2")
py3 = subset(data, language == "Python3")
# Show py2 and py3 
# py2
# py3

# Group 1 and Group 2 (group_id) subset 
group1 = subset(data, group_id == 1)
group2 = subset(data, group_id == 2)
# Show group1 and group2
# group1 
# group2

# -----
# Language v. Time & Group v. Time 

# Mean, Std.Dev., Median, Min, Max (language x time_sec)
py2Des = describe(py2$time_sec)
py3Des = describe(py3$time_sec)
py2Des
py3Des

# Mean, Std.Dev., Median, Min, Max (group_id x time_sec)
group1Des = describe(group1$time_sec)
group2Des = describe(group2$time_sec)
group1Des
group2Des

# T.Test 
py2Times = py2[, c("time_sec")]
py3Times = py3[, c("time_sec")]
t.test(py2Times, py3Times)
cor(py2Times, py3Times)

# T.Test Graph
ggttest(t.test(py2Times, py3Times))

# ANOVA test between time and language 
time.ezaov = ezANOVA(data=data, dv=.(time_sec), wid=.(participant_id), within=.(language), detailed = TRUE, type = 3)
time.ezaov

# Box plots
py2Box = boxplot(group1$time_sec ~ group1$task_id, data = data, main="Group 1", xlab = "Task #", ylab = "Time  taken  to  complete  (in sec.)")
py3Box = boxplot(group2$time_sec ~ group2$task_id, data = data, main="Group 2", xlab = "Task #", ylab = "Time  taken  to  complete  (in sec.)")
# -----

# -----
# Play around w/ Time 

# ANOVA test between time and python experience  
time.ezaov = ezANOVA(data=data, dv=.(time_sec), wid=.(participant_id), between=.(py_exp), detailed = TRUE, type = 3)
time.ezaov

# -----

# -----
# Language v. Errors & Group v. Errors

# Mean, Std.Dev., Median, Min, Max (language x time_sec)
py2Des = describe(py2$errors)
py3Des = describe(py3$errors)
py2Des
py3Des

# Mean, Std.Dev., Median, Min, Max (group_id x time_sec)
group1Des = describe(group1$errors)
group2Des = describe(group2$errors)
group1Des
group2Des

# T.test
py2Errors = py2[, c("errors")]
py3Errors = py3[, c("errors")]
t.test(py2Errors, py3Errors)
cor(py2Errors, py3Errors)

# T.Test Graph
ggttest(t.test(py2Errors, py3Errors))

# ANOVA test between errors and language 
time.ezaov = ezANOVA(data=data, dv=.(errors), wid=.(participant_id), within=.(language), detailed = TRUE, type = 3)
time.ezaov

# Testing for homogeneity of variances via Levene's 
leveneTest(data$errors, data$language, center = mean)


# Box plots
py2Box = boxplot(group1$errors ~ group1$task_id, data = data, main="Group 1", xlab = "Task #", ylab = "# of Errors")
py3Box = boxplot(group2$errors ~ group2$task_id, data = data, main="Group 2", xlab = "Task #", ylab = "# of Errors")

# -----

# -----
# Play around w/ Errors

# ANOVA test between errors and python experience 
time.ezaov = ezANOVA(data=data, dv=.(errors), wid=.(participant_id), between=.(py_exp), detailed = TRUE, type = 3)
time.ezaov

# -----


demographics = read.csv("D:/CS772/demographics.csv", header = TRUE)
tableDem = CreateTableOne(data=demographics)

