clear all;close all;clc

rm=3390;
Az=-170;
El=-30;
az=Az/180*pi;
el=El/180*pi;

h=0:1:600;

[lx,ly,lz] = sph2cart(az,el,h+rm);
a=[lx;ly;lz];
bpc=cain(a);
bar=arkani(a);
bpu=purucker(a)';
bla=langlais(a)';

bla18=lang18(a);


bpc_t=(bpc(1,:).^2+bpc(2,:).^2+bpc(3,:).^2).^0.5;
bar_t=(bar(1,:).^2+bar(2,:).^2+bar(3,:).^2).^0.5;
bpu_t=(bpu(1,:).^2+bpu(2,:).^2+bpu(3,:).^2).^0.5;
bla_t=(bla(1,:).^2+bla(2,:).^2+bla(3,:).^2).^0.5;


bla18_t=(bla18(1,:).^2+bla18(2,:).^2+bla18(3,:).^2).^0.5;



plot(bpc_t,h,'k');hold on;
plot(bar_t,h,'r');hold on;
plot(bpu_t,h,'g');hold on;
plot(bla_t,h,'b');hold on;
plot(bla18_t,h,'y');hold on;




legend('cain','arkani','purucker','langlais')

