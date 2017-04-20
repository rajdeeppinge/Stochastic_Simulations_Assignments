clear;
close all;

strk_p = 3;

u= 1.5; % u and d are multiples for inc,dec stock value
d= 0.8;
r= 0.25;

ite=1e6;
period_limit=5;
S_o=1; % init stock price 

% the risk neutral probs
p_quid= (1+r-d)/(u-d);
q_quid= (u-1-r)/(u-d);

V_arr=zeros(ite,1); % value of opt price[valid only if gain] 

for i=1:ite
    
    % for each ite, do sim upto period given
    S_curr= S_o; % init price
    
    for j=1:period_limit
        
        if (rand<=p_quid)
            S_curr= S_curr*u;
        else
            S_curr= S_curr*d;
        end
    end
    
    V_arr(i)= S_curr-strk_p;
    
    % price only if non negative
    if (V_arr(i)<0)
        V_arr(i)=0;
    end
end

% under the assunp that p and q are p_quid and q_quid, the gain from
% stock is equal to gain from bank.

V_o_estimated= (mean(V_arr))/((1+r)^period_limit) % SM- had raised to ite init