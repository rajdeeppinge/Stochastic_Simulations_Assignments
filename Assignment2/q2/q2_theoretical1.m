%Author : Omkar Damle
%Date : 31st March 2017

%theoretical value for P(Mn>=r)

p_sum=0;
r=25;
n=100;

p_sum = endPoint(n,r);


for m=r+1:100
    p_sum = p_sum + 2*endPoint(n,m);
end

p_sum