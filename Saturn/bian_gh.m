clear all;close all;clc

load g_jrm.mat
load h_jrm.mat


g=0;
h=0;

g(1,2)=21140.2;
g(1,3)=1581.1;
g(1,4)=2260.1;
g(1,5)=91.1;
g(1,6)=12.6;
g(1,6)=17.2;
g(1,7)=-59.6;
g(1,8)=-10.5;
g(1,9)=-12.9;
g(1,10)=16.0;
g(1,11)=18.2;
g(1,12)=-0.3;

%%

g(12,12)=0;
h(12,12)=0;


save Satdoug g
save Satdouh h



