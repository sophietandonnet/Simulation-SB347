README - Simulations performed and competition graphs


Simulations performed taking into consideration all ages
========================================================

# Simulation using observed data
$ python3.4 /Path/to/script/simulation-SB347.py -f rate-fem-8h.csv -h rate-herm-8h.csv -g proportion-fem-8h.csv -i proportion-herm-8h.csv > FINAL_SIMULATIONS/SIMULATION_OBSERVED-DATA-all.txt

# hermaphrodite and female F1 proportions reversed
$ python3.4 /Path/to/script/simulation-SB347.py -f rate-fem-8h.csv -h rate-herm-8h.csv -g proportion-fem-reversed.csv -i proportion-herm-reversed.csv > FINAL_SIMULATIONS/SIMULATION_REVERSED-PROP-all.txt

# RHABDIAS-LIKE
$ python3.4 /Path/to/script/simulation-SB347.py -f rate-fem-8h.csv -h rate-herm-8h.csv -g proportion-only-herm-produced.csv -i Proportion-10p-male-and-90p-female.csv > FINAL_SIMULATIONS/SIMULATION_RHABDIAS-LIKE-all.txt

# Hermaphrodite producing 100% hermaphrodite
$ python3.4 /Path/to/script/simulation-SB347.py -f rate-fem-8h.csv -h rate-herm-8h.csv -g proportion-fem-8h.csv -i proportion-only-herm-produced.csv > FINAL_SIMULATIONS/SIMULATION_HERM-all.txt

# Hermaphrodite producing like female (hermaphrodite producing mostly hermaphrodite)
$ python3.4 /Path/to/script/simulation-SB347.py -f rate-fem-8h.csv -h rate-herm-8h.csv -g proportion-fem-8h.csv -i proportion-fem-8h.csv > FINAL_SIMULATIONS/SIMULATION_HERM_prod_like_fem-all.txt

# Hermaphrodites developping as fast as females (no delay) -> WARNING: Simulator slightly changed to do this simulation (notes in the simulator)
$ python3.4 /Path/to/script/simulation-SB347.py -f rate-fem-8h.csv -h rate-herm-8h.csv -g proportion-fem-8h.csv -i proportion-herm-8h.csv > FINAL_SIMULATIONS/SIMULATION_OBSERVED-DATA-same_larval_time_all.txt


Simulations performed taking into account only the dauers -> WARNING, the simulator script was slightly changed to output only the dauers
=========================================================================================================================================

# Simulation using observed data
$ python3.4 /Path/to/script/simulation-SB347.py -f rate-fem-8h.csv -h rate-herm-8h.csv -g proportion-fem-8h.csv -i proportion-herm-8h.csv > FINAL_SIMULATIONS/SIMULATION_OBSERVED-DATA-DAUER.txt

# hermaphrodite and female F1 proportions reversed
$ python3.4 /Path/to/script/simulation-SB347.py -f rate-fem-8h.csv -h rate-herm-8h.csv -g proportion-fem-reversed.csv -i proportion-herm-reversed.csv > FINAL_SIMULATIONS/SIMULATION_REVERSED-PROP-DAUER.txt

# RHABDIAS-LIKE
$ python3.4 /Path/to/script/simulation-SB347.py -f rate-fem-8h.csv -h rate-herm-8h.csv -g proportion-only-herm-produced.csv -i Proportion-10p-male-and-90p-female.csv > FINAL_SIMULATIONS/SIMULATION_RHABDIAS-LIKE-DAUER.txt

# Hermaphrodite producing 100% hermaphrodite
$ python3.4 /Path/to/script/simulation-SB347.py -f rate-fem-8h.csv -h rate-herm-8h.csv -g proportion-fem-8h.csv -i proportion-only-herm-produced.csv > FINAL_SIMULATIONS/SIMULATION_HERM-DAUER.txt

# Hermaphrodite producing like female (hermaphrodite producing mostly hermaphrodite)
$ python3.4 /Path/to/script/simulation-SB347.py -f rate-fem-8h.csv -h rate-herm-8h.csv -g proportion-fem-8h.csv -i proportion-fem-8h.csv > FINAL_SIMULATIONS/SIMULATION_HERM_prod_like_fem-DAUER.txt

# Hermaphrodites developping as fast as females (no delay) -> WARNING: Simulator slightly changed to do this simulation (notes in the simulator)
$ python3.4 /Path/to/script/simulation-SB347.py -f rate-fem-8h.csv -h rate-herm-8h.csv -g proportion-fem-8h.csv -i proportion-herm-8h.csv > FINAL_SIMULATIONS/SIMULATION_OBSERVED-DATA-same_larval_time_DAUER.txt





Competition graphs in R
=======================

library(plyr)

# Competition graph with all simulations
# --------------------------------------

# Mixed stages
# ***********

tabela <- read.table("/Path/all_simulations.csv",h=T,sep=',')

head(tabela)
#time_points Observed Rhabdias.like Hermaphroditic Reversed.proportions
#1           0        1             1              1                    1
#2           8        1             1              1                    1
#3          16       19            18             20                   20
#4          24       50            50             53                   52
#5          32       91            91             95                   92
#6          40      129           130            135                  131
#  No.developmental.delay.of.hermaphrodites
#1                                        1
#2                                        1
#3                                       19
#4                                       50
#5                                       91
#6                                      129

tabela2 <- data.frame(time_points= factor(),population = factor(), Counts = integer())

for (i in 1:nrow(tabela)) {
	batch = as.character(tabela[i,1])
	tabela2 <- rbind(tabela2,data.frame(time_points=batch,population='Observed',Counts=tabela[i,2]))
	tabela2 <- rbind(tabela2,data.frame(time_points=batch,population='Rhabdias.like',Counts=tabela[i,3]))
    tabela2 <- rbind(tabela2,data.frame(time_points=batch,population='Hermaphroditic',Counts=tabela[i,4]))
	tabela2 <- rbind(tabela2,data.frame(time_points=batch,population='Reversed.proportions',Counts=tabela[i,5]))
	tabela2 <- rbind(tabela2,data.frame(time_points=batch,population='No.developmental.delay.of.hermaphrodites',Counts=tabela[i,6]))
}

head(tabela2)

tabela3 <- tabela2[c(0:80),]

pdf("competition-graph-all-simulations.pdf")
ggplot(tabela3, aes(x=time_points, y=Counts))+
    geom_point(aes(shape=population,colour=population))+
    geom_line(aes(group = population, colour=population))+
#    scale_color_manual(values=c("black", "#888888" , "#666666")) +
    theme(axis.text = element_text(colour="black",size=12),axis.title=element_text(size=12,face="bold")) +
    theme(axis.text.x = element_text(lineheight = 1 , angle = 90, vjust=0.5, hjust=0.5)) +
    xlab("Time points (hours)") + ylab("Number of individuals") +
#	ylim(0,10000)+
    theme(legend.position = c(0.3, 0.75))+
    theme(axis.ticks = element_line(size = 0.5,colour="black")) +
 	theme(panel.background = element_blank()) + # blank background
    theme(panel.border = element_blank())+ # no border
    theme(axis.line = element_line(size = 0.2, colour = "black"))+
    theme(legend.key = element_rect(fill = "white"))
dev.off()


# Dauers only
# ***********

In the terminal:
$ paste time_points.txt SIMULATION_OBSERVED-DATA-DAUER.txt SIMULATION_RHABDIAS-LIKE-DAUER.txt SIMULATION_HERM-DAUER.txt SIMULATION_REVERSED-PROP-DAUER.txt SIMULATION_OBSERVED-DATA-same_larval_time_DAUER.txt> all_simulations-DAUER.txt

In R:
tabela <- read.table("/Path/all_simulations-DAUER.txt",sep='\t')
tabela <- rename(tabela, c("V1"="time_points", "V2"="Observed", "V3"="Rhabdias.like", "V4"="Hermaphroditic", "V5"="Reversed.proportions", "V6"="No.developmental.delay.of.hermaphrodites"))

head(tabela)

tabela2 <- data.frame(time_points= factor(),population = factor(), Counts = integer())

for (i in 1:nrow(tabela)) {
	batch = as.character(tabela[i,1])
	tabela2 <- rbind(tabela2,data.frame(time_points=batch,population='Observed',Counts=tabela[i,2]))
	tabela2 <- rbind(tabela2,data.frame(time_points=batch,population='Rhabdias.like',Counts=tabela[i,3]))
    tabela2 <- rbind(tabela2,data.frame(time_points=batch,population='Hermaphroditic',Counts=tabela[i,4]))
	tabela2 <- rbind(tabela2,data.frame(time_points=batch,population='Reversed.proportions',Counts=tabela[i,5]))
	tabela2 <- rbind(tabela2,data.frame(time_points=batch,population='No.developmental.delay.of.hermaphrodites',Counts=tabela[i,6]))
}

head(tabela2)
tabela4 <- tabela2[c(0:80),]

pdf("competition-graph-all-simulations-DAUER.pdf")
ggplot(tabela4, aes(x=time_points, y=Counts))+
    geom_point(aes(shape=population,colour=population))+
    geom_line(aes(group = population, colour=population))+
#    scale_color_manual(values=c("black", "#888888" , "#666666")) +
    theme(axis.text = element_text(colour="black",size=12),axis.title=element_text(size=12,face="bold")) +
    theme(axis.text.x = element_text(lineheight = 1 , angle = 90, vjust=0.5, hjust=0.5)) +
    xlab("Time points (hours)") + ylab("Number of Dauers") +
    theme(legend.position = c(0.3, 0.75))+
    theme(axis.ticks = element_line(size = 0.5,colour="black")) +
 	theme(panel.background = element_blank()) + # blank background
    theme(panel.border = element_blank())+ # no border
    theme(axis.line = element_line(size = 0.2, colour = "black"))+
    theme(legend.key = element_rect(fill = "white"))
dev.off()


