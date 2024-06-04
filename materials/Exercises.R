# Load the moderate.mediation package
install.packages("moderate.mediation") # If you have installed the package, there is no need to install it again.
library(moderate.mediation)

# Import the data
jobs = write.csv("E:\\R\\jobs.csv") # Replace the path with the path of the folder where you save the data.
# Alternatively, you may download the mediation R package and call the data via the following code:
# install.packages("mediation") # If you have installed the package, there is no need to install it again.
# library(mediation)
# data(jobs)

# Exercise 1
# Please run the moderated mediation analysis by completing the following code.

results = modmed(data = jobs, 
                 treatment = "treat", 
                 mediator = "job_seek", 
                 outcome = "depress2", 
                 covariates.disc = "sex",
                 covariates.cont = c("age", "depress1"), 
                 moderators.cont = "econ_hard", 
                 m.model = list(), 
                 y.model = list(),
                 comp.treatment.value = 1,
                 ref.treatment.value = 0,
                 comp.mod.cont.values = ,
                 ref.mod.cont.values = , 
                 m.scale = "continuous", 
                 y.scale = "continuous", 
                 method = "mc", nmc = 1000, conf.level = 0.95, seed = 1)
summary(object = results) 

# Exercise 2
# Conduct a sensitivity analysis to evaluate whether TIE.ref and TIE.dif are 
# sensitive to a potential violation of the identification assumption by completing 
# the following code. For illustration purpose, please specify grid.b.m and grid.b.y to be 2. 
# Their values need to be increased in real data analysis.

# Check the number of codes first, and specify ncore in modmed.sens() and modmed.plot() functions to be the total number of cores - 1. 
# This is because at least one core should be saved to run other programs on the computer while you are running the R program.
install.packages("parallel")
library(parallel)
detectCores()

sens.results = modmed.sens(object = ,
                           sens.effect = c("", ""),
                           range.b.m = NULL,
                           range.b.y = NULL,
                           grid.b.m = ,
                           grid.b.y = ,
                           U.scale = "binary",
                           p.u = 0.5,
                           t.rand = TRUE,
                           t.model = NULL,
                           t.scale = "binary",
                           b.t = NULL,
                           iter = 10,
                           nsim = 5,
                           ncore = )
sens.plot(object = results,
          sens.results = sens.results,
          effect = "")

# Exercise 3
# Please visualize how the total indirect effect of the job training intervention 
# on depression transmitted through job search self-efficacy varied by econ_hard 
# by completing the following code.

modmed.plot(object = results,
            effect = "",
            moderator = "",
            is.dist.moderator = TRUE,
            probs = c(0.1, 0.25, 0.5, 0.75, 0.9),
            ncore = )
