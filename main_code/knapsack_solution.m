% https://uk.mathworks.com/matlabcentral/fileexchange/22783-0-1-knapsack
function [opt_score, opt_sol] = knapsack_solution(profit, weight, weight_max)
    values = uint32(profit');
    weights = uint32(weight');
    W = uint32(weight_max);

%     if ~all(is_positive_integer(weights)) || ...
%        ~is_positive_integer(W)
%         error('Weights must be positive integers');
%     end
    %We work in one dimension
    [M N] = size(weights);
    weights = weights(:);
    values = values(:);
    if numel(weights) ~= numel(values)
        error('The size of weights must match the size of values');
    end
    if numel(W) > 1
        error('Only one constraint allowed');
    end  
    
    % Solve the problem
    
    % Note that A would ideally be indexed from A(0..N,0..W) but MATLAB 
    % does not allow this.
    A = zeros(length(weights)+1,W+1);
    % A(j+1,Y+1) means the value of the best knapsack with capacity Y using
    % the first j items.
    for j = 1:length(weights)
        if mod(j,50)==0
            fprintf('Working Optimal... %d \n', j)
        end
        for Y = 1:W
            if weights(j) > Y
                A(j+1,Y+1) = A(j,Y+1);
            else
                A(j+1,Y+1) = ...
                    max( A(j,Y+1), values(j) + A(j,Y-weights(j)+1));
            end
        end
    end
   best = A(end,end);
   
   %Now backtrack 
   amount = zeros(length(weights),1);
   a = best;
   j = length(weights); 
   Y = W;
   while a > 0
       while A(j+1,Y+1) == a
           j = j - 1;
       end
       j = j + 1; %This item has to be in the knapsack
       amount(j) = 1;
       Y = Y - weights(j);
       j = j - 1;
       a = A(j+1,Y+1);
   end
    
    amount = reshape(amount,M,N);
    
    opt_score = best;
    opt_sol = amount;
end

function yn = is_positive_integer(X)
    yn = X>0 & floor(X)==X;
end