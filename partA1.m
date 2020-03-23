% GA Parameters
gen_max = 150; % 150 Max generations
pop_size = 50; % Population size of 50
sel_no = 20; % Selection of 20 individuals for mating, each generation
mut_rate = 0.02; % Mutation rate 0<mut_rate<1 where 0.02 = 2%
elite_no = 0; % Not used yet
pen_mode = 0; % Not used yet
sel_mode = 0; % Not used yet

seed = 0; % Use your student number
[profit, weight] = genDataset(seed);

weight_max = NaN;% Calculate weight_max, with total weight and capacity ratio...!

% Run the GA
[scores] = ga_A1 (gen_max, pop_size,...
    profit, weight, weight_max,...
    sel_no, mut_rate);
disp(scores)
% Imagine, examine, analyse - experiment...!
figure(1)
clf()
hold on
title("My Plot")
xlabel("Generations")
ylabel("Score")
plot(1:gen_max, scores, 'DisplayName', 'Best Scores')
legend('location', 'southeast')
hold off
% ...and have fun :)