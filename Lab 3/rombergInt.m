function R = rombergInt(f, a, b, max_row)
    % f: function handle
    % a: lower limit
    % b: upper limit
    % max_row: number of rows to compute

    R = zeros(max_row, max_row);

    for n = 0:max_row-1
        num_segments = 2^n; 
        R(n+1, 1) = trapezoidalRule(f, a, b, num_segments);
    end

    for m = 1:max_row-1
        for n = m:max_row-1
            % Formula: R(n,m) = (4^m * R(n, m-1) - R(n-1, m-1)) / (4^m - 1)
            num = (4^m * R(n+1, m)) - R(n, m);
            den = 4^m - 1;
            R(n+1, m+1) = num / den;
        end
    end
end

%{
f = @(x) sin(x); 
rombergInt(f, 0, pi, 4)
ans =
   0.0000        0        0        0
   1.5708   2.0944        0        0
   1.8961   2.0046   1.9986        0
   1.9742   2.0003   2.0000   2.0000

f = @(x) 2 ./ (1 + x.^2);
rombergInt(f, 0, 1, 3)
ans =
   1.5000        0        0
   1.5500   1.5667        0
   1.5656   1.5708   1.5711

f = @(x) exp(-x.^2); 
rombergInt(f, 1, 2, 4)
ans =
   0.1931        0        0        0
   0.1492   0.1346        0        0
   0.1387   0.1352   0.1352        0
   0.1361   0.1353   0.1353   0.1353
%}