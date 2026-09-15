############################################################
# PSY 200: CLASS ACTIVITY
# Focus vs. Recall
############################################################

# This script uses the anonymous class data collected through
# the Google Form during the in-class attention/recall activity.
#
# Expected Google Form columns:
#   Column 1 = Timestamp
#   Column 2 = Focus rating
#   Column 3 = Number of words recalled
#   Column 4 = Number of classmates estimated to be distracted


############################################################
# 1. IMPORT THE CLASS DATA


class_data <- read.csv("donut_data.csv")

# Take a look at the data
class_data
head(class_data)

# Check the column names imported from Google Forms
names(class_data)


############################################################
# 2. RENAME THE VARIABLES


# Google Forms often uses the full question text as the
# column name, so we will replace those long names with
# short, easy-to-use names.

names(class_data)[2] <- "Focus"
names(class_data)[3] <- "Recall"
names(class_data)[4] <- "Distracted"

# Check that the names changed correctly
names(class_data)

# Look at the cleaned data
class_data


############################################################
# 3. LOOK AT OUR VARIABLES


# Self-reported focus ratings
class_data$Focus

# Number of words recalled
class_data$Recall

# Estimates of how many classmates were distracted
class_data$Distracted


############################################################
# 4. LOOK AT THE DISTRACTION ESTIMATES


# How much did students agree about how many people
# in the room were "distracted"?

class_data$Distracted

summary(class_data$Distracted)

range(class_data$Distracted, na.rm = TRUE)
hist(class_data$Distracted, xlim = c(0,25), col = "lightblue",
     main = "Number of People Distracted During Donut Activity")

############################################################
# 5. SCATTERPLOT: FOCUS VS. RECALL


#
# jitter() moves the plotted points a tiny amount so that we
# can see overlapping observations.
#
# IMPORTANT: The jitter is ONLY for visualization.
# We will calculate the correlation using the original values.

plot(jitter(class_data$Focus, amount = 0.12),
     jitter(class_data$Recall, amount = 0.12),
     xlab = "Self-Reported Focus (1-10)",
     ylab = "Number of Words Recalled",
     main = "Does Greater Focus Relate to Better Recall?",
     pch = 19,
     cex = 1.4,
     xlim = c(1, 10),
     ylim = c(0, 20))




############################################################
# 6. CALCULATE THE CORRELATION


# Calculate Pearson's correlation using the ORIGINAL,
# non-jittered values.

r <- cor(class_data$Focus,
         class_data$Recall,
         use = "complete.obs") # only participants who have answered
                               # both questions

r


############################################################
# 8. OPTIONAL: ADD A BEST-FITTING LINE


abline(lm(Recall ~ Focus, data = class_data),
       lwd = 2)



