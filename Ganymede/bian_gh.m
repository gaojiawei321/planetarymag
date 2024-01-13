clear all;close all;clc

load g_jrm
load h_jrm

g=0;
h=0;

g(1,2)=-725.3;
g(2,2)=74.2;

h(2,2)=19.5;

g(3,3)=0;
h(3,3)=0;




save GanyPlag g
save GanyPlah h



