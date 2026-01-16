############################################
cat header.txt
Grey	Red
############################################


#install.packages("tidyverse")
require(reshape2)
library(ggplot2)

dat<- read.table("H3K4Me1_enrichment.20x.hmc.poised.txt", fill=TRUE, header=T)
df = data.frame(dat)
r <- summary(df$H3K4Me1)
g <- summary(df$Others)
write(r,file="Summary.txt",append=TRUE)
write(g,file="Summary.txt",append=TRUE)


sample_main <- melt(df)
levels(sample_main$variable) <- c("Other CpG","Poised (H3K4Me1) CpG")

pdf("H3K4Me1_enrichment.20x.hmc.poised.boxplot_Violin.pdf")
p <- ggplot(sample_main, aes(variable, value)) + geom_violin((aes(fill=variable))) + scale_fill_manual(values = c("Poised (H3K4Me1) CpG" = '#96CA8D',"Other CpG" = 'grey'))
p + theme_classic()
dev.off()


############################################


dat<- read.table("H3K4Me1_enrichment.20x.mc.poised.txt", fill=TRUE, header=T)
df = data.frame(dat)
r <- summary(df$H3K4Me1)
g <- summary(df$Others)
write(r,file="Summary.txt",append=TRUE)
write(g,file="Summary.txt",append=TRUE)



sample_main <- melt(df)
levels(sample_main$variable) <- c("Other CpG","Poised (H3K4Me1) CpG")

pdf("H3K4Me1_enrichment.20x.mc.poised.boxplot_Violin.pdf")
p <- ggplot(sample_main, aes(variable, value)) + geom_violin((aes(fill=variable))) + scale_fill_manual(values = c("Poised (H3K4Me1) CpG" = '#45972E',"Other CpG" = 'grey'))
p + theme_classic()
dev.off()


############################################


dat<- read.table("H3K27Me3_enrichment.20x.hmc.poised.txt", fill=TRUE, header=T)
df = data.frame(dat)
r <- summary(df$H3K27Me3)
g <- summary(df$Others)
write(r,file="Summary.txt",append=TRUE)
write(g,file="Summary.txt",append=TRUE)



sample_main <- melt(df)
levels(sample_main$variable) <- c("Other CpG","Poised (H3K27Me3) CpG")

pdf("H3K27Me3_enrichment.20x.hmc.poised.boxplot_Violin.pdf")
p <- ggplot(sample_main, aes(variable, value)) + geom_violin((aes(fill=variable))) + scale_fill_manual(values = c("Poised (H3K27Me3) CpG" = '#E98380',"Other CpG" = 'grey'))
p + theme_classic()
dev.off()



############################################


dat<- read.table("H3K27Me3_enrichment.20x.mc.poised.txt", fill=TRUE, header=T)
df = data.frame(dat)
r <- summary(df$H3K27Me3)
g <- summary(df$Others)
write(r,file="Summary.txt",append=TRUE)
write(g,file="Summary.txt",append=TRUE)



sample_main <- melt(df)
levels(sample_main$variable) <- c("Other CpG","Poised (H3K27Me3) CpG")

pdf("H3K27Me3_enrichment.20x.mc.poised.boxplot_Violin.pdf")
p <- ggplot(sample_main, aes(variable, value)) + geom_violin((aes(fill=variable))) + scale_fill_manual(values = c("Poised (H3K27Me3) CpG" = '#EA3323',"Other CpG" = 'grey'))
p + theme_classic()
dev.off()



############################################


dat<- read.table("H3K27ac_enrichment.20x.hmc.active.txt", fill=TRUE, header=T)
df = data.frame(dat)
r <- summary(df$H3K27ac)
g <- summary(df$Others)
write(r,file="Summary.txt",append=TRUE)
write(g,file="Summary.txt",append=TRUE)



sample_main <- melt(df)
levels(sample_main$variable) <- c("Other CpG","active (H3K27ac) CpG")

pdf("H3K27ac_enrichment.20x.hmc.active.boxplot_Violin.pdf")
p <- ggplot(sample_main, aes(variable, value)) + geom_violin((aes(fill=variable))) + scale_fill_manual(values = c("active (H3K27ac) CpG" = '#5B5DAD',"Other CpG" = 'grey'))
p + theme_classic()
dev.off()


############################################


dat<- read.table("H3K27ac_enrichment.20x.mc.active.txt", fill=TRUE, header=T)
df = data.frame(dat)
r <- summary(df$H3K27ac)
g <- summary(df$Others)
write(r,file="Summary.txt",append=TRUE)
write(g,file="Summary.txt",append=TRUE)



sample_main <- melt(df)
levels(sample_main$variable) <- c("Other CpG","active (H3K27ac) CpG")

pdf("H3K27ac_enrichment.20x.mc.active.boxplot_Violin.pdf")
p <- ggplot(sample_main, aes(variable, value)) + geom_violin((aes(fill=variable))) + scale_fill_manual(values = c("active (H3K27ac) CpG" = '#2629CE',"Other CpG" = 'grey'))
p + theme_classic()
dev.off()


############################################



dat<- read.table("H3K4Me1_enrichment.20x.hmc.active.txt", fill=TRUE, header=T)
df = data.frame(dat)
r <- summary(df$H3K4Me1)
g <- summary(df$Others)
write(r,file="Summary.txt",append=TRUE)
write(g,file="Summary.txt",append=TRUE)



sample_main <- melt(df)
levels(sample_main$variable) <- c("Other CpG","active (H3K4Me1) CpG")

pdf("H3K4Me1_enrichment.20x.hmc.active.boxplot_Violin.pdf")
p <- ggplot(sample_main, aes(variable, value)) + geom_violin((aes(fill=variable))) + scale_fill_manual(values = c("active (H3K4Me1) CpG" = '#96CA8D',"Other CpG" = 'grey'))
p + theme_classic()
dev.off()


############################################


dat<- read.table("H3K4Me1_enrichment.20x.mc.active.txt", fill=TRUE, header=T)
df = data.frame(dat)
r <- summary(df$H3K4Me1)
g <- summary(df$Others)
write(r,file="Summary.txt",append=TRUE)
write(g,file="Summary.txt",append=TRUE)



sample_main <- melt(df)
levels(sample_main$variable) <- c("Other CpG","active (H3K4Me1) CpG")

pdf("H3K4Me1_enrichment.20x.mc.active.boxplot_Violin.pdf")
p <- ggplot(sample_main, aes(variable, value)) + geom_violin((aes(fill=variable))) + scale_fill_manual(values = c("active (H3K4Me1) CpG" = '#45972E',"Other CpG" = 'grey'))
p + theme_classic()
dev.off()











############################################


I############################################



dat<- read.table("H3K4Me1_enrichment.20x.mc.primed.txt", fill=TRUE, header=T)
df = data.frame(dat)
r <- summary(df$Red)
g <- summary(df$Grey)
write(r,file="Summary.txt",append=TRUE)
write(g,file="Summary.txt",append=TRUE)



sample_main <- melt(df)
levels(sample_main$variable) <- c("Other CpG","active (H3K4Me1) CpG")

pdf(" H3K4Me1_enrichment.20x.mc.primed.boxplot_Violin.pdf")
p <- ggplot(sample_main, aes(variable, value)) + geom_violin((aes(fill=variable))) + scale_fill_manual(values = c("active (H3K4Me1) CpG" = '#45972E',"Other CpG" = 'grey'))
p + theme_classic()
dev.off()


############################################

dat<- read.table("H3K4Me1_enrichment.20x.hmc.primed.txt", fill=TRUE, header=T)
df = data.frame(dat)
r <- summary(df$Red)
g <- summary(df$Grey)
write(r,file="Summary.txt",append=TRUE)
write(g,file="Summary.txt",append=TRUE)



sample_main <- melt(df)
levels(sample_main$variable) <- c("Other CpG","active (H3K4Me1) CpG")

pdf(" H3K4Me1_enrichment.20x.hmc.primed.boxplot_Violin.pdf")
p <- ggplot(sample_main, aes(variable, value)) + geom_violin((aes(fill=variable))) + scale_fill_manual(values = c("active (H3K4Me1) CpG" = '#96CA8D',"Other CpG" = 'grey'))
p + theme_classic()
dev.off()

