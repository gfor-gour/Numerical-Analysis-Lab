A = input('Enter matrix A:');
B = input('Enter matrix B:');

% Checking if A and B are Multiplicable or not
if size(A, 2) == size(B, 1)
  %size of column = size of row
    G = A * B;
    fprintf('Matrix A * B:\n',G);

else
    fprintf('A and B are not multiplicable as column %d and row %d are not equal\n', size(A, 2), size(B, 1));
end

% maximum value of matrix A
max_value_A = max(max(A));
fprintf('Maximum value of matrix A: %f\n', max_value_A);
