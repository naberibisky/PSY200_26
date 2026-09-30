############################################################
# Gentle Intro to ggplot2
############################################################

library(ggplot2)

# We have already done some descriptive explorations in R

# Let's recap!


data(iris) # default dataset in R, a classic!
dat <- iris # naming it dat

# inspect our data with the usuals:
head(dat)
str(dat) # 3 species of iris, length, width, of sepals and petals
?iris # more info on our data
# FYI: A sepal is one of the small, leaf-like structures 
# that form the outermost part of a flower. 
# Together, the sepals make up the calyx, 
# which is the flower’s first layer of protection

# Let's do some ggplot2!!
# ------------------------------------------------------------
# ggplot2 (VERY gentle introduction)
# ------------------------------------------------------------


# In base R, we made plots by calling one function at a time:
#    hist(dat$Sepal.Width)
# ggplot2 works a little differently.

# ggplot2 is built on the idea of LAYERS.
# You start with the data...
# Then tell ggplot which variable goes where...
# Then add a "geometry" (the type of plot).
#
# Think of it like building a plot piece by piece.

# ------------------------------------------------------------
# 1. Histogram in ggplot2
# ------------------------------------------------------------

# Base R version (for comparison):
hist(dat$Sepal.Width, col = "green3")

# ggplot2 version:
ggplot(dat, aes(x = Sepal.Width)) +       # data + mapping, we are working with sepal.width on x axis
  geom_histogram(fill = "green3",         # type of plot
                 color = "white",         # outline between bars
                 bins = 15) +             # number of bins
  labs(title = "Histogram of Sepal Width", # title
       x = "Sepal Width", # x-axis name
       y = "Count") # y-axis name

# Note: 
# - ggplot(dat, aes(x = Sepal.Width)) creates the axes
ggplot(dat, aes(x = Sepal.Width)) 

# - geom_histogram() tells ggplot WHAT to draw.
ggplot(dat, aes(x = Sepal.Width)) +       # data + mapping, we are working with sepal.width on x axis
  geom_histogram(fill = "green3",         # type of plot
                 color = "white",         # outline between bars
                 bins = 15)

# - labs() adds text.
ggplot(dat, aes(x = Sepal.Width)) +       # data + mapping, we are working with sepal.width on x axis
  geom_histogram(fill = "green3",         # type of plot
                 color = "white",         # outline between bars
                 bins = 15) +             # number of bins
  labs(title = "Histogram of Sepal Width", # title
       x = "Sepal Width", # x-axis name
       y = "Count") # y-axis name

# importantly, you can save this to an object
myhist <- ggplot(dat, aes(x = Sepal.Width)) +       # data + mapping, we are working with sepal.width on x axis
  geom_histogram(fill = "green3",         # type of plot
                 color = "white",         # outline between bars
                 bins = 15) +             # number of bins
  labs(title = "Histogram of Sepal Width", # title
       x = "Sepal Width", # x-axis name
       y = "Count") # y-axis name

myhist # and call it
# ------------------------------------------------------------
# 2. Boxplot in ggplot2
# ------------------------------------------------------------

# Base R version:
boxplot(dat$Sepal.Width, col = "purple")

# ggplot2 version:
ggplot(dat, aes(y = Sepal.Width)) +  # y axis of the boxplot is sepal.width
  geom_boxplot(fill = "purple") +  # adding boxplot variable
  labs(title = "Boxplot of Sepal Width", # adding labels
       y = "Sepal Width")

# Note:
# - For a boxplot, we typically map the variable to the y-axis.


# ------------------------------------------------------------
# 3. Boxplots BY GROUP (ggplot2 makes this very easy)
# ------------------------------------------------------------

ggplot(dat, aes(x = Species, y = Sepal.Width)) +
  geom_boxplot(fill = "lightblue") +
  labs(title = "Sepal Width by Species",
       x = "Species",
       y = "Sepal Width")

# This is one of the biggest advantages of ggplot2:
# adding a grouping variable is as simple as mapping x = Species.
#
# ggplot2 automatically separates the data into groups based on the values
# of Species, and draws a separate boxplot for each group. 
#
# In base R, we would have to write code to manually split the data or 
# specify a formula like Sepal.Width ~ Species. In ggplot2, we just tell 
# ggplot which variable goes on the x-axis (the grouping variable) and 
# which goes on the y-axis (the numeric outcome), and it handles the rest.
#
# Notice that:
#   - Species is categorical (a factor), so ggplot creates three distinct
#     groups on the x-axis.
#   - Sepal.Width is numeric, so ggplot knows to draw a boxplot showing
#     the distribution of values *within each species*.
#
# This is a huge part of what makes ggplot2 powerful: 
# once the variables are mapped correctly, the plotting function knows 
# exactly how to organize and visualize the data.

# if you want to change color by species
# take fill away from the boxplot layer and add it to the first layer
ggplot(dat, aes(x = Species, y = Sepal.Width, fill = Species)) +
  geom_boxplot() +
  labs(title = "Sepal Width by Species",
       x = "Species",
       y = "Sepal Width")

# ------------------------------------------------------------
# 4. Violin plot in ggplot2
# ------------------------------------------------------------


# ggplot2 version:
ggplot(dat, aes(x = Species, y = Sepal.Width)) +
  geom_violin(fill = "red3") +
  labs(title = "Violin Plot of Sepal Width by Species",
       x = "Species",
       y = "Sepal Width")

# Note:
# - Violin plots show the distribution shape within each group.
# - They combine features of histograms & boxplots.


# ------------------------------------------------------------
# 5. Bar plot in ggplot2 (categorical data)
# ------------------------------------------------------------

# Base R version:
species_table <- table(dat$Species)
barplot(species_table, col = c("blue","yellow","red"))

# ggplot2 version:
ggplot(dat, aes(x = Species)) +
  geom_bar(fill = "orange") +
  labs(title = "Counts of Each Species",
       x = "Species",
       y = "Count")

# Note:
# geom_bar() automatically counts the number of rows for each category.
# no need for another table

# ------------------------------------------------------------
# 6. Lollipop plot in ggplot2 (categorical data)
# ------------------------------------------------------------
means <- tapply(dat$Sepal.Width, dat$Species, mean)
means

means_df <- data.frame(
  Species = names(means),
  mean_width = as.numeric(means)
)

ggplot(means_df, aes(x = Species, y = mean_width)) +
  geom_segment(aes(x = Species, xend = Species,
                   y = 0, yend = mean_width),
               color = "grey50", linewidth = 1) +
  geom_point(color = "steelblue", size = 4) +
  labs(title = "Mean Sepal Width by Species (Lollipop Plot)",
       x = "Species",
       y = "Mean Sepal Width") +
  theme_minimal()


# you can get really elaborate with these plots!
# don't worry about understanding this code at this point


ggplot(dat, aes(x = Species, y = Sepal.Width, fill = Species)) +
  # Violin layer: full distribution by group
  geom_violin(trim = FALSE,
              alpha = 0.6,
              color = NA) +
  
  # Boxplot overlay: show median & IQR inside each violin
  geom_boxplot(width = 0.15,
               outlier.shape = NA,
               alpha = 0.9,
               color = "black") +
  
  # Jittered raw points: individual observations
  geom_jitter(width = 0.08,
              alpha = 0.5,
              size = 1.5) +
  
  # Custom colors for each species
  scale_fill_manual(values = c(
    "setosa"     = "#66C2A5",
    "versicolor" = "#FC8D62",
    "virginica"  = "#8DA0CB"
  )) +
  
  # Nice labels and title
  labs(
    title = "Sepal Width by Iris Species",
    subtitle = "Violin + boxplot + raw data",
    x = "Species",
    y = "Sepal Width (cm)",
    fill = "Species"
  ) +
  
  # Clean, minimal theme
  theme_minimal(base_size = 14) +
  theme(
    legend.position = "none",               # we don't really need the legend
    plot.title = element_text(face = "bold"),
    plot.subtitle = element_text(color = "grey30"),
    axis.title.x = element_text(margin = margin(t = 10)),
    axis.title.y = element_text(margin = margin(r = 10))
  )


