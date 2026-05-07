function I = simpsonRule(f, a, b, n)
    % f: function handle
    % a: lower limit
    % b: upper limit
    % n: number of intervals (must be even)

    if mod(n, 2) ~= 0
        error('n must be even');
    end

    h = (b - a) / n;
    x_coords = a:h:b;
    
    y_values = f(x_coords);
    
    sum_4 = sum(y_values(2:2:end-1));  
    sum_2 = sum(y_values(3:2:end-2)); 
    
    I = (h / 3) * (y_values(1) + 4*sum_4 + 2*sum_2 + y_values(end));
end

%{
f = @(x) cos(x); 
simpsonRule(f, 0, pi, 100)
    ans = -1.2324e-16

f = @(x) 2 ./ (1 + x.^2);
simpsonRule(f, 0, 1, 100)
    ans = 1.5708

f = @(x) exp(-x.^2); 
simpsonRule(f, 1, 2, 100)
    ans = 0.1353
%}