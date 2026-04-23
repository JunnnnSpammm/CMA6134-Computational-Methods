function p = newtonMethod(p0, tol)
% Newton's method for solving h(x)=0.
% Inputs: p0 (initial guess), tol (tolerance)

    err = tol + 1;
    n = 1; 
    
    % Store initial guess
    p(1) = p0;
    
    % The Newton's Method formula:
    % p_n = p_{n-1} - h(p_{n-1}) / h'(p_{n-1})
    
    while (err > tol)
        f_val = h(p(n));
        df_val = df(p(n));
        
        % Avoid division by zero
        if df_val == 0
            disp('Error: Derivative is zero. No solution found.');
            break;
        end
        
        % Calculate next approximation
        p(n+1) = p(n) - (f_val / df_val);
        
        % Calculate error
        err = abs(p(n+1) - p(n));
        
        % Safeguard to prevent infinite loops if it doesn't converge
        if n > 100
            disp('Warning: Maximum iterations reached.');
            break;
        end
        
        n = n + 1;
    end
    
    % Table Output
    fprintf('\n n      p(n-1)         p(n)          h(p_n-1)      e\n');
    for i = 1:(n-1)
        % Organizing data for the table
        current_err = abs(p(i+1) - p(i));
        row_data = [i; p(i); p(i+1); h(p(i)); current_err];
        
        fprintf('%2.0f %12.6f %12.6f %12.6f %12.6f\n', row_data);
    end
    
    % Final result
    p = p(end);
end