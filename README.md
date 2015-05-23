Discrete population simulator (simulator-SB347.py)
==================================================

Population simulations were performed by running an in-house Python script.  Given an initial population, the rate of offspring production and the proportion of each gender produced by females and hermaphrodites at each time T, the simulator calculates the number of individuals of each gender and age.

The initial population is constituted of one dauer larvae. An iteration step of the simulator corresponds to 8 hours during which individuals “age” and produce offspring according to their gender and age.


README - Simulations performed and competition graphs


Simulations performed taking into consideration all ages
========================================================

## Simulation using observed data
$ python3.4 /Path/to/script/simulation-SB347.py -f rate-fem-8h.csv -h rate-herm-8h.csv -g proportion-fem-8h.csv -i proportion-herm-8h.csv > FINAL_SIMULATIONS/SIMULATION_OBSERVED-DATA-all.txt

## hermaphrodite and female F1 proportions reversed
$ python3.4 /Path/to/script/simulation-SB347.py -f rate-fem-8h.csv -h rate-herm-8h.csv -g proportion-fem-reversed.csv -i proportion-herm-reversed.csv > FINAL_SIMULATIONS/SIMULATION_REVERSED-PROP-all.txt

## RHABDIAS-LIKE
$ python3.4 /Path/to/script/simulation-SB347.py -f rate-fem-8h.csv -h rate-herm-8h.csv -g proportion-only-herm-produced.csv -i Proportion-10p-male-and-90p-female.csv > FINAL_SIMULATIONS/SIMULATION_RHABDIAS-LIKE-all.txt

## Hermaphrodite producing 100% hermaphrodite
$ python3.4 /Path/to/script/simulation-SB347.py -f rate-fem-8h.csv -h rate-herm-8h.csv -g proportion-fem-8h.csv -i proportion-only-herm-produced.csv > FINAL_SIMULATIONS/SIMULATION_HERM-all.txt

## Hermaphrodite producing like female (hermaphrodite producing mostly hermaphrodite)
$ python3.4 /Path/to/script/simulation-SB347.py -f rate-fem-8h.csv -h rate-herm-8h.csv -g proportion-fem-8h.csv -i proportion-fem-8h.csv > FINAL_SIMULATIONS/SIMULATION_HERM_prod_like_fem-all.txt

## Hermaphrodites developping as fast as females (no delay) -> WARNING: Simulator slightly changed to do this simulation (notes in the simulator)
$ python3.4 /Path/to/script/simulation-SB347.py -f rate-fem-8h.csv -h rate-herm-8h.csv -g proportion-fem-8h.csv -i proportion-herm-8h.csv > FINAL_SIMULATIONS/SIMULATION_OBSERVED-DATA-same_larval_time_all.txt


Simulations performed taking into account only the dauers -> WARNING, the simulator script was slightly changed to output only the dauers
=========================================================================================================================================

## Simulation using observed data
$ python3.4 /Path/to/script/simulation-SB347.py -f rate-fem-8h.csv -h rate-herm-8h.csv -g proportion-fem-8h.csv -i proportion-herm-8h.csv > FINAL_SIMULATIONS/SIMULATION_OBSERVED-DATA-DAUER.txt

## hermaphrodite and female F1 proportions reversed
$ python3.4 /Path/to/script/simulation-SB347.py -f rate-fem-8h.csv -h rate-herm-8h.csv -g proportion-fem-reversed.csv -i proportion-herm-reversed.csv > FINAL_SIMULATIONS/SIMULATION_REVERSED-PROP-DAUER.txt

## RHABDIAS-LIKE
$ python3.4 /Path/to/script/simulation-SB347.py -f rate-fem-8h.csv -h rate-herm-8h.csv -g proportion-only-herm-produced.csv -i Proportion-10p-male-and-90p-female.csv > FINAL_SIMULATIONS/SIMULATION_RHABDIAS-LIKE-DAUER.txt

## Hermaphrodite producing 100% hermaphrodite
$ python3.4 /Path/to/script/simulation-SB347.py -f rate-fem-8h.csv -h rate-herm-8h.csv -g proportion-fem-8h.csv -i proportion-only-herm-produced.csv > FINAL_SIMULATIONS/SIMULATION_HERM-DAUER.txt

## Hermaphrodite producing like female (hermaphrodite producing mostly hermaphrodite)
$ python3.4 /Path/to/script/simulation-SB347.py -f rate-fem-8h.csv -h rate-herm-8h.csv -g proportion-fem-8h.csv -i proportion-fem-8h.csv > FINAL_SIMULATIONS/SIMULATION_HERM_prod_like_fem-DAUER.txt

## Hermaphrodites developping as fast as females (no delay) -> WARNING: Simulator slightly changed to do this simulation (notes in the simulator)
$ python3.4 /Path/to/script/simulation-SB347.py -f rate-fem-8h.csv -h rate-herm-8h.csv -g proportion-fem-8h.csv -i proportion-herm-8h.csv > FINAL_SIMULATIONS/SIMULATION_OBSERVED-DATA-same_larval_time_DAUER.txt


$ paste time_points.txt SIMULATION_OBSERVED-DATA-DAUER.txt SIMULATION_RHABDIAS-LIKE-DAUER.txt SIMULATION_HERM-DAUER.txt SIMULATION_REVERSED-PROP-DAUER.txt SIMULATION_OBSERVED-DATA-same_larval_time_DAUER.txt> all_simulations-DAUER.txt




Competition graphs in R -> Use the R script
===========================================

Example:

Rscript /PATH/TO/Rscript_competition-graphs.r /PATH/TO/all_simulations.csv /PATH/TO/all_simulations-DAUER.txt 17 17


Simulations
===========


- Simulator_inputs folder: 
File names starting with "proportion" and "rate" (inputs for the simulator)

- Simulator_outputs folder: 
File names starting with "SIMULATION" (outputs of the simulator)

- Comparison_of_simulations folder: 

  - File names "all\_simulations" and "all\_simulations-DAUER" :
Files containing, for each time point, the sum of the individuals of all genders (from the outputs of the different simulations performed). 
"all\_simulations" contains the sums of individuals of all developmental stages and age, at each time point for each simulation
"all\_simulations-DAUER" contains only the number of *dauers* at each time point for each simulation

  - Rscript_competition-graphs.r
R script to generate graphs used to compare simulations
  
  - Competition-graphs (PDF): 
Graphs generated from the files names "all\_simulations" and "all\_simulations-DAUER" of the different simulations performed. Output of the Rscript. 