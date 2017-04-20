function [curr_opt_price]= calc_price_at_level(level,nH,nT)

global level_limit; % init in main
global u;
global d;
global S_o;
global strk_p;
global p_quid;
global q_quid;
global r;

if level == level_limit
    %stock_price = nchoosek(nH+nT,nH)/(2^(nH+nT)); % this is probability 
    stock_price= (u^nH)*(d^nT)*S_o;
    curr_opt_price= stock_price- strk_p; 
    
    if curr_opt_price<=0
       curr_opt_price=0; 
    end
    
    return
end

 curr_opt_price= ( (p_quid*calc_price_at_level(level+1,nH+1,nT)) + (q_quid*calc_price_at_level(level+1,nH,nT+1)) )/(1+r); % add quids