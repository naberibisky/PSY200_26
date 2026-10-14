# PSY 200 | Correlation Practice
# Dataset: attitude (built into R)
#
# The attitude dataset contains responses from 30 departments to a survey
# about workplace attitudes and organizational practices.
# Each variable represents a numerical survey rating.
# To read more about the dataset, run: ?attitude
#
# Instructions: Run the code one section at a time. Fill in the blanks
# marked YOUR TURN and answer the questions in the comments.

# ------------------------------------------------------------
# 1. Get to know the dataset
# ------------------------------------------------------------

workplace <- attitude

head(workplace)
names(workplace)
dim(workplace)
?attitude

# Questions:
# a. How many rows are in this dataset? What does each row represent?
# b. How many variables are there?
# c. What do the variables 'rating', 'complaints', and 'raises' measure?


# ------------------------------------------------------------
# 2. Make a prediction BEFORE looking at the correlation
# ------------------------------------------------------------

# Predict the direction of the relationship between:
# complaints: how well employee complaints are handled
# rating: overall employee rating
#
# Do you predict a positive, negative, or near-zero relationship? Why?
# Prediction:
#


# ------------------------------------------------------------
# 3. Visualize the relationship
# ------------------------------------------------------------

plot(workplace$complaints,
     workplace$rating,
     xlab = "Handling of Employee Complaints",
     ylab = "Overall Employee Rating",
     main = "Complaints and Overall Rating")

# Add a line summarizing the linear relationship.
abline(lm(rating ~ complaints, data = workplace))

# Questions:
# a. Does the direction match your prediction?
# b. Is the relationship approximately linear?
# c. Do you notice any potentially unusual observations?


# ------------------------------------------------------------
# 4. Calculate covariance and correlation
# ------------------------------------------------------------

cov(workplace$complaints, workplace$rating)
cor(workplace$complaints, workplace$rating)

# Questions:
# a. What is the direction of the covariance?
# b. Report r to two decimal places.
# c. What does this correlation tell you, in words?


# ------------------------------------------------------------
# 5. Find the 95% confidence interval
# ------------------------------------------------------------

cor.test(workplace$complaints,
         workplace$rating,
         method = "pearson")

# Questions:
# a. What is the 95% confidence interval for the population correlation?
# b. Does the interval include 0?
# c. Why is an interval more informative than reporting r alone?
# Note: You do not need to interpret the p-value for this practice.


# ------------------------------------------------------------
# 6. Square the correlation
# ------------------------------------------------------------

r <- cor(workplace$complaints, workplace$rating)
r_squared <- r^2
r_squared
r_squared * 100

# Question:
# What percentage of variance is shared by these two variables?
# Reminder: Shared variance does NOT establish that one variable causes the other.


# ------------------------------------------------------------
# 7. YOUR TURN: Investigate a different pair of variables
# ------------------------------------------------------------

# Choose TWO different variables from:
# learning, raises, critical, advance
# See ?attitude for their definitions.
#
# Record your chosen pair:
# Variable 1:
# Variable 2:
# Prediction (positive, negative, or near zero):
#

# Create a plot of the association



# add a line to the plot



# calculate the covariance between the variables



# calculate the correlation between the variables



# find the 95% CI around the correlation



# square the correlation



# Questions:
# a. What did your scatterplot reveal?
# b. Report r and its 95% confidence interval.
# c. What percentage of variance is shared?
# d. Did your results match your prediction?
# e. Give one plausible reason these variables could be associated
#    without one necessarily causing the other.


# ------------------------------------------------------------
# 8. Wrap-up
# ------------------------------------------------------------

# Which pair of variables had the stronger LINEAR association?
# Explain how you decided (hint: compare the absolute values of r).

