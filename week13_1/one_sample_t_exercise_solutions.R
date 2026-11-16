#==========================================================
# One-Sample t-Test Practice
# INSTRUCTOR SOLUTIONS
#==========================================================

#-----
# Examine the data
#-----
data(ToothGrowth)
head(ToothGrowth)
names(ToothGrowth)
nrow(ToothGrowth)

# QUESTION 1:
# There are 60 observations in the dataset.


#-----
# Describe the scores
#-----
library(psych)
describe(ToothGrowth$len)
mean(ToothGrowth$len)
sd(ToothGrowth$len)

# QUESTION 2:
# Mean = 18.81 units
# SD = 7.65 units


#-----
# State the hypotheses
#-----

# QUESTION 3:

# H0: mu = 20
# H1: mu != 20 (!= means not)

# H0: The population mean tooth length is 20 units.
# H1: The population mean tooth length differs
#     from 20 units.


# QUESTION 4:
#
# This is a two-tailed test because the researcher
# is interested in whether the mean differs from 20,
# rather than specifically being higher or lower.


#-----
# Check the assumptions
#-----

hist(ToothGrowth$len,
     main = "Distribution of Tooth Lengths",
     xlab = "Tooth Length")

# QUESTION 5:
#
# The distribution is reasonably spread out,
# without obvious extreme outliers.
#
# It is not perfectly normal, but with n = 60,
# the one-sample t-test is reasonably robust
# to moderate departures from normality.


# QUESTION 6:
#
# No. Independence cannot be established
# from a histogram.
#
# It must be evaluated based on the study design
# and how observations were collected.


#-----
# Run the one-sample t-test
#-----

t_test_result <- t.test(ToothGrowth$len, mu = 20)

t_test_result

# QUESTION 7:
#
# t = -1.206
# df = 59
# p = .233
# 95% CI = [16.84, 20.79]


#-----
# Interpret statistical significance
#-----

# QUESTION 8:
#
# The result is not statistically significant
# because p > .05.
#
# We fail to reject the null hypothesis.
#
# There is insufficient evidence that the
# population mean differs from 20 units.


#-----
# Calculate Cohen's d
#-----

cohens_d <- (mean(ToothGrowth$len) - 20) /
  sd(ToothGrowth$len)

cohens_d

# Cohen's d = approximately -0.156


unstandardized_effect <- mean(ToothGrowth$len) - 20

unstandardized_effect

# Unstandardized effect = approximately -1.19 units


# QUESTION 9:
#
# Cohen's d = -0.156.
#
# The observed mean is approximately 0.16
# standard deviations below the comparison value.


# QUESTION 10:
#
# The unstandardized effect size is -1.19 units.
#
# The sample mean is approximately 1.19 units
# below the hypothesized population mean.


#-----
# Interpret the results
#-----

# QUESTION 11:
#
# The guinea pigs had an average tooth length
# of 18.81 units.
#
# A one-sample t-test indicated that this mean
# was not significantly different from 20 units,
# t(59) = -1.21, p = .233.
#
# Therefore, we failed to reject the null
# hypothesis.