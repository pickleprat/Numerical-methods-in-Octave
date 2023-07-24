% mapper function

%{
Author: Pratyush Rao.
Date  : 24/07/2023

mapper function is the function that will be used in the falsi file
to find the roots of the function, i.e. x for x where f(x) = 0;
%}

function [output] = mapper(X)
  output = 4 .* exp(-X) .* sin(X) - 1; % define a function that will take the input
endfunction
