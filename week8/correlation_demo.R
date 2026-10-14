#-----
# Import the data
#-----

# Upload the CSV file to the same JupyterHub folder as this notebook.
# Then import it and give the dataset a name.

correlation_data <- read.csv("correlation_data.csv")


#-----
# Look at the data
#-----

# Display the first 6 rows
head(correlation_data)

# Display the variable names
names(correlation_data)

# Display the number of rows and columns
dim(correlation_data)


#-----
# Visualize the relationship
#-----

# Always examine a scatterplot before interpreting a correlation.
# The first variable goes on the x-axis.
# The second variable goes on the y-axis.

plot(correlation_data$sleep,
     correlation_data$anxiety,
     xlab = "Hours of Sleep",
     ylab = "Anxiety Score",
     main = "Relationship Between Sleep and Anxiety")

# Add a line that summarizes the linear relationship
abline(lm(anxiety ~ sleep, data = correlation_data))


#-----
# Calculate the association
#-----

# Covariance shows whether the variables tend to move together.
# Its size depends on the variables' units, so it is hard to interpret alone.

cov(correlation_data$sleep,
    correlation_data$anxiety)

# Pearson's correlation ranges from -1 to +1.
# Positive values mean the variables tend to increase together.
# Negative values mean that as one increases, the other tends to decrease.

cor(correlation_data$sleep,
    correlation_data$anxiety)


#-----
# Test the correlation
#-----

# cor.test() provides:
# - the correlation coefficient, r
# - the p-value (we don't care about this yet)
# - a 95% confidence interval

cor.test(correlation_data$sleep,
         correlation_data$anxiety,
         method = "pearson")


#-----
# Calculate shared variance
#-----

# Save the correlation as an object called r
r <- cor(correlation_data$sleep,
         correlation_data$anxiety)

# Square r to calculate the proportion of shared variance
r_squared <- r^2

# Display r-squared
r_squared

# Convert the proportion to a percentage
r_squared * 100


#-----
# Check for unusual observations
#-----

# Boxplots can help identify unusually high or low values.
# Return to the scatterplot to see whether any point may strongly
# influence the relationship.

boxplot(correlation_data$sleep,
        main = "Sleep")

boxplot(correlation_data$anxiety,
        main = "Anxiety")


#-----
# Optional: descriptive statistics
#-----

# Install psych only if it is not already installed.
# install.packages("psych")

library(psych)

describe(correlation_data)

# write up help:

# There was a negative relationship between sleep and anxiety r = - .84, 95% CI [-.91, -.72],
# p < .001. Approximately 70% of the variability was shared between the two variables.
