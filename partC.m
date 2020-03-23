%% C
clc
clear all
close all



seed = 40277854; % Use your student number
[profit, weight] = genDataset(seed);
cap_rat = 0.1;
weight_max = cap_rat*sum(weight);% Calculate weight_max, with total weight and capacity ratio...!
[opt_score, opt_sol] = knapsack_solution(profit, weight, weight_max);


% GA Parameters
gen_max = 150; % 150 Max generations
pop_size = 50; % Population size of 50
sel_no = 25; % Selection of 20 individuals for mating, each generation
mut_rate = 0.02; % Mutation rate 0<mut_rate<1 where 0.02 = 2%
elite_no = 5; % Not used yet
score_stop = 10^6;

cap_rat = 0.65;
meansol = 0;
with_validate = 1;

% least value repair
pen_mode = 0;
sel_mode = 2;

population_size = 20:20:100;
mval = length(population_size);
gen_max = 60:30:300;
nval = length(gen_max);
best_matrix = [];
for m = 1:(mval)
pop_size = population_size(m);
best_scores = zeros(nval,1);
for n = 1:(nval)
% parfor n = 1:(nval)
% Run the GA
[scores] = ga_C(gen_max(n), pop_size,...
    profit, weight, weight_max,...
    sel_no, mut_rate, elite_no, pen_mode, sel_mode, with_validate, meansol, score_stop);
best_scores(n,1) = max(scores);
end
best_matrix = [best_matrix; best_scores'];
end

[X,Y] = meshgrid(population_size,gen_max);
figure, surf(X, Y, best_matrix');
xlabel('population size')
ylabel('generation')
