Discrete population simulator (simulator-SB347.py)
==================================================

Population simulations were performed by running an in-house Python script.  Given an initial population, the rate of offspring production and the proportion of each gender produced by females and hermaphrodites at each time T, the simulator calculates the number of individuals of each gender and age.

The initial population is constituted of one dauer larvae. An iteration step of the simulator corresponds to 8 hours during which individuals “age” and produce offspring according to their gender and age.

Simulations
===========

- README-simulation-and-comp-graphs.txt 
-> Simulations performed and R commands used to create graphs to compare the different simulations

- File names starting with "proportion" and "rate" 
-> inputs for the simulator

- File names starting with "SIMULATION" 
-> outputs of the simulator

- File names "all\_simulations" and "all\_simulations-DAUER"
-> Files containing, for each time point, the sum of the individuals of all genders (from the outputs of the different simulations performed). 
 "all\_simulations" contains the sums of individuals of all developmental stages and age, at each time point for each simulation
 "all\_simulations-DAUER" contains only the number of *dauers* at each time point for each simulation

- File names starting with "competition-graph" 
-> Graphs generated from the files names "all\_simulations" and "al\_simulations-DAUER" of the different simulations performed