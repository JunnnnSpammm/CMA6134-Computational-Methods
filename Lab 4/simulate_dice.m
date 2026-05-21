function simulate_dice(n)
    % n: Number of simulations

    % Generate random numbers between 1 and 6 for a 2 x n array, simulating 2 dices throw
    dice = randi([1, 6], 2, n);
    
    % Calculate the sums of the two arrays, which are numbers on two dice
    sums = dice(1, :) + dice(2, :);
    
    % Count how many of these sums are less than or equal to 4
    m = sum(sums <= 4);
    
    % Obtain simulated probability
    prob_sim = m / n;
    
    % Theoretical probability
    prob_theory = 6 / 36;
    
    % Display results
    fprintf('Simulated Probability (Sum <= 4): %f\n', prob_sim);
    fprintf('Theoretical Probability (Sum <= 4): %f\n', prob_theory);
end

%{
simulate_dice(100000)

Simulated Probability (Sum <= 4): 0.167270
Theoretical Probability (Sum <= 4): 0.166667
%}