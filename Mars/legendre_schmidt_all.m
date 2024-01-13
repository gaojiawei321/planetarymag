function [ P ] = legendre_schmidt_all( nmax , x )
%勒让德施密特分解：
%输入：nmax球谐展开阶数
% x=cos（theta）
%输出P：大小为（nmax+1，nmax+1）的矩阵里面装着勒让德函数在m，n取值时的值。
%推倒公式为： ;  sqrt( n^2 - m^2) * P(n,m,x) =x * (2*n-1) * P(n-1,m,x) -sqrt( (n+m-1)*(n-m-1) ) * P(n-2,m,x)
%先计算  ; P(n,m,x) = Cnm * (1-x^2)^(m/2) * d^m/dx^m P(n,x) 其中Cnm= sqrt( 2 * (n-m)! / (n+m)! )   
%边界条件p（0,0）=1；
P=zeros(nmax+1,nmax+1);
P(1,1)=1;
if nmax>0
    twoago=0;
    for i=1:nmax
        P(1,i+1)=(x*(2*i-1)*P(1,i)-(i-1)*twoago)/i;
        twoago=P(1,i);
    end
end
Cm=sqrt(2);
for m=1:nmax
    Cm=Cm/sqrt(2*m*(2*m-1));
    P(m+1,m+1)=(1-x^2)^(0.5*m)*Cm;
    for i=1:m-1
        P(m+1,m+1)=(2*i+1)*P(m+1,m+1);
    end
    if nmax>m
        twoago=0;
        for i=m+1:nmax
            P(m+1,i+1)=(x*(2*i-1)*P(m+1,i)-sqrt((i+m-1)*(i-m-1))*twoago)/sqrt((i*i-m*m));
            twoago=P(m+1,i);
        end
    end
end

end

