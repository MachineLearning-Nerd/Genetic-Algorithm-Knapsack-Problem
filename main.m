clc
clear all
close all

%% Base parameters
population_size = 50;
maximum_generation = 150;
selection_number = 25;
mutation_rate = 0.02;

[profit, weight] = genDataset(0);