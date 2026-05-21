function simulate_birthday_problem(n_persons, n_trials)
    % n_persons: Number of persons
    % n_trials:  Number of trials

    coincidences = 0;
    
    for t = 1:n_trials
        % Generate random birthdays in the range 1 to 365 for each person
        birthdays = randi([1, 365], 1, n_persons);
        
        % Check if two coincide by checking if unique list is shorter than actual list
        if length(unique(birthdays)) < n_persons
            coincidences = coincidences + 1;
        end
    end
    
    % Calculate probabilities = numbers of coincidences / numbers of trials
    prob_sim = coincidences / n_trials;
    
    % Theoretical solution calculation
    p_not_shared = 1.0;
    for i = 0:(n_persons - 1)
        p_not_shared = p_not_shared * ((365 - i) / 365);
    end
    prob_theory = 1 - p_not_shared;
    
    % Display results
    fprintf('For a room of %d people over %d trials:\n', n_persons, n_trials);
    fprintf('Simulated Probability: %f\n', prob_sim);
    fprintf('Theoretical Probability: %f\n', prob_theory);
end

%{
simulate_birthday_problem(23, 10000)

For a room of 23 people over 10000 trials:
Simulated Probability: 0.499900
Theoretical Probability: 0.507297

simulate_birthday_problem(50, 10000)

For a room of 50 people over 10000 trials:
Simulated Probability: 0.969400
Theoretical Probability: 0.970374
%}