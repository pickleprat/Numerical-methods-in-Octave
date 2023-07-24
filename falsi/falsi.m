% Falsi method

%{
Author: Pratyush Rao.
Date  : 24/07/2023

The falsi method converges much faster than the bisection method
using the formula of updatation x = (a * f(b) - b * f(a))/(f(b) - f(a));
%}

function [root] = falsi(precision, output_file)
  % find a lower and upper limit
  inputs = [-1500:1500];
  outputs = mapper(inputs);

  L = inputs(outputs == max(outputs(outputs < 0))); % finding the biggest negative number
  U = inputs(outputs == min(outputs(outputs > 0))); % finding the smallest positive number

  delta = 1/10 .^ precision;
  mid = (L .* mapper(U) - U .* mapper(L)) ./ ( mapper(U) - mapper(L) );
  prev_mid = U;

  X = [ U L mid mapper(mid) ];

  while abs(mapper(mid)) > delta
    if mapper(mid) > 0
      U = mid;
    elseif mapper(mid < 0)
      L = mid;
    endif
    prev_mid = mid;
    mid = ( L .* mapper(U) - U .* mapper(L)) ./ (mapper(U) - mapper(L));
    obs = [ L U mid mapper(mid) ];
    X = [X; obs];
  endwhile
  root = mid;
  dlmwrite(output_file, X, ';');

endfunction
