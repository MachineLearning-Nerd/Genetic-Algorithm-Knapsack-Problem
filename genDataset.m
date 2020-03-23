function [profit, weight] = genDataset(seed)
    rng(seed)
    % Generate weights
    weight = randi([1,1000*5], 500, 1);
    % Generate profits : Weakly correlated - real world similarity
    profit = zeros(500,1);
    for i = 1:500
        while profit(i) <= 0
            profit(i) = weight(i) + randi([-500*5,500*10]);
        end
    end
    rng('shuffle')
end