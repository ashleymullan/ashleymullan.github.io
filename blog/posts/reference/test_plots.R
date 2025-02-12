

#test script

#set sim
set.seed(1031)
B <- 1000
N <- 20000
A <- rbinom(N, 1, 0.5)
Z <- rnorm(N, 50 + 4 * A, 4)
Y <- rnorm(N, 100 + 160 * A, 160)
lambdas <- c(0:1000)/10
df <- data.frame(A,Z,Y)

#execute functions
ci_output <- ci_nmb(df, lambdas, B = 1000, conf_level = 0.95)
p_vals <- compute_2gp(null_scale = 0.15, lambdas,
                      ci_output$upper_bounds, ci_output$lower_bounds)
plot_2gp(lambdas, null_scale = 0.15,
         ci_output$lower_bounds, ci_output$upper_bounds,
         p_vals)

