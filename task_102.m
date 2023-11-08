% Define the function for which you want to find the root.
function retval = f(x)
    retval = x^3 - 2x^2 + 3;
end

% Define the interval [a, b] where you want to search for a root.
a = 0;
b = 3;

% Set the tolerance for the root-finding process.
tolerance = 1e-6;

% Initialize a matrix to store roots
roots_matrix = [];

% Bisection method to find the root.
while (b - a) / 2 > tolerance
    c = (a + b) / 2;
    roots_matrix = [roots_matrix; a, b, c, f(a), f(b), f(c)];

    if f(c) == 0
        break;
    elseif f(a) * f(c) < 0
        b = c;
    else
        a = c;
    end
end

% Display the result.
fprintf('Approximate root: %f\n', c);

% Plot the function and the roots found during the iterations.
x_values = linspace(0, 3, 1000);
y_values = arrayfun(@f, x_values);

plot(x_values, y_values, 'b', 'LineWidth', 2);
hold on;

% Mark the roots found during the iterations.
scatter(roots_matrix(:, 3), zeros(size(roots_matrix, 1), 1), 'ro');

xlabel('x');
ylabel('f(x)');
title('Bisection Method for Root Finding');
legend('f(x)', 'Roots');
grid on;
hold off;
