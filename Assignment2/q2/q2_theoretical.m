%Author : Omkar Damle
%Date : 31st March 2017

%theoretical value for P(Mn>=r)

p_sum=0;                %required value
r=25;                   
n=100;

for m=-n:n
    if m<r
        p_sum = p_sum + endPoint(n,2*r-m);        
    else
        p_sum = p_sum + endPoint(n,m);
    end
end

p_sum