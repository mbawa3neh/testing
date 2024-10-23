library(ggplot2)

data = read.csv("D:/Western Sydney/2024/Spring/COMP7024 (Spring 2024) Programming for Data Science/Week 10/epiSEIHCRD_combAge.csv")

# We find that the time variable is not of type Date
# So it is changed to date type where time 0 is 1/3/2020
data$t = as.Date(data$t, origin = "2020-03-01")

# The default palette is not suitable for those with colour blindness
# Set the colour palette for plots

cbbPalette = c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442",
                "#0072B2", "#D55E00", "#CC79A7")
palette(cbbPalette)

# We get the required date interval:

dDate = subset(data, subset = ((t >= "2020-06-01") & (t <= "2020-12-31")))

g = ggplot(data = dDate) +
  geom_line(mapping = aes(x = t, y = H), color = "red") +
  scale_x_date(date_breaks = "1 month", date_minor_breaks = "1 week",
               date_labels = "%B") +
  labs(title = "Hospital beds required (Sydney 2020)", x = "Date", y = "Beds")
print(g)