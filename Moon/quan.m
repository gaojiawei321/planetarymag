clear all;close all;clc

rm=3393.5;

aj=1;
ej=1;
Az=1:aj:359;
El=-89:ej:89;
az=Az/180*pi;
el=El/180*pi;

[AZ,EL]=meshgrid(az,el);

h=0;

h=rm+1*ones(length(el),length(az));
%:1:600;

[lx,ly,lz] = sph2cart(AZ,EL,h);

Lx=reshape(lx,1,[]);
Ly=reshape(ly,1,[]);
Lz=reshape(lz,1,[]);

%reshape(Lx,13,[])

a=[Lx;Ly;Lz];



bca=m14(a);
%bca=cain(a);
%bca=gao(a);
%bar=arkani(a);
%bca=purucker(a)';
%bla=langlais(a)';


for i=1:3
    bx=reshape(bca(1,:),length(el),[]);
    by=reshape(bca(2,:),length(el),[]);
    bz=reshape(bca(3,:),length(el),[]);

    
end


pcolor(bx)

shading interp 

colormap jet
xlabel('east longitude')
ylabel('latitude')
title('0km bx (nT)')
pos=[0 0 30 15];
colorbar

set(gca,'FontSize',20)


set(gcf,'PaperPositionMode','manual','PaperUnits','centimeters',...
        'PaperPosition',pos,'units','centimeters','position',pos);

print('-dtiff ','-r600',[ 'C:\Users\gao\Desktop\','surface_x.tiff'])


%print('-depsc','-r600',[ '/Users/gaojiawei/Desktop/','surface_x.eps'])



