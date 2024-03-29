clear all;close all;clc


load IGRF13g
load IGRF13h

a=6371*10^3;
r=6371*10^3;

  DM(1)=4*pi/(4*pi*10^-7)*a^3*((g(2,2)*10^-9).^2+(g(1,2)*10^-9).^2+(h(2,2)*10^-9).^2).^0.5
    

        
    for n=1:length(g)-1
        
        g2=(g).^2;
        h2=(h).^2;
        R1(n,1)=(n+1)* (a/r).^(2*n+4) *(sum(g2(:,n+1))+sum(h2(:,n+1)));
    end
    
    DP(1)=R1(1,1);
   % NDP(k)=sum(R1(2:end,k));
    ZP(1)=sum(R1(1:end,1));
   
    tD= acos( g(1,2)/(g(1,2)^2+g(2,2)^2+h(2,2)^2)^0.5 )  /pi*180
    
    
    DP/ZP