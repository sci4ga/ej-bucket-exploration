library(tidyverse)
library(readxl)
library(patchwork)

July_2023_Hazardous_Site_Inventory <- read_excel("July-2023-Hazardous-Site-Inventory.xlsx")

filt <- July_2023_Hazardous_Site_Inventory %>%
  filter(`Investigation/ Cleanup Funding` == "A")

filt <- filt %>%
  separate_wider_delim(`List Date`, delim = "-", names = c("y","m","d"))

filt$y <- as.numeric(filt$y)

f1 <- filt %>%
  group_by(y, Class) %>%
  count() %>%
  ggplot(aes(x = y, y = n, color = Class))+
  geom_point() +
  labs(title = "Number of Abandoned Sites vs. Year", y = "Number of sites", x = "Years") +
  ylim(c(0,20))

filt$bin <- ">2010"
filt$bin[filt$y <= 2010] <- "2000<x<=2010"
filt$bin[filt$y <= 2000] <- "<=2000"

filt$class_grouped <- NA

filt$class_grouped[filt$Class == "I"] <- "I or II"
filt$class_grouped[filt$Class == "II"] <- "I or II"
filt$class_grouped[filt$Class == "IV"] <- "IV or V"
filt$class_grouped[filt$Class == "V"] <- "IV or V"

f2 <- filt %>%
  group_by(class_grouped, bin) %>%
  count() %>%
  ggplot(aes(x = factor(bin, levels = c("<=2000", "2000<x<=2010", ">2010")), y = n, fill = class_grouped)) +
  geom_col() +
  labs(title = "Number of Sites vs. Time Bin",
       y = "Number of Sites",
       x = "Year Bin")
  
sum <- f1 + f2 + plot_annotation(tag_levels = "A", tag_suffix = ")")

ggsave("Note.png", sum, width = 10, height = 5)
