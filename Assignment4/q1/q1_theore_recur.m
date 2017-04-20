clear;
close all;

% define a recursive function to calcl there V price,
global level_limit;
global u;
global d;
global S_o; % init stock price
global strk_p; % strike price
global p_quid;
global q_quid;
global r;

level_limit=5;
strk_p = 3;

u= 1.5; % u and d are multiples for inc,dec stock value
d= 0.8;
r= 0.25;

S_o=1; % init stock price 

p_quid= (1+r-d)/(u-d);
q_quid= (u-1-r)/(u-d);

V_o=calc_price_at_level(0,0,0)