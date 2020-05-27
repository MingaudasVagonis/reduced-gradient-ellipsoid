syms a b c s;
vars = [a b c];

% Objective function
f3 = -(4/3 * 3.14 * a * b * c) / 2;

% Constrint function
g3 = (4 * 3.14 * (( a^1.6 * b^1.6 + c^1.6 * b^1.6 + c^1.6 * a^1.6 )/3)^(1/1.6)) / 2  - 100;

% Starting point
x = [2 3 4];

[x, opt, iter] = reducedDescent(f3, g3, x, 1)

%% Reduced descent
function [x, opt, iter] = reducedDescent(f, g, x, nplot)
    %% Functions
    % Objective & constraint functions
    ff = matlabFunction(f);
    gf = matlabFunction(g);
    
    % Objective & constraint functions' gradient functions
    dg = matlabFunction(gradient(g));
    df = matlabFunction(gradient(f));

    %% Parameters
    tol = 0.01;

    alpha = 0.1;

    maxiter = 100;
    
    if nplot; points = [double(ff(x(1), x(2), x(3)))]; end

    for iter=1:maxiter
        %% Gradient values
        % Objective function's gradient value at x
        gradf = df(x(1), x(2), x(3));
        % Constraint function's gradient value at x
        gradg = dg(x(1), x(2), x(3));

        %% Reduced gradient
        % gradf(1:2), gradf(3) - basic and non-basic variables' objective function's gradient values respectively
        % gradf(1:2), gradf(3) - basic and non-basic variables' constraint function's gradient values respectively

        red = gradf(1:2) - gradf(3) * (gradg(3)^-1 * gradg(1:2));
        
        if all(abs(red) <= tol); break; end

        %% New X
        % Basic variables are changed according to the negative reduced gradient

        xnew = x(1:2) + alpha .* (-red)';

        % Non-basic variable's value is determined by solving contraint
        % equation using the Newton method.

        x = double(findThirdNewton(xnew, x(3), tol, gf, dg));

        if all(abs(dg(x(1), x(2), x(3))) <= tol); break; end
        
        if nplot; points = [points double(ff(x(1), x(2), x(3)))]; end

    end
    if nplot; plot(1:iter, points); end
    opt = double(ff(x(1), x(2), x(3)));
end
%% Newton method
function x = findThirdNewton(x, xl, tol, gf, gdf)
    x_old = 1000;
    while abs(x_old - xl) > tol && xl ~=0
        x_old = xl;
        % new x = g(x) / d'(x). d'(x) is found by normalizing partial
        % derivatives
        xl = xl -  gf(x(1), x(2), xl) / norm( gdf(x(1), x(2), xl) ) ;
    end
    x = [x xl];
end
