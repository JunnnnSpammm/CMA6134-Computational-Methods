function monte_carlo_integral(a, b, n)
    % a: Lower limit
    % b: Upper limit
    % n: Number of points
    
    % Pick n randomly distributed points in the interval
    x = a + (b - a) * rand(1, n);
    
    % Compute the summation of f(x)
    f_x = exp(-x);
    
    % Determine the average value of the function
    f_bar = sum(f_x) / n;
    
    % Determine the value of the integration
    integral_appx = (b - a) * f_bar;
    
    % Exact analytical solution for comparison
    exact_integral = 1 - exp(-5);
    
    % Display results
    fprintf('Estimated Integral: %f\n', integral_appx);
    fprintf('Theoretical Integral: %f\n', exact_integral);
end

%{
monte_carlo_integral(0, 5, 100000)

Estimated Integral: 0.982578
Theoretical Integral: 0.993262
%}