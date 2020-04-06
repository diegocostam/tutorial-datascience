install.packages(c("tidyverse", "corrplot", "GGally", "caret", 
                   "rpart", "rpart.plot"), dependencies = TRUE)

# Utilizando o conjunto de dados Iris

summary(iris)

library(corrplot)

correlacao <- cor(iris[, -5])
corrplot.mixed(correlacao, upper = "ellipse")

library(tidyverse)

theme_set(theme_bw())
ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) + geom_point()

ggplot(iris, aes(x = Petal.Length, y = Petal.Width, colour = Species)) + 
  geom_point()

library(GGally)

# remover a variavel especie, pois nao eh quantitativa
ggpairs(iris[, -5], aes(colour = iris$Species))

library(rpart)
library(rpart.plot)
modelo <- rpart(Species ~ ., method = "class", data = iris)
prp(modelo, extra = 1)

library(caret)

# definir 75% dos dados para treino, 25% para teste
trainIndex <- createDataPartition(iris$Species, p = 0.75, list = FALSE)
iris_treino <- iris[trainIndex, ]
iris_teste <- iris[-trainIndex, ]

