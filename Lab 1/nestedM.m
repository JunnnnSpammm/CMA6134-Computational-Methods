function y = nestedM(c, x)
% c: vector of coefficients [an, an-1, ..., a1, a0]
% x: the value at which to evaluate the polynomial

    n = length(c);
    y = c(1);
    
    for i = 2:n
        y = y * x + c(i);
    end
end

%{
nestedM([2, -4, 3, 1], 2)
ans = 7

nestedM([3, -2, 15, 13, -12, -5], 2)
ans = 207
%}