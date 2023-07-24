% Mapper file

%{
Author: Pratyush
Date  : 17/07/2023

this mapper file contains the mapper function
that will be used in the bisector file for identifying
when this function will take the value 0

%}

function [eval] = mapper(X)
  %{
     define your custom function and store
     the function output in the eval variable
  %}
  eval = 4 .* exp(-X) .* sin(X) - 1;
endfunction

