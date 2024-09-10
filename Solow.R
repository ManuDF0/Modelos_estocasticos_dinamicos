setwd('Modelos Estocásticos Dinámicos/')
library(ggplot2)
library(dplyr)
library(latex2exp)

A_bar <- 1
n <- 0.2
delta <- 0.1
theta <- 0.36
s <- 0.2
epsilon <- rnorm(n = 50, mean = 0, sd = 0.02)

h_ss <- ((n+delta)/s*A_bar)^(1/(1-theta))

# Solow HW ----------------------------------------------------------------
#desvio del SS
k_tilde <- numeric(50) # En el periodo 1 no hay desvio
for (i in c(1:50)) {
  k_tilde[i+1] <- s*A_bar*h_ss^(1-theta)*epsilon[i]*(1+k_tilde[i])/(1+n) + k_tilde[i]
}

for (i in c(1:50)) {
  k_tilde[i+1] <- s*A_bar*h_ss^(1-theta)*epsilon[i] + k_tilde[i]
}
# GPT ---------------------------------------------------------------------
num_periods <- 50
num_paths <- 5

# calculate_deviations <- function(epsilon) {
#   k_tilde <- numeric(num_periods)
#   k_tilde[1] <- 0
#   for (i in 1:(num_periods - 1)) {
#     k_tilde[i + 1] <- s * A_bar * h_ss^(1 - theta) * epsilon[i] * (1 + k_tilde[i]) / (1 + n) + k_tilde[i]
#   }
#   return(k_tilde)
# }

desvios <- function(epsilon){
  k_tilde <- numeric(num_periods)
  k_tilde[1] <- 0
  for (i in 1:(num_periods-1)) {
    k_tilde[i+1] <- s*A_bar*h_ss^(1-theta)*epsilon[i] + k_tilde[i]
  }
  return(k_tilde)
}
  
all_deviations <- data.frame()

# set.seed(78765) 
# for (path in 1:num_paths) {
#   epsilon <- rnorm(num_periods, mean = 0, sd = 0.02)
#   k_tilde <- calculate_deviations(epsilon)
#   path_data <- data.frame(time = 1:num_periods, k_tilde = k_tilde, path = factor(path))
#   all_deviations <- rbind(all_deviations, path_data)
# }

set.seed(78765) 
for (path in 1:num_paths) {
  epsilon <- rnorm(num_periods, mean = 0, sd = 0.02)
  k_tilde <- desvios(epsilon)
  path_data <- data.frame(time = 1:num_periods, k_tilde = k_tilde, path = factor(path))
  all_deviations <- rbind(all_deviations, path_data)
}

ggplot(all_deviations, aes(x = time, y = k_tilde, color = path)) +
  geom_line() +
  labs(x = TeX('$t$'),
       y = TeX('$\\tilde{k}_{t+1}$'),
       color = 'Sendero') +
  theme_minimal()

