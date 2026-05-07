function output = trapezoidalRule(f, a, b, n)
    % f: function handle
    % a: lower limit
    % b: upper limit
    % n: number of intervals

    h = (b - a) / n;
    x = a : h : b;

    weights = [1, 2 * ones(1, n - 1), 1];
    
    I = (h / 2) * sum(weights .* f(x));
    
    output = I;
end

%{
f = @(x) sin(x); 
trapezoidalRule(f, 0, pi, 4)
    ans = 1.8961
trapezoidalRule(f, 0, pi, 100)
    ans = 1.9998
trapezoidalRule(f, 0, pi, 1000)
    ans = 2.0000

f = @(x) 2 ./ (1 + x.^2);
trapezoidalRule(f, 0, 1, 4)
    ans = 1.5656
trapezoidalRule(f, 0, 1, 100)
    ans = 1.5708
trapezoidalRule(f, 0, 1, 1000)
    ans = 1.5708

f = @(x) exp(-x.^2); 
trapezoidalRule(f, 1, 2, 4)
    ans = 0.1387
trapezoidalRule(f, 1, 2, 100)
    ans = 0.1353
trapezoidalRule(f, 1, 2, 1000)
    ans = 0.1353
%}