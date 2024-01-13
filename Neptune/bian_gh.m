clear all;close all;clc

load g_jrm.mat
load h_jrm.mat


g=0;
h=0;

load data1


nj=11;
g=zeros(nj,nj);
h=zeros(nj,nj);
gg=1;
for i=1:nj-1
    for j=0:i
       
        if j==0
            
        g(j+1,i+1)=data1(gg,3);
        g1(j+1,i+1)=data1(gg,4);
        
       gg=gg+1; 
      else
        g(j+1,i+1)=data1(gg,3);
        h(j+1,i+1)=data1(gg,4);

        g1(j+1,i+1)=data1(gg,5);
        h1(j+1,i+1)=data1(gg,6);


          gg=gg+1;       
        end
      
    end
    
end











%{
g(1,2)=11854.69;
g(2,2)=11507.23;
h(2,2)=-15811.90;
g(1,3)=-5877.08;
g(2,3)=-13084.90;
h(2,3)=5850.66;



%%

g1(1,2)=10335.72;
g1(2,2)=3558.89;
h1(2,2)=-9772.35;
g1(1,3)=8565.94;
g1(2,3)=-405.99;
h1(2,3)=11138.62;

%}

%%

g(16,16)=0;
h(16,16)=0;


save UraHolg g
save UraHolh h

save NeptHolg g1
save NeptHolh h1


