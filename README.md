Discrete population simulator (simulator-SB347.py)
==================================================

Population simulations were performed by running an in-house Python script.  Given an initial population, the rate of offspring production and the proportion of each gender produced by females and hermaphrodites at each time T, the simulator calculates the number of individuals of each gender and age.

The initial population is constituted of one dauer larvae. An iteration step of the simulator corresponds to 8 hours during which individuals “age” and produce offspring according to their gender and age.


README - Simulations performed and competition graphs


Simulations performed taking into consideration all ages
========================================================

## Simulation using observed data
python3.4 /PATH/TO/simulation-SB347.py -f /PATH/TO/Simulator_inputs/rate-fem-8h.csv -h /PATH/TO/Simulator_inputs/rate-herm-8h.csv -g /PATH/TO/Simulator_inputs/proportion-fem-8h.csv -i /PATH/TO/Simulator_inputs/proportion-herm-8h.csv -p default -o all > /PATH/TO/Simulator_outputs/Observed_population.txt


## RHABDIAS-LIKE

python3.4 /PATH/TO/simulation-SB347.py -f /PATH/TO/Simulator_inputs/rate-fem-8h.csv -h /PATH/TO/Simulator_inputs/rate-herm-8h.csv -g /PATH/TO/Simulator_inputs/proportion-only-herm-produced.csv -i /PATH/TO/Simulator_inputs/Proportion-10p-male-and-90p-female.csv -p default -o all > /PATH/TO/Simulator_outputs/Rhabdias-like.txt


## 2 populations of hermaphrodites (no males, male values added to the female ones): one not passing through dauer (fast population, having the birth rate of the observed females and the proportions of females but concatenating males and females), and one passing through dauer (slower, same birth rate as observed hermaphrodites and same proportions but male and females added together)

python3.4 /PATH/TO/simulation-SB347.py -f /PATH/TO/Simulator_inputs/rate-fem-8h.csv -h /PATH/TO/Simulator_inputs/rate-herm-8h.csv -g /PATH/TO/Simulator_inputs/proportion_from_fast_herm.csv -i /PATH/TO/Simulator_inputs/proportion_from_dauer_herm_producing_fast_herm.csv -p default -o all > /PATH/TO/Simulator_outputs/mixed_herm_population.txt

## Females appearing last

python3.4 /PATH/TO/simulation-SB347.py -f /PATH/TO/Simulator_inputs/rate-fem-8h.csv -h /PATH/TO/Simulator_inputs/rate-herm-8h.csv -g /PATH/TO/Simulator_inputs/proportion-fem_fem-strictly-appearing-late.csv -i /PATH/TO/Simulator_inputs/proportion-herm_fem-strictly-appearing-late-20p.csv -p default -o all > /PATH/TO/Simulator_outputs/females_last-overall-proportions-conserved.txt



Simulations performed taking into account only the dauers
=========================================================

## Simulation using observed data
python3.4 /PATH/TO/simulation-SB347.py -f /PATH/TO/Simulator_inputs/rate-fem-8h.csv -h /PATH/TO/Simulator_inputs/rate-herm-8h.csv -g /PATH/TO/Simulator_inputs/proportion-fem-8h.csv -i /PATH/TO/Simulator_inputs/proportion-herm-8h.csv -p default -o dauer > /PATH/TO/Simulator_outputs/Observed_population-DAUER.txt

## RHABDIAS-LIKE
python3.4 /PATH/TO/simulation-SB347.py -f /PATH/TO/Simulator_inputs/rate-fem-8h.csv -h /PATH/TO/Simulator_inputs/rate-herm-8h.csv -g /PATH/TO/Simulator_inputs/proportion-only-herm-produced.csv -i /PATH/TO/Simulator_inputs/Proportion-10p-male-and-90p-female.csv -p default -o dauer > /PATH/TO/Simulator_outputs/Rhabdias-like-DAUER.txt

## 2 populations of hermaphrodites (no males, male values added to the female ones): one not passing through dauer (fast population, having the birth rate of the observed females and the proportions of females but concatenating males and females), and one passing through dauer (slower, same birth rate as observed hermaphrodites and same proportions but male and females added together)

python3.4 /PATH/TO/simulation-SB347.py -f /PATH/TO/Simulator_inputs/rate-fem-8h.csv -h /PATH/TO/Simulator_inputs/rate-herm-8h.csv -g /PATH/TO/Simulator_inputs/proportion_from_fast_herm.csv -i /PATH/TO/Simulator_inputs/proportion_from_dauer_herm_producing_fast_herm.csv -p default -o dauer > /PATH/TO/Simulator_outputs/mixed_herm_population-DAUER.txt

## Females appearing last
python3.4 /PATH/TO/simulation-SB347.py -f /PATH/TO/Simulator_inputs/rate-fem-8h.csv -h /PATH/TO/Simulator_inputs/rate-herm-8h.csv -g /PATH/TO/Simulator_inputs/proportion-fem_fem-strictly-appearing-late.csv -i /PATH/TO/Simulator_inputs/proportion-herm_fem-strictly-appearing-late-20p.csv -p default -o dauer > /PATH/TO/Simulator_outputs/females_last-overall-proportions-conserved-DAUER.txt




Competition graphs in R -> Use the R script
===========================================

Example:

Rscript /PATH/TO/concatenating_simulations.r \
/PATH/TO/time_points-2.txt \
/PATH/TO/Simulator_outputs/Observed_population.txt \
/PATH/TO/Simulator_outputs/females_last-overall-proportions-conserved.txt \
/PATH/TO/Simulator_outputs/mixed_herm_population.txt \
/PATH/TO/Simulator_outputs/Rhabdias-like.txt



$ Rscript /PATH/TO/concatenating_simulations_for_dauer.r \
/PATH/TO/time_points-2.txt \
/PATH/TO/Simulator_outputs/Observed_population-DAUER.txt \
/PATH/TO/Simulator_outputs/females_last-overall-proportions-conserved-DAUER.txt \
/PATH/TO/Simulator_outputs/mixed_herm_population-DAUER.txt \
/PATH/TO/Simulator_outputs/Rhabdias-like-DAUER.txt

Rscript /PATH/TO/Rscript_competition-graphs.r /PATH/TO/all_simulations.csv /PATH/TO/all_simulations-DAUER.txt 19 19


Simulations
===========


- Simulator_inputs folder: 
File names starting with "proportion" and "rate" (inputs for the simulator)

- Simulator_outputs folder: 
File names starting with "SIMULATION" (outputs of the simulator)

- Comparison_of_simulations folder: 

  - File names "simulations" and "simulations-DAUER" :
Files containing, for each time point, the sum of the individuals of all genders (from the outputs of the different simulations performed). 
"simulations" contains the sums of individuals of all developmental stages and age, at each time point for each simulation
"simulations-DAUER" contains only the number of *dauers* at each time point for each simulation

  - Rscript_competition-graphs.r
R script to generate graphs used to compare simulations
  
  - Competition-graphs (PDF): 
Graphs generated from the files names "simulations" and "simulations-DAUER" of the different simulations performed. Output of the Rscript. 