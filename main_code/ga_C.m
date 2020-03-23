% FIRST FUNCTION NAME MATCHES THE FILE NAME
% [return variables...]         (argument variables...)
function [scores] = ga_C (gen_max, pop_size,...
    profit, weight, weight_max,...
    sel_no, mut_rate, elite_no, pen_mode, sel_mode, with_validate, mean_sol, score_stop)

    % INITIALISE POPULATION here
    pop_ITL = initialise_pop(pop_size, weight);
    scores = [];

    for gen = 1:gen_max
        weight = repair_mechanism(profit, weight, sel_mode);
        
        % FITNESS CALCULATE here
        pop_score = calc_fitness(pop_ITL, profit);
        
        % VALIDITY CHECK here
        if with_validate == 1
            pop_score = validate(pop_ITL, pop_score, weight, weight_max);
        end
        
        % RECORDS 
        if mean_sol == 1
            best_score = mean(pop_score);
            scores = [scores; best_score];
        elseif mean_sol == 2
            mean_score = mean(pop_score);
            best_score = max(pop_score);
            scores = [scores; [best_score, mean_score]];
        else
            best_score = max(pop_score);
            scores = [scores; best_score];
        end
        
        if max(scores(:,1)) >= score_stop
            break
        end

        % Penanlty here
        if pen_mode ~= 0
            pen_score = penalty_function(profit, pop_ITL, weight, weight_max, pen_mode);
            pop_score = pop_score - pen_score;
        end
        
        % SELECTION here
        [max_pop_SEL, max_score, pop_SEL, pop_score] = elite_selection(pop_ITL, pop_score, elite_no);
        [pop_SEL] = calc_selection(pop_SEL, pop_score, sel_no-elite_no);
%         pop_SEL = [max_pop_SEL ; pop_SEL];

        % CROSSOVER here
        if size(pop_SEL, 1) ~= 0
            [pop_XVR] = calc_crossover(pop_SEL, sel_no);
            % MUTATION here
            [pop_ITL] = calc_mutation_01(pop_XVR, mut_rate);
            pop_ITL = [max_pop_SEL ; pop_ITL];
        else
            pop_ITL = max_pop_SEL;
        end
        
    end
end

function [new_weights] = repair_mechanism(profit, weight, sel_mode)
new_weights = weight;
if sel_mode == 2
    [~, j] = min(profit/weight);
    new_weights(j) = 0;
end
if sel_mode == 1
    j = randi(length(weight));
    new_weights(j) = 0;
end
end

function [V] = penalty_function(profit, pop, weight, weight_max, pen_mode)
    T = sum(weight);
    Q = min([weight_max, abs(T-weight_max)]);
    S = pop*profit;
    Y = pop * weight;
    D = weight_max -Y;
    V = (S.*(D).^pen_mode/Q);
end

% ADD OTHER FUNCTIONS TO BE CALLED FROM THE ga_TEMPLATE FUNCTION HERE...
% Return random intialised population matrix [m-individuals x n-genes]
function [pop_ITL] = initialise_pop(pop_size, weight)
    item_n = size(weight,1);
    pop_ITL = logical(randi([0,1], pop_size, item_n,1));
end

% Calculate the population score
% Returns score vector of [m-individuals x 1]
function [pop_score] = calc_fitness(pop, profit)
    pop_score = pop*profit;

end

function [valid_pop_score] = validate(pop, pop_score, weight, weight_max)
    pop_weights = pop*weight;
    % VALIDITY OF POP
    valid_pop_score = pop_score.* (pop_weights < weight_max);
end

%% Elite selection:
function [max_pop_SEL, max_score, pop_SEL, pop_score] = elite_selection(pop, pop_score, elite_no)
[max_pops, i] = maxk(pop_score, elite_no);
max_pop_SEL = pop(i, :);
max_score = max_pops;

[sorted_pop_score, i]= sort(pop_score);
pop_SEL = pop(i(1:(length(pop_score)-elite_no)),:);
pop_score = sorted_pop_score(1:(length(pop_score)-elite_no));
end

% Select <sel_no> from the population
% Returns population matrix [sel_no-individuals x n-genes]
function [pop_SEL] = calc_selection(pop, pop_eval, sel_no)
    pop_SEL = [];
    while size(pop_SEL,1)<sel_no
        offset = min(pop_eval);
        wheel = cumsum(pop_eval-offset);
        wheel_range = max(wheel) - min(wheel);
        spin = rand()*max(wheel);
        win_idx = find(wheel>=spin, 1);
        new_ind = pop(win_idx, :);
        pop(win_idx, :) = [];
        pop_eval(win_idx, :) = [];
        pop_SEL = [pop_SEL; new_ind];
    end
end

% Perform crossover operation to make new population of <pop_size>
% Returns population matrix [pop_size-individuals x n-genes]
function [pop_XVR] = calc_crossover(pop, pop_size)
    pop_XVR = [];
    xvr_n = size(pop,2);
    pool_n = size(pop,1);
    while size(pop_XVR,1)<pop_size
        xvr = randi(xvr_n,2,1);
        dad = randi(pool_n);
        mum = randi(pool_n);
        while mum==dad
            mum = randi(pool_n);
        end
        ia = min(xvr);
        ib = max(xvr);
        kid = pop(dad, :);
        kid(ia:ib) = pop(mum, ia:ib);
        pop_XVR = [pop_XVR; kid];
    end
end

% Mutate the population with a probability specified between 0,1
% Returns mutated population matrix (same size as input)
function [pop_MUT] = calc_mutation_01(pop, mut_rate)
    pop_MUT = pop;
    rads = rand(size(pop_MUT));
    hits = rads<mut_rate;
    pop_MUT(hits) = ~pop_MUT(hits);
end