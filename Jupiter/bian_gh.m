clear all;close all;clc

load Jupiterfieldmodel16802.mat
% save model1 model1
 j1=Jupiterfieldmodel16802;

 
nj=16;
g=zeros(nj,nj);
h=zeros(nj,nj);
gg=1;
for i=1:nj-1
    for j=0:i
       
        if j==0
            
        g(j+1,i+1)=j1(gg,3);
       gg=gg+1; 
      else
        g(j+1,i+1)=j1(gg,3);
        h(j+1,i+1)=j1(gg,4);
          gg=gg+1;       
        end
      
    end
    
end


save JupShig g
save JupShih h