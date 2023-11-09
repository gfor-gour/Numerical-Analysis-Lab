function retval = task_103 (input1, input2)

% Define the function for which you want to find the root.
function y = f(x)
    y = x.^2 - 4;
end

% Define the interval [a, b] where you want to search for a root.
a = 0;
b = 3;

% Set the tolerance for the root-finding process.
t = 1e-6;

% Initialize a matrix to store roots
roots = [];
iterations = 0;

%False position method to find the root
while (b - a) / 2 > t
    c = (a*f(b) - b*f(a)) / (f(b) - f(a));
    roots = [roots; c];

    if f(c) == 0
        break;
    elseif f(a) * f(c) < 0
        b = c;
    else
        a = c;
    end

    iterations = iterations + 1;
end

% Display the result.
fprintf('%d iterations needed: %f\n', iterations, roots(end));

x = linspace(0, 3, 100);
y = f(x);

figure;
plot(x, y);
hold on;
plot(roots, f(roots), 'ro');
xlabel('x');
ylabel('function value');
title('False-Position Method ');
legend('function falues', 'Roots');
grid on;


endfunction
