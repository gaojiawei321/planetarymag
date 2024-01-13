clear all;close all;clc

load model1
% save model1 model1
 
nj=11;
g=zeros(nj,nj);
h=zeros(nj,nj);
gg=2;
for i=1:nj-1
    for j=0:i
       
        if j==0
            
        g(j+1,i+1)=model1(gg,1);
       gg=gg+1; 
      else
        g(j+1,i+1)=model1(gg,1);
        h(j+1,i+1)=model1(gg,2);
          gg=gg+1;       
        end
      
    end
    
end


save g g
save h h