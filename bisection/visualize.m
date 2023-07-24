% visualize the data collected and stored in ouput.txt

%{
Author: Pratyush
Date  : 17/07/2023

this file helps you visualize the fluctuations
of the midpoints and the value the function takes
with the number of steps

%}

data = dlmread('output.txt', '\t'); % read the data
step = size(data)(1); % read the count of steps
steps = [1:step]; % the number of steps

figure;
subplot(2, 1, 1);
plot(steps, data(:, 4), 'k--s', 'LineWidth', 0.9, 'MarkerFaceColor', 'b');
xlabel('step number');
ylabel('Leap');
title('Step size');
grid;

subplot(2, 1, 2);
plot(steps, data(:, 5), 'k--o', 'LineWidth', 0.9, 'MarkerFaceColor', 'r');
xlabel('step number');
ylabel('function value');
title('Function Changes');
grid;










