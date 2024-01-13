clear all;close all;clc
%curstal field Bx at Martian surface (nT)'
jg=180;
wg=90;
jing=linspace(-pi,pi,jg);
wei=linspace(-pi/2,pi/2,wg);
rm=3393;
r=rm+0;
for i=1:jg-1
    for j=1:wg-1
       
        [x,y,z] = sph2cart(jing(i),wei(j),r);
      %  Bping(i,j,:)=mgao([x y z]','g_110_mm_q','h_110_mm_q');
     Bping(i,j,:)=lang18_r([x y z]');
        
    end
end
    bt=Bping(:,:,1);
    
    btz=bt';
    hb=[btz(:,90:179) btz(:,1:89)];
    
    x1=2:2:358;
    y1=-88:2:88;
    
    %%
pcolor(x1,y1,hb)
shading interp 
colormap jet
xlabel('longitude')
ylabel('latitude')
title('L134 model 100<N<134 curstal field Br at surface (nT)')
pos=[0 0 30 15];
colorbar

set(gca,'FontSize',20)


set(gcf,'PaperPositionMode','manual','PaperUnits','centimeters',...
        'PaperPosition',pos,'units','centimeters','position',pos);

    
    print('-dtiff ','-r600',[ '/Users/gaojiawei/Desktop/model/wave/L134n100_134.tiff'])

    
    
%print('-dtiff ','-r600',[ 'C:\Users\Dell\Desktop\','surface_x.tiff'])


