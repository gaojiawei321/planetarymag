clear all;close all;clc


load mavenl2018

y=table2array(mavenl2018);


for i=1:length(y)
    
    
    g(y(i,1)+1,y(i,2)+1)=y(i,3);
    h(y(i,1)+1,y(i,2)+1)=y(i,4);


end

g=g';
h=h';

h(1,:)=0;


save g_lang_18 g
save h_lang_18 h
