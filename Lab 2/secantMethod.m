function p = secantMethod(p0, p1, tol)
% Secant method for solving the nonlinear equation g(x)=0.
% Inputs: p0, p1 (initial guesses), tol (tolerance)

    err = tol + 1;
    n = 1; 
    
    % Store initial guesses
    p(1) = p0;
    p(2) = p1;
    
    % The Secant Method formula:
    % p_n = p_{n-1} - g(p_{n-1}) * (p_{n-1} - p_{n-2}) / (g(p_{n-1}) - g(p_{n-2}))
    
    while (err > tol)
        n = n + 1;
        
        % Calculate the next approximation
        f_p_prev = g(p(n));
        f_p_prev2 = g(p(n-1));
        
        % Avoid division by zero
        if (f_p_prev - f_p_prev2) == 0
            disp('Error: Division by zero');
            break;
        end
        
        p(n+1) = p(n) - (f_p_prev * (p(n) - p(n-1))) / (f_p_prev - f_p_prev2);
        
        % Calculate error
        err = abs(p(n+1) - p(n));
    end
    
    % Table Output
    disp(' n        p(n-1)       p(n)         p(n+1)       g(p_n)       e');
    for i = 2:n
        % Organizing data for the table
        current_err = abs(p(i+1) - p(i));
        row_data = [i-1; p(i-1); p(i); p(i+1); g(p(i)); current_err];
        
        fprintf('%2.0f %12.6f %12.6f %12.6f %12.6f %12.6f\n', row_data);
    end
    
    % Final result
    p = p(end);
end