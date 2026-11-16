#==========================================================
# One-Sample t-Test Practice
#==========================================================

# A researcher is interested in tooth growth
# in guinea pigs.
#
# The researcher wants to determine whether the average
# tooth length differs from a hypothetical population
# benchmark of 20 units.
#
# We will use the built-in ToothGrowth dataset.
#
# Research Question:
# Is the mean tooth length significantly different
# from 20 units?
#
# Use alpha = .05.


#-----
# Examine the data
#-----

# Load the dataset
data(ToothGrowth)

# View the first 6 rows


# Check the variable names


# Check the number of observations


# QUESTION 1:
# How many observations are in the dataset?
#
# Answer:


#-----
# Describe the scores
#-----

# Install psych only if needed.
# install.packages("psych")

library(psych)

# Display descriptive statistics for tooth length


# Calculate the sample mean


# Calculate the sample standard deviation


# QUESTION 2:
# What is the average tooth length?
#
# Answer:


#-----
# State the hypotheses
#-----

# QUESTION 3:
# State the null and alternative hypotheses.
#
# H0:
#
# H1:


# QUESTION 4:
# Is this a one-tailed or two-tailed test?
#
# Answer:


#-----
# Check the assumptions
#-----

# Independence must be evaluated based on how
# the observations were collected.

# Create a histogram to examine the distribution
# of tooth lengths.


# QUESTION 5:
# Describe the distribution.
# Are there any obvious extreme values?
#
# Answer:


# QUESTION 6:
# Can we determine independence from the histogram?
#
# Answer:


#-----
# Run the one-sample t-test
#-----

# Conduct a one-sample t-test comparing the
# sample mean to 20 units.
#
# Hint:
# t.test(variable, mu = comparison_value)


# QUESTION 7:
# Report the following:
#
# t statistic:
#
# Degrees of freedom:
#
# p-value:
#
# 95% confidence interval:


# QUESTION 8:
# Is the result statistically significant?
# Should we reject or fail to reject H0?
#
# Answer:


#-----
# Calculate Cohen's d
#-----

# Calculate Cohen's d.
#
# Hint:
# (sample mean - comparison value) / sample SD


# Calculate the unstandardized effect size.


# QUESTION 9:
# What is Cohen's d?
#
# Answer:


# QUESTION 10:
# What is the unstandardized effect size?
# What does it represent?
#
# Answer:


#-----
# Interpret the results
#-----

# QUESTION 11:
# Write 2-3 sentences summarizing the findings.
#
# Include:
# - The sample mean
# - The t statistic and p-value
# - Whether the result was statistically significant
# - A conclusion about the research question
#
# Answer: d