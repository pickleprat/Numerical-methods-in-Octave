% Implementing the bisection method

%{

  Author: Pratyush
  Date  : 24/07/2023

  This function uses the mapper function described
  in the mapper function file and finds when the mapper
  function equals zero.

%}

function [root, steps] = bisector(precision, filepath, L, U)

  delta = 1/10^precision;
  mid = (L+U)/2; % setting a midpoint
  prev_mid = L; % setting a previous mid

  X = [ L U mid prev_mid mapper(mid)];  % creating a vector to view the values
  obs = X;
  steps = 0;
  while abs(mapper(mid) - mapper(prev_mid)) > delta
    if mapper(mid) > 0
      U = mid;
    elseif mapper(mid) < 0
      L = mid;
    endif
    steps = steps + 1; % updating the steps
    prev_mid = mid;
    mid = (U+L)/2; % updating the mid value
    X = [ L U mid prev_mid mapper(mid)];  % displaying the observations on the console
    obs = [ obs; X ]; % noting the observations in a file
 endwhile

 dlmwrite(filepath, obs, '\t'); % writing computations in code
 root = mid; % preserving the ouput in a variable
endfunction
