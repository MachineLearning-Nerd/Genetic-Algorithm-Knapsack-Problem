%% B1
clc
clear all
close all
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
with_validate = 1;
meansol = 0;

% Imagine, examine, analyse - experiment...!
cap_rat = 0.99;
figure(1)
clf()
hold on
title(["Plot for score analysis:Capacity\_Ratio:", num2str(cap_rat)])
xlabel("Generations")
ylabel("Score")
for elite_no = [0, 5, 50]
% Run the GA
[scores] = ga_B(gen_max, pop_size,...
    profit, weight, weight_max,...
    sel_no, mut_rate, elite_no, pen_mode, sel_mode, with_validate, meansol);
stringval = ['Best Scores with (Elite\_no):', num2str(elite_no)];
plot(1:gen_max, scores, 'DisplayName', stringval)
end

legend('location', 'southeast')
hold off


%% B2
clc
clear all


% GA Parameters
gen_max = 150; % 150 Max generations
pop_size = 50; % Population size of 50
sel_no = 25; % Selection of 20 individuals for mating, each generation
mut_rate = 0.02; % Mutation rate 0<mut_rate<1 where 0.02 = 2%
elite_no = 5; % Not used yet
pen_mode = 0; % Not used yet
sel_mode = 0; % Not used yet
cap_rat = 0.65;

seed = 0; % Use your student number
[profit, weight] = genDataset(seed);

% weight_max = NaN;% Calculate weight_max, with total weight and capacity ratio...!
weight_max = cap_rat*sum(weight);% Calculate weight_max, with total weight and capacity ratio...!
with_validate = 0;
meansol = 1;

pen_mode = 1;
% Imagine, examine, analyse - experiment...!
figure(2)
clf()
hold on
title(["Plot for score analysis: pen\_mode:", num2str(pen_mode)])
% title("Plot for score analysis")
xlabel("Generations")
ylabel("Score")
for cap_rat = 0.3:0.3:0.9
% for cap_rat = 1
    disp(cap_rat)
    weight_max = cap_rat*sum(weight);
    % Run the GA
    [scores] = ga_B(gen_max, pop_size,...
        profit, weight, weight_max,...
        sel_no, mut_rate, elite_no, pen_mode, sel_mode, with_validate, meansol);
    stringval = ['Mean Scores with (Capacity Ratios) :', num2str(cap_rat)];
    plot(1:gen_max, scores, 'DisplayName', stringval)
end

legend('location', 'southeast')
hold off


pen_mode = 2;
% Imagine, examine, analyse - experiment...!
figure(3)
clf()
hold on
title(["Plot for score analysis: pen\_mode:", num2str(pen_mode)])
% title("Plot for score analysis")
xlabel("Generations")
ylabel("Score")
for cap_rat = 0.3:0.3:0.9
% for cap_rat = 1
    disp(cap_rat)
    weight_max = cap_rat*sum(weight);
    % Run the GA
    [scores] = ga_B(gen_max, pop_size,...
        profit, weight, weight_max,...
        sel_no, mut_rate, elite_no, pen_mode, sel_mode, with_validate, meansol);
    stringval = ['Mean Scores with (Capacity Ratios) :', num2str(cap_rat)];
    plot(1:gen_max, scores, 'DisplayName', stringval)
end

legend('location', 'southeast')
hold off


pen_mode = 0;
% Imagine, examine, analyse - experiment...!
figure(4)
clf()
hold on
title(["Plot for score analysis: pen\_mode:", num2str(pen_mode)])
% title("Plot for score analysis")
xlabel("Generations")
ylabel("Score")
for cap_rat = 0.3:0.3:0.9
% for cap_rat = 1
    disp(cap_rat)
    weight_max = cap_rat*sum(weight);
    % Run the GA
    [scores] = ga_B(gen_max, pop_size,...
        profit, weight, weight_max,...
        sel_no, mut_rate, elite_no, pen_mode, sel_mode, with_validate, meansol);
    stringval = ['Mean Scores with (Capacity Ratios) :', num2str(cap_rat)];
    plot(1:gen_max, scores, 'DisplayName', stringval)
end

legend('location', 'southeast')
hold off

%% B3
clc
clear all

% GA Parameters
gen_max = 150; % 150 Max generations
pop_size = 50; % Population size of 50
sel_no = 25; % Selection of 20 individuals for mating, each generation
mut_rate = 0.02; % Mutation rate 0<mut_rate<1 where 0.02 = 2%
elite_no = 5; % Not used yet
pen_mode = 0; % Not used yet
sel_mode = 1; % Not used yet
cap_rat = 0.65;


seed = 0; % Use your student number
[profit, weight] = genDataset(seed);

with_validate = 0;
meansol = 2;
pen_mode = 0;

% Imagine, examine, analyse - experiment...!
figure(5)
clf()
hold on
title(["Plot for score analysis: rep\_mode:", num2str(sel_mode)])
% title("Plot for score analysis")
xlabel("Generations")
ylabel("Score")
for cap_rat = [0.2,0.8]
% for cap_rat = 1
    disp(cap_rat)
    weight_max = cap_rat*sum(weight);
    % Run the GA
    [scores] = ga_B(gen_max, pop_size,...
        profit, weight, weight_max,...
        sel_no, mut_rate, elite_no, pen_mode, sel_mode, with_validate, meansol);
    stringval = ['Mean Scores with (Capacity Ratios) :', num2str(cap_rat)];
    plot(1:gen_max, scores(:,2), 'DisplayName', stringval)
    stringval = ['Max weight with (Capacity Ratios) :', num2str(cap_rat)];
    plot(1:gen_max, scores(:,1), '--', 'DisplayName', stringval)
end

legend('location', 'southeast')
hold off

sel_mode = 2; % Not used yet
% Imagine, examine, analyse - experiment...!
figure(6)
clf()
hold on
title(["Plot for score analysis: rep\_mode:", num2str(sel_mode)])
% title("Plot for score analysis")
xlabel("Generations")
ylabel("Score")
for cap_rat = [0.2,0.8]
% for cap_rat = 1
    disp(cap_rat)
    weight_max = cap_rat*sum(weight);
    % Run the GA
    [scores] = ga_B(gen_max, pop_size,...
        profit, weight, weight_max,...
        sel_no, mut_rate, elite_no, pen_mode, sel_mode, with_validate, meansol);
    stringval = ['Mean Scores with (Capacity Ratios) :', num2str(cap_rat)];
    plot(1:gen_max, scores(:,2), 'DisplayName', stringval)
    stringval = ['Max weight with (Capacity Ratios) :', num2str(cap_rat)];
    plot(1:gen_max, scores(:,1), '--', 'DisplayName', stringval)
end

legend('location', 'southeast')
hold off
%% B4

clc
clear all
% GA Parameters
gen_max = 150; % 150 Max generations
pop_size = 50; % Population size of 50
sel_no = 25; % Selection of 20 individuals for mating, each generation
mut_rate = 0.02; % Mutation rate 0<mut_rate<1 where 0.02 = 2%
elite_no = 5; % Not used yet

seed = 0; % Use your student number
[profit, weight] = genDataset(seed);

with_validate = 0;
meansol = 0;
all_scores = [];
best_scores = [];
for cap_rat = [0.25, 0.5, 0.75]
    % Linear Penalty
    pen_mode = 1;
    sel_mode = 0; 
    disp(cap_rat)
    weight_max = cap_rat*sum(weight);
    % Run the GA
    [scores] = ga_B(gen_max, pop_size,...
        profit, weight, weight_max,...
        sel_no, mut_rate, elite_no, pen_mode, sel_mode, with_validate, meansol);
    best_scores = [best_scores ; max(scores)];
end
all_scores = [all_scores; best_scores' ];

best_scores = [];
for cap_rat = [0.25, 0.5, 0.75]
    % Quadratic Penalty
    pen_mode = 2;
    sel_mode = 0; 
    disp(cap_rat)
    weight_max = cap_rat*sum(weight);
    % Run the GA
    [scores] = ga_B(gen_max, pop_size,...
        profit, weight, weight_max,...
        sel_no, mut_rate, elite_no, pen_mode, sel_mode, with_validate, meansol);
    best_scores = [best_scores ; max(scores)];
end
all_scores = [all_scores; best_scores' ];

best_scores = [];
for cap_rat = [0.25, 0.5, 0.75]
    % Random Repair
    pen_mode = 0;
    sel_mode = 1; 
    disp(cap_rat)
    weight_max = cap_rat*sum(weight);
    % Run the GA
    [scores] = ga_B(gen_max, pop_size,...
        profit, weight, weight_max,...
        sel_no, mut_rate, elite_no, pen_mode, sel_mode, with_validate, meansol);
    best_scores = [best_scores ; max(scores)];
end
all_scores = [all_scores; best_scores' ];

best_scores = [];
for cap_rat = [0.25, 0.5, 0.75]
    % Least_value Repair
    pen_mode = 0;
    sel_mode = 2; 
    disp(cap_rat)
    weight_max = cap_rat*sum(weight);
    % Run the GA
    [scores] = ga_B(gen_max, pop_size,...
        profit, weight, weight_max,...
        sel_no, mut_rate, elite_no, pen_mode, sel_mode, with_validate, meansol);
    best_scores = [best_scores ; max(scores)];
end
all_scores = [all_scores; best_scores' ];
all_scores = all_scores./max(all_scores)*100;
