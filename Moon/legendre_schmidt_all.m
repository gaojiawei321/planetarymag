function [ P ] = legendre_schmidt_all( nmax , x )
%���õ�ʩ���طֽ⣺
%���룺nmax��гչ������
% x=cos��theta��
%���P����СΪ��nmax+1��nmax+1���ľ�������װ�����õº�����m��nȡֵʱ��ֵ��
%�Ƶ���ʽΪ�� ;  sqrt( n^2 - m^2) * P(n,m,x) =x * (2*n-1) * P(n-1,m,x) -sqrt( (n+m-1)*(n-m-1) ) * P(n-2,m,x)
%�ȼ���  ; P(n,m,x) = Cnm * (1-x^2)^(m/2) * d^m/dx^m P(n,x) ����Cnm= sqrt( 2 * (n-m)! / (n+m)! )   
%�߽�����p��0,0��=1��
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

