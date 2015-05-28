# Script to generate competition graphs
#
# Author: Sophie Tandonnet
# Date of creation: 22/05/2015
#
# USAGE: Rscript /PATH/TO/Rscript_competition-graphs.r simulations.txt simulations-DAUER.txt <number of time intervals to consider for the mixed stages graph> <number of time intervals for the dauer graph>
#
#


args <- commandArgs(TRUE)
print(args[1])
print(args[2])
print(args[3])

library(ggplot2)
library(plyr)

#setwd("Desktop/")
Comp_graph <- "Comparison_of_simulations_graph-144h.pdf"
Comp_graph_dauer <- "Comparison_of_simulations_graph-144h-DAUER.pdf"

N_simulations <- 4

number_of_lines_all <- as.integer(args[3])*N_simulations
number_of_lines_Dauer <- as.integer(args[4])*N_simulations

tabela_all <- read.table(args[1], sep="\t", h=T)


tabela2_all <- data.frame(time_points= factor(),population = factor(), Counts = integer())


for (i in 1:nrow(tabela_all)) {
	batch = as.character(tabela_all[i,1])
	tabela2_all <- rbind(tabela2_all,data.frame(time_points=batch,population='Observed',Counts=tabela_all[i,2]))
	tabela2_all <- rbind(tabela2_all,data.frame(time_points=batch,population='females.last',Counts=tabela_all[i,3]))
    tabela2_all <- rbind(tabela2_all,data.frame(time_points=batch,population='Hermaphroditic',Counts=tabela_all[i,4]))
	tabela2_all <- rbind(tabela2_all,data.frame(time_points=batch,population='Rhabdias.like',Counts=tabela_all[i,5]))
}


# Set the number of lines you would like to take into account for the graph
tabela3 <- tabela2_all[c(0:number_of_lines_all),]

pdf(Comp_graph)
ggplot(tabela3, aes(x=time_points, y=Counts))+
    geom_point(aes(shape=population,colour=population), size = 3)+
    geom_line(aes(group = population, colour=population, linetype=population),size=1)+
    scale_y_log10()+
#    scale_color_manual(values=c("#6600CC", "#FFCC00" , "#000000" , "#CC0000")) +
#    scale_color_manual(values=c("black", "#888888" , "#666666")) +
    theme(axis.text = element_text(colour="black",size=12),axis.title=element_text(size=12,face="bold")) +
    theme(axis.text.x = element_text(lineheight = 1 , angle = 90, vjust=0.5, hjust=0.5)) +
    xlab("Time points (hours)") + ylab("Number of individuals (log10)") +
#	ylim(0,10000)+
    theme(legend.position = c(0.3, 0.75))+
	scale_colour_discrete(breaks=c("Observed","females.last","Hermaphroditic", "Rhabdias.like"), name="Population", labels=c("Observed (1)", "Females produced last (2)", "Hermaphroditic (3)", "Rhabdias-like (4)"))+
    scale_shape_discrete(breaks=c("Observed","females.last","Hermaphroditic", "Rhabdias.like"), name="Population", labels=c("Observed (1)", "Females produced last (2)", "Hermaphroditic (3)", "Rhabdias-like (4)"))+
	scale_linetype_manual(values=c("solid","solid","dashed","solid","solid"),breaks=c("Observed","females.last","Hermaphroditic", "Rhabdias.like"), name="Population", labels=c("Observed (1)", "Females produced last (2)", "Hermaphroditic (3)", "Rhabdias-like (4)"))+
	theme(axis.ticks = element_line(size = 0.5,colour="black")) +
 	theme(panel.background = element_blank()) + # blank background
    theme(panel.border = element_blank())+ # no border
    theme(axis.line = element_line(size = 0.2, colour = "black"))+
    theme(legend.key = element_rect(fill = "white"))
dev.off()


# Dauers only
# ***********


tabela <- read.table(args[2], sep="\t", h=T)

tabela2 <- data.frame(time_points= factor(),population = factor(), Counts = integer())


for (i in 1:nrow(tabela)) {
	batch = as.character(tabela[i,1])
	tabela2 <- rbind(tabela2,data.frame(time_points=batch,population='Observed',Counts=tabela[i,2]))
	tabela2 <- rbind(tabela2,data.frame(time_points=batch,population='females.last',Counts=tabela[i,3]))
    tabela2 <- rbind(tabela2,data.frame(time_points=batch,population='Hermaphroditic',Counts=tabela[i,4]))
	tabela2 <- rbind(tabela2,data.frame(time_points=batch,population='Rhabdias.like',Counts=tabela[i,5]))
}

# Set the number of lines you would like to take into account for the graph

tabela3 <- tabela2[c(0:number_of_lines_Dauer),]

pdf(Comp_graph_dauer)
ggplot(tabela3, aes(x=time_points, y=Counts))+
    geom_point(aes(shape=population,colour=population),size=3)+
    geom_line(aes(group = population, colour=population, linetype=population),size=1)+
    scale_y_log10()+
#    scale_color_manual(values=c("#AA0078", "#000078" , "#B3B3D7" , "darkgreen")) +
	scale_linetype_manual(values=c("solid","solid","dashed","solid","solid"))+
    theme(axis.text = element_text(colour="black",size=12),axis.title=element_text(size=12,face="bold")) +
    theme(axis.text.x = element_text(lineheight = 1 , angle = 90, vjust=0.5, hjust=0.5)) +
    xlab("Time points (hours)") + ylab("Number of Dauers (log10)") +
    theme(legend.position = c(0.3, 0.75))+
	scale_colour_discrete(breaks=c("Observed","females.last","Hermaphroditic", "Rhabdias.like"), name="Population", labels=c("Observed (1)", "Females produced last (2)", "Hermaphroditic (3)", "Rhabdias-like (4)"))+
    scale_shape_discrete(breaks=c("Observed","females.last","Hermaphroditic", "Rhabdias.like"), name="Population", labels=c("Observed (1)", "Females produced last (2)", "Hermaphroditic (3)", "Rhabdias-like (4)"))+
	scale_linetype_manual(values=c("solid","solid","dashed","solid","solid"),breaks=c("Observed","females.last","Hermaphroditic", "Rhabdias.like"), name="Population", labels=c("Observed (1)", "Females produced last (2)", "Hermaphroditic (3)", "Rhabdias-like (4)"))+
#	scale_fill_manual(name="Population", labels=c("Observed (1)", "Females produced last (2)", "Hermaphroditic (3)", "Rhabdias-like (4)"))+
    theme(axis.ticks = element_line(size = 0.5,colour="black")) +
 	theme(panel.background = element_blank()) + # blank background
    theme(panel.border = element_blank())+ # no border
    theme(axis.line = element_line(size = 0.2, colour = "black"))+
    theme(legend.key = element_rect(fill = "white"))
dev.off()


