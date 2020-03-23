%% C
clc
clear all
close all



seed = 40277854; % Use your student number
[profit, weight] = genDataset(seed);
cap_rat = 0.1;
weight_max = cap_rat*sum(weight);% Calculate weight_max, with total weight and capacity ratio...!
% [opt_score, opt_sol] = knapsack_solution(profit, weight, weight_max);


% GA Parameters
gen_max = 150; % 150 Max generations
pop_size = 50; % Population size of 50
sel_no = 25; % Selection of 20 individuals for mating, each generation
mut_rate = 0.02; % Mutation rate 0<mut_rate<1 where 0.02 = 2%
elite_no = 5; % Not used yet

cap_rat = 0.65;
meansol = 0;
with_validate = 1;

% least value repair
pen_mode = 0;
sel_mode = 2;



gen_max = 10:10:300;
n = length(gen_max);
best_scores = zeros(n,1);
parfor n = 1:length(n)
% Run the GA
[scores] = ga_B(gen_max, pop_size,...
    profit, weight, weight_max,...
    sel_no, mut_rate, elite_no, pen_mode, sel_mode, with_validate, meansol, score_stop);
best_scores(n,1) = max(scores);
end
