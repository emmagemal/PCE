# Data visualiations for Alpha, Beta, and Gamma diversity in Sphagnum peat bogs 
# Population & Community Ecology - Year 3
# Emma Gemal, s1758915@sms.ed.ac.uk
# 19/11/2019


# Library ----
library(tidyverse)


# Creating the diversity data frame ----
mesocosm <- c(rep("one", 3), rep("two", 3), rep("pooled", 3)) %>% 
              as.factor()
type <- rep(c("alpha", "gamma", "beta"), 3) %>% 
          as.factor()
diversity <- c(12.23, 13.86, 1.13, 11.01, 16.58, 1.51, 13.75, 17.00, 1.24)

str(type)  # in the wrong order 
type <- factor(type, levels = unique(type))
str(type)

str(mesocosm)  # wrong order
mesocosm <- factor(mesocosm, levels = unique(mesocosm))
str(mesocosm)

diversity_data <- data.frame(mesocosm, type, diversity) 
                    
str(diversity_data)
View(diversity_data)


# Creating data frame for rank-abundance curve ----
abundance <- c(207, 198, 147, 123, 112, 66, 62, 59, 46, 46, 43, 31, 29, 20,
               17, 12, 11, 11, 11, 7, 6, 5, 5, 4, 3, 3, 2, 2, 1, 1)




# Plot for diversities ----
(plot <- ggplot(diversity_data,
                aes(x = mesocosm, y = diversity, 
                    fill = type, order = type)) +
            geom_bar(position = "dodge", stat = "identity", width = 0.7, color = "black") +
            labs(x = "Mesocosm", y = "True Diversity") +
            scale_y_continuous(expand = c(0,0), limits = c(0, 18)) +
            scale_x_discrete(labels = c("1", "2", "1 + 2")) + 
            scale_fill_manual(name = "Diversity\nType", 
                              breaks = c("alpha", "gamma", "beta"),
                              labels = c("Alpha", "Gamma", "Beta"),
                              values = c("#cccccc",
                                         "#969696",
                                         "#636363")) +
            theme_classic() +  # make it bw with borders, and skinny 
            theme(plot.margin = unit(c(1,1,1,1), units = , "cm"),
                  axis.text.x = element_text(size = 13, 
                                             margin = margin(t = 7, unit = "pt")),
                  axis.text.y = element_text(size = 13),
                  axis.title.y = element_text(size = 15),
                  axis.title.x = element_text(size = 15),
                  legend.title = element_text(size = 14),
                  legend.text = element_text(size = 12)))
  
ggsave(plot = plot, filename = "true_div_plot.png", path = "Other_work/PCE", 
       width = 15, height = 15, units = "cm")



  
