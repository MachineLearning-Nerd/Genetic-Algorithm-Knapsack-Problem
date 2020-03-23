% GA Parameters
gen_max = 150; % 150 Max generations
pop_size = 50; % Population size of 50
sel_no = 25; % Selection of 20 individuals for mating, each generation
mut_rate = 0.02; % Mutation rate 0<mut_rate<1 where 0.02 = 2%
elite_no = 0; % Not used yet
pen_mode = 0; % Not used yet
sel_mode = 0; % Not used yet
cap_rat = 0.65;

seed = 0; % Use your student number
[profit, weight] = genDataset(seed);

% weight_max = NaN;% Calculate weight_max, with total weight and capacity ratio...!
weight_max = cap_rat*sum(weight);% Calculate weight_max, with total weight and capacity ratio...!



% Imagine, examine, analyse - experiment...!
figure(1)
clf()
hold on
title("Plot for score analysis")
xlabel("Generations")
ylabel("Score")
% Run the GA
% Without validation
with_validation = 0;
[scores] = ga_A(gen_max, pop_size,...
    profit, weight, weight_max,...
    sel_no, mut_rate, with_validation);

plot(1:gen_max, scores, 'DisplayName', 'Best Scores(Without validate)')
with_validation = 1;
[scores] = ga_A(gen_max, pop_size,...
    profit, weight, weight_max,...
    sel_no, mut_rate, with_validation);
plot(1:gen_max, scores, 'DisplayName', 'Best Scores(With validate)')
legend('location', 'southeast')
hold off
% ...and have fun :)