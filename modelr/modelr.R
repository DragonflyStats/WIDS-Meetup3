library(purrr)
library(modelr)
library(dplyr)
library(magrittr)

########################################



results <-data.frame(RMSE=numeric(),RSquare=numeric(),MAE=numeric(),QAE_05=numeric(),
                     QAE_25=numeric(),QAE_50=numeric(),QAE_75=numeric(),QAE_95=numeric())


ex <- resample_partition(mtcars, c(test = 0.3, train = 0.7))
mod <- lm(mpg ~ wt, data = ex$train)
rmse(mod, ex$test)
rmse(mod, ex$train)

############################

mtcars1 <- sample_frac(mtcars,0.7)
mtcars2 <- sample_frac(mtcars,0.7)

mod <- lm(mpg ~ wt+cyl, data = mtcars1)

RMSE <- rmse(mod, mtcars2)
RSquare <- rsquare(mod, mtcars2)
MAE <- mae(mod, mtcars2)
QAE <- qae(mod, mtcars2)

theseResults <- data.frame(RMSE,RSquare,MAE,t(QAE))
names(theseResults) <- names(results)

results <- rbind(results,theseResults)

####################################


cv1 <- crossv_kfold(mtcars, 5)
cv1

cv2 <- crossv_mc(mtcars, 100)
models <- map(cv2$train, ~ lm(mpg ~ wt, data = .))
errs <- map2_dbl(models, cv2$test, rmse)
hist(errs)



#####################################


perms <- permute(mtcars, 1000, mpg)
models <- map(perms$perm, ~ lm(mpg ~ wt, data = .))
glanced <- map_df(models, broom::glance, .id = "id")
# distribution of null permutation statistics
hist(glanced$statistic)
# confirm these are roughly uniform p-values
hist(glanced$p.value)
# test against the unpermuted model to get a permutation p-value
mod <- lm(mpg ~ wt, mtcars)
mean(glanced$statistic > broom::glance(mod)$statistic)

