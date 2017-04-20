% Here we do the following computations;
% 1. Check state of P after 300 days.
% 2. Analytically deriving vector w
% 3. Verifying the properties of stationery vector
clear;
close all;

%       R    N     S
P_oz= [0.5  0.25  0.25; % R 
       0.5  0     0.5;  % N
       0.25 0.25  0.5]; % S


disp('P matrix of Land of Oz gets close to W just after 7 moves')
for i=1:7
    P_oz^i
end

disp('P after 300 moves')
P_oz_after_300 = P_oz^300 %  P^n tends to W. 

%% theoretically finding stationary vector
disp('coefficients of the equation wP=w')

% solving 4 equations 3 unknowns as given in Lauri-Snell book
coef_mat= [1     1    1; 
           -0.5  0.5  0.25 ; 
           0.25  -1   0.25; 
           0.25  0.5  -0.5];
w = pinv(coef_mat)*[1;0;0;0]; % analytical derivation of w stationary matrix.

theoretical_stationary_vector = w'

disp('Verifying wP = w')
theoretical_stationary_vector * P_oz % wP= w;

%% Let us define v vector as the starting distribution of state
% That is, initially the Markov chain will start in either of the 3 states
% with equal probability
v= [1/3 1/3 1/3];

disp('Verifying v*P^n tends to w')
v*(P_oz_after_300) % vP^n tends to w


%% to show any starting distribution eventually gives the same
% probability vector i.e. the final state probability is achieved
% irrespective of the starting state

disp('Verifying u*P^n tends to w')
u= [1 0 0]; % definitely start from R state
u*(P_oz_after_300)

u= [0 1 0]; % definitely start from N state
u*(P_oz_after_300)

u= [0 0 1]; % definitely start from S state
u*(P_oz_after_300)