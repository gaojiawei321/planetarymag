clear all;close all;clc
%curstal field Bx at Martian surface (nT)'
jg=180;
wg=90;
jing=linspace(-pi,pi,jg);
wei=linspace(-pi/2,pi/2,wg);
rm=3393.5;
r=rm+0;
for i=1:jg-1
    for j=1:wg-1
       
        [x,y,z] = sph2cart(jing(i),wei(j),r);
        %Bping(i,j,:)=mgao([x y z]','g_110_mm_q','h_110_mm_q');
        
        Bping(i,j,:)=lang18_r([x y z]');
        
        %Br Btheta Bphi
        
    end
end

%%
    bt=Bping(:,:,1);
    
   % bt=(Bping(:,:,2).^2+Bping(:,:,3).^2).^0.5;
    
    btz=bt';
    hb=[btz(:,90:179) btz(:,1:89)];
    
    x1=2:2:358;
    y1=-88:2:88;
pcolor(x1,y1,hb)
shading interp 
colormap jet

xlabel('Longitude (°)')
ylabel('Latitude (°)')
%title('Crustal field B_{horizontal} at 0 km altitude (nT)')

title('Crustal field B_{r} at 0 km altitude (nT)')

pos=[0 0 30 15];
colorbar



zwei=4.5;%/180*pi;
zjing=135.62;%/180*pi;

text(zjing,zwei,'*','FontSize',20,'color','white'); hold on;
%text(zjing-5,zwei+15,'Zhurong','FontSize',20,'color','white'); hold on;


 set(gca,'TickDir','out'); 
caxis([-200 200])

set(gca,'FontSize',20)


set(gcf,'PaperPositionMode','manual','PaperUnits','centimeters',...
        'PaperPosition',pos,'units','centimeters','position',pos);

%print('-dtiff ','-r600',[ 'C:\Users\Dell\Desktop\','surface_x.tiff'])
print('-dtiff ','-r300',[ '/Users/gaojiawei/Desktop/','map_l134_Br.tiff'])


