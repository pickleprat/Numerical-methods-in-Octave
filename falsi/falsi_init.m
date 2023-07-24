% Falsi method

%{
Author: Pratyush Rao.
Date  : 24/07/2023

The falsi method converges much faster than the bisection method
using the formula of updatation x = (a * f(b) - b * f(a))/(f(b) - f(a))
given two inputs U and L which correspond to b and a respectively
%}

function [root] = falsi_init(precision, output_file, L, U)

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
