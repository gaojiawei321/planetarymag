clear all;close all;clc

rm=1737.4+30;

%rm=1736.0+0;

%rm=1738.1+0;

Az=00;
El=1;
az=Az/180*pi;
el=El/180*pi;

h=0:10:600;

[lx,ly,lz] = sph2cart(az,el,h+rm);
a=[lx;ly;lz];



R20=R20_r(a);


bla_t=(R20(1,:).^2+R20(2,:).^2+R20(3,:).^2).^0.5;

plot(bla_t,h,'b');hold on;

legend('R20')

