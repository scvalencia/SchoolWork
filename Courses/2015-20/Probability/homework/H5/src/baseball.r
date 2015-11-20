simple_ls <- read.csv('Downloads/Baseball.csv', header=T)
simple <- simple_ls[c("hits", "error86", "homer86", "atbat", "outs86", "walks86", "assist86", "hits86", "homeruns", "rbi86", "walks", "runs86", "atbat86", "runs", "rbi")]
plot(simple[c("runs", "rbi")])
results = lm(hits ~ error86 + homer86 + atbat + outs86 + walks86 + assist86 + hits86 + homeruns + rbi86 + walks + runs86 + atbat86 + runs + rbi, data = simple)
summary(results)
