# Script to generate input for competition graphs (only the dauer stage considered)
#
# Author: Sophie Tandonnet
# Date of creation: 25/05/2015
#
# USAGE: $ Rscript /PATH/TO/concatenating_simulations_for_dauer.r \
# /PATH/TO/time_points-2.txt \
# /PATH/TO/SIMULATION_OBSERVED-DATA-DAUER.txt \
# /PATH/TO/SIMULATION_females-last-DAUER.txt \
# /PATH/TO/SIMULATION_2_pops_of_herm_DAUER.txt \
# /PATH/TO/SIMULATION_RHABDIAS-LIKE-DAUER.txt


library(plyr)

#setwd("/Users/u1458103/Desktop/gitrepos/simulation-SB347")

args <- commandArgs(TRUE)
print(args)
len <- length(args)
print(len)

total <- read.table(args[1], sep="\t", h=F)

counter <- 2
for (arg in c(2:len)) {
	tabela <- read.table(args[arg], sep="\t")
	total[,counter] <- tabela[,1]
	counter <- counter + 1
	
	}

#total <- rename(total, c("V1"="time_points", "V2"="Observed", "V3"="Reversed.proportions", "V4"="Hermaphroditic", "V5"="Rhabdias.like"))
total <- rename(total, c("V1"="time_points", "V2"="Observed", "V3"="Females.last", "V4"="Hermaphroditic", "V5"="Rhabdias.like"))

	
write.table(total, file = "/PATH/simulations_dauer.txt", quote=F, row.names = F, sep='\t')