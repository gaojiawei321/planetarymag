clear all;close all;clc
%curstal field Bx at mercury surface (nT)'
jg=180;
wg=90;
jing=linspace(-pi,pi,jg);
wei=linspace(-pi/2,pi/2,wg);
rm=2440;
r=rm+00;
for i=1:jg-1
    for j=1:wg-1
       
        [x,y,z] = sph2cart(jing(i),wei(j),r);
        Bping(i,j,:)=mercury_ward_r([x y z]');
        
        
    end
end

Btot=(Bping(:,:,1).^2+Bping(:,:,2).^2+Bping(:,:,3).^2).^0.5;

min(min(Btot))
max(max(Btot))



    bt=Bping(:,:,1);
    
    btz=bt';
    hb=[btz(:,90:179) btz(:,1:89)];
    
    x1=2:2:358;
    y1=-88:2:88;
pcolor(x1,y1,hb)
shading interp 
colormap jet
xlabel('longitude')
ylabel('latitude')
title(' Br at  surface (nT)')
pos=[0 0 30 15];
colorbar

set(gca,'FontSize',20)


set(gcf,'PaperPositionMode','manual','PaperUnits','centimeters',...
        'PaperPosition',pos,'units','centimeters','position',pos);



