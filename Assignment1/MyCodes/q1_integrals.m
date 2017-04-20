% Code to approximate integrals

% Author: Rajdeep Pinge
% Date: 18-02-2017

clear;
close all;

x = [0:1:Inf];

fun = @(x) (1-x*x).^(3/2);

q = integral(fun,0,Inf)