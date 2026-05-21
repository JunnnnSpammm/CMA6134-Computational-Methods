function estimate_pi(n)
    % n: Number of points

    % Generate random x and y coordinates between -1 and 1
    x = -1 + 2 * rand(1, n);
    y = -1 + 2 * rand(1, n);
    
    % Check if points fall inside the unit circle (x^2 + y^2 <= 1)
    inside_circle = (x.^2 + y.^2) <= 1;
    m = sum(inside_circle);
    
    % Approximate pi
    pi_appx = 4 * m / n;
    
    % Display results
    fprintf('Estimated Pi (%d points): %f\n', n, pi_appx);
    fprintf('Theoretical Pi: %f\n', pi);
end

%{
estimate_pi(100000)

Estimated Pi (100000 points): 3.150480
Theoretical Pi: 3.141593
%}