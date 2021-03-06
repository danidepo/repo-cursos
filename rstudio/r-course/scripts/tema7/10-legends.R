#labels and legends
library(ggplot2)
tooth <- read.csv("../data/tema7/ToothGrowth.csv")
head(tooth)

ggplot(tooth, aes(x=dose, y = len, fill = as.factor(dose))) +
  geom_boxplot() +
  ggtitle("Crecimiento dental en funci�n de una dosis (mg/dia) de medicamento") +
  xlab("Dosis de vitamina C (mg/d�a)") +
  ylab("Crecimiento dental (en mm)") +
  labs(fill = "Dosis en mg/d�a") +
  theme(legend.position = "top") +
  guides(fill = F)


ggplot(tooth, aes(x=dose, y = len)) +
  geom_boxplot() +
  theme_bw() +
  theme_dark() +
  theme_classic() +
  theme_grey() +
  #theme(plot.background = element_rect(fill = "darkblue"))
  theme(axis.text.x = element_text(face = "bold", family = "Arial",
                                   size = 14,
                                   angle = 45,
                                   color = "#FF0000"),
        axis.text.y = element_text(face = "italic",
                                   family = "Courier",
                                   size = 16,
                                   angle = 30,
                                   color = "#449955")
  ) +
  theme(panel.border = element_blank()) +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())
