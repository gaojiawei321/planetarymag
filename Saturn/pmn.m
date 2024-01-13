function [ P, dP ] = pmn(x,nj)
%PMN 此处显示有关此函数的摘要
%   此处显示详细说明
nj=nj+1;
R=zeros(nj,nj);
P=zeros(nj,nj);
dP=zeros(nj,nj);

P(1,1)=1;P(2,1)=cos(x);P(2,2)=sin(x);


for i=3:nj
    P(i,i)=((2*(i-1)-1)/(2*(i-1))).^0.5*sin(x)*P(i-1,i-1);
end
%Rnm=
for i=  1:nj-1
    
    
    for j=3:nj
        if j>i
        
        P(j,i)=((2*(j-1)-1)*cos(x)*P(j-1,i)-((j-2)^2-(i-1)^2).^0.5*P(j-2,i)) / ((j-1)^2-(i-1)^2).^0.5;
        end
    end
end
for i=1:nj
    for j=2:nj
      dP(j,i)=((j-1)*cos(x)*P(j,i)- ((j-1)^2-(i-1)^2).^0.5*P(j-1,i) )/sin(x);

    end
end

P=P';
dP=dP';

end

