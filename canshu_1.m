clear all;close all;clc


%load IGRF13g
%load IGRF13h
%load R20.mat
%load g_lang_18.mat
%load h_lang_18.mat
%load JupShig.mat
%load JupShih.mat
%load GanyPlag.mat
%load GanyPlah.mat
%load Satdoug.mat
%load Satdouh.mat
%load UraHolg.mat
%load UraHolh.mat
load NeptHolg.mat
load NeptHolh.mat
g=g1;
h=h1;


%a=6371*10^3;
%a=1737.4*10^3;
%a=3393.5*10^3;
%a=71492*10^3;
%a=2631.2*10^3;
%a=60268*10^3;
%a=25559*10^3;
a=24764*10^3;


r=a;

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