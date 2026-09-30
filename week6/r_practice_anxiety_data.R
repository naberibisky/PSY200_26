# Packages we need
library(psych)
library(ggplot2)
#-----
# Import the data
#-----

# If you did not have the data file loaded into JupyterHub already, you would:
# 1. Download anxiety_data.csv to your computer.
# 2. Open JupyterHub.
# 3. Upload anxiety_data.csv into the same folder as this notebook.
#
# The quotation marks contain the name of the file.
# The arrow saves the imported dataset as anxiety_data.

# Set your working directory, then:
anxiety_data <- read.csv("anxiety_data.csv")


#-----
# Look at the data
#-----

# Display the first 6 rows of the dataset
head(anxiety_data)

# Display the names of the variables
names(anxiety_data)

# Display the number of rows and columns
dim(anxiety_data)


#-----
# Calculate descriptive statistics
#-----

# Calculate the mean anxiety score
mean(anxiety_data$anxiety)

# Calculate the median anxiety score
median(anxiety_data$anxiety)

# Display the minimum and maximum anxiety scores
range(anxiety_data$anxiety)

# Calculate the range by subtracting the minimum from the maximum
max(anxiety_data$anxiety) - min(anxiety_data$anxiety)

# Calculate the interquartile range
IQR(anxiety_data$anxiety)

# Calculate the variance
var(anxiety_data$anxiety)

# Calculate the standard deviation
sd(anxiety_data$anxiety)


#-----
# Visualize the data
#-----

# Create a histogram of anxiety scores
hist(anxiety_data$anxiety, col = "purple3")

# nicer
ggplot(anxiety_data, aes(x = anxiety)) +
  geom_histogram(
    binwidth = 2,
    fill = "#6C5CE7",
    color = "white",
    linewidth = 0.8) +
  
  labs(title = "Distribution of Anxiety Scores",
    subtitle = "How are anxiety scores distributed across participants?",
    x = "Anxiety Score",
    y = "Number of Participants") +
  theme_minimal(base_size = 15) +
  theme(plot.title = element_text(size = 22,
                                  face = "bold",
                                  margin = margin(b = 5)),
    plot.subtitle = element_text(size = 13,
                                 color = "grey40",
                                 margin = margin(b = 18)),
    axis.title = element_text(size = 13,face = "bold"),
    axis.text = element_text(size = 11,color = "grey30"),
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.major.y = element_line(
      color = "grey90",
      linewidth = 0.5),plot.margin = margin(20, 25, 20, 20))

# Create a boxplot of anxiety scores
boxplot(anxiety_data$anxiety)

# Nicer
ggplot(anxiety_data, aes(x = "", y = anxiety)) +
  
  # Raw data points
  geom_jitter(width = 0.12, size = 2.5,
    alpha = 0.35, color = "#6C5CE7") +
  
  # Boxplot
  geom_boxplot(width = 0.25,
    fill = "#6C5CE7",
    alpha = 0.75,
    color = "#3D348B",
    linewidth = 1,
    outlier.shape = NA) +
  
  labs(title = "Distribution of Anxiety Scores",
    subtitle = "Each point represents one participant",
    x = NULL,
    y = "Anxiety Score") +
  
  theme_minimal(base_size = 15) +
  theme(plot.title = element_text(
      size = 22,
      face = "bold",
      margin = margin(b = 5)),
    plot.subtitle = element_text(size = 13,
      color = "grey40",
      margin = margin(b = 18)),
    axis.title.y = element_text(
      size = 13,
      face = "bold"), axis.text.y = element_text(
      size = 11,
      color = "grey30"),axis.text.x = element_blank(),
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.major.y = element_line(
      color = "grey90",
      linewidth = 0.5),plot.margin = margin(20, 25, 20, 20))

#-----
# Use the psych package
#-----

# Display several descriptive statistics at once
describe(anxiety_data)
