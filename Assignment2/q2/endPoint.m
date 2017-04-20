function p = endPoint( n,m )
%ENDPOINT Summary of this function goes here
%   returns the value of P(Sn=m)
    if m>n || m<-n
        p=0;
    elseif mod((n+m),2)==0
        k=(n+m)/2;
        p = nchoosek(n,k)/(power(2,n));
    else
        p=0;
    end
    
end

