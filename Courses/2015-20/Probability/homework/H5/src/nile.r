simple_ls <- read.csv('Downloads/Nile.csv', header=T)
simple <- simple_ls[c("time", "Nile")]
plot(simple)
results = lm(time ~ Nile, data = simple)
summary(results)
anova(results)
sum(anova(results)[c("Mean Sq")]) - 938
abline(results, col="red")
