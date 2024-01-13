clear all; close all;clc



%%


figure

pos=[1 1 40 25];
%pos=[1 1 30 25];


set(gcf,'unit','centimeters','position',pos)

ha = tight_subplot(3,3,[.05 .03],[.03 .05],[.05 .05])


axes(ha(1))
ax1=gca;

aj=1;
ej=1;
Az=aj:aj:360;
El=-90+ej:ej:90;
az=Az/180*pi;
el=El/180*pi;

[AZ,EL]=meshgrid(az,el);

al=0;
rm=2440;
h=rm+al*ones(length(el),length(az));

[lx,ly,lz] = sph2cart(AZ,EL,h);

Lx=reshape(lx,1,[]);
Ly=reshape(ly,1,[]);
Lz=reshape(lz,1,[]);

a=[Lx;Ly;Lz];

brtp=mercury_ward_r(a);
  
for i=1:3

    br=reshape(brtp(1,:),length(el),[]);
    bt=reshape(brtp(2,:),length(el),[]);
    bp=reshape(brtp(3,:),length(el),[]);
    
    
end

ball=(br.^2+bt.^2+bp.^2).^0.5;


min(min(ball))
max(max(ball))

plot_model_1(Az,El,br,0)
%caxis([-800 400]);


title('Mercury','FontSize',15)

h1=-3.5;h2=1.5;
text(h1,h2,'(a)','FontSize',20)
%%

axes(ha(2))
ax1=gca;


al=0;
rm=6371;
h=rm+al*ones(length(el),length(az));

[lx,ly,lz] = sph2cart(AZ,EL,h);

Lx=reshape(lx,1,[]);
Ly=reshape(ly,1,[]);
Lz=reshape(lz,1,[]);

a=[Lx;Ly;Lz];

brtp=Earth_2020_r(a);

for i=1:3

    br=reshape(brtp(1,:),length(el),[]);
    bt=reshape(brtp(2,:),length(el),[]);
    bp=reshape(brtp(3,:),length(el),[]);
    
    
end

ball=(br.^2+bt.^2+bp.^2).^0.5;


min(min(ball))
max(max(ball))

plot_model_1(Az,El,br,0)
%caxis([-60000 60000]);

title('Earth','FontSize',15)
text(h1,h2,'(b)','FontSize',20)
%%

axes(ha(5))
ax1=gca;


al=0;
rm=71492*1;
h=rm+al*ones(length(el),length(az));

[lx,ly,lz] = sph2cart(AZ,EL,h);

Lx=reshape(lx,1,[]);
Ly=reshape(ly,1,[]);
Lz=reshape(lz,1,[]);

a=[Lx;Ly;Lz];

brtp=Jupiter_shi_r(a);

for i=1:3

    br=reshape(brtp(1,:),length(el),[]);
    bt=reshape(brtp(2,:),length(el),[]);
    bp=reshape(brtp(3,:),length(el),[]);
    
    
end

ball=(br.^2+bt.^2+bp.^2).^0.5;


min(min(ball))
max(max(ball))

plot_model_1(Az,El,br,0)

% caxis([-1500000 2000000]);

title('Jupiter','FontSize',15)
text(h1,h2,'(e)','FontSize',20)
%%
axes(ha(6))
ax1=gca;


al=0;
rm=2631.2*1;
h=rm+al*ones(length(el),length(az));

[lx,ly,lz] = sph2cart(AZ,EL,h);

Lx=reshape(lx,1,[]);
Ly=reshape(ly,1,[]);
Lz=reshape(lz,1,[]);

a=[Lx;Ly;Lz];

brtp=Gany_pla_r(a);

for i=1:3

    br=reshape(brtp(1,:),length(el),[]);
    bt=reshape(brtp(2,:),length(el),[]);
    bp=reshape(brtp(3,:),length(el),[]);
    
    
end

ball=(br.^2+bt.^2+bp.^2).^0.5;


min(min(ball))
max(max(ball))

plot_model_1(Az,El,br,0)

 caxis([-1500 1500]);

title('Ganymede','FontSize',15)
text(h1,h2,'(f)','FontSize',20)
%%


axes(ha(7))
ax1=gca;


al=0;
rm=60268*1;
h=rm+al*ones(length(el),length(az));

[lx,ly,lz] = sph2cart(AZ,EL,h);

Lx=reshape(lx,1,[]);
Ly=reshape(ly,1,[]);
Lz=reshape(lz,1,[]);

a=[Lx;Ly;Lz];

brtp=Saturn_dou_r(a);

for i=1:3

    br=reshape(brtp(1,:),length(el),[]);
    bt=reshape(brtp(2,:),length(el),[]);
    bp=reshape(brtp(3,:),length(el),[]);
    
    
end

ball=(br.^2+bt.^2+bp.^2).^0.5;


min(min(ball))
max(max(ball))

plot_model_1(Az,El,br,180)

 caxis([-50000 50000]);

title('Saturn','FontSize',15)
text(h1,h2,'(g)','FontSize',20)
%%


axes(ha(8))
ax1=gca;


al=0;
rm=25559*1;
h=rm+al*ones(length(el),length(az));

[lx,ly,lz] = sph2cart(AZ,EL,h);

Lx=reshape(lx,1,[]);
Ly=reshape(ly,1,[]);
Lz=reshape(lz,1,[]);

a=[Lx;Ly;Lz];

brtp=Ura_hol_r(a);

for i=1:3

    br=reshape(brtp(1,:),length(el),[]);
    bt=reshape(brtp(2,:),length(el),[]);
    bp=reshape(brtp(3,:),length(el),[]);
    
    
end

ball=(br.^2+bt.^2+bp.^2).^0.5;


min(min(ball))
max(max(ball))

plot_model_1(Az,El,br,0)

caxis([-120000 60000]);

title('Uranus','FontSize',15)
text(h1,h2,'(h)','FontSize',20)

%%

axes(ha(9))
ax1=gca;


al=0;
rm=24764*1;
h=rm+al*ones(length(el),length(az));

[lx,ly,lz] = sph2cart(AZ,EL,h);

Lx=reshape(lx,1,[]);
Ly=reshape(ly,1,[]);
Lz=reshape(lz,1,[]);

a=[Lx;Ly;Lz];

brtp=Nep_hol_r(a);

for i=1:3

    br=reshape(brtp(1,:),length(el),[]);
    bt=reshape(brtp(2,:),length(el),[]);
    bp=reshape(brtp(3,:),length(el),[]);
    
    
end

ball=(br.^2+bt.^2+bp.^2).^0.5;


min(min(ball))
max(max(ball))

plot_model_1(Az,El,br,0)

%caxis([-10000 10000]);

title('Neptune','FontSize',15)
text(h1,h2,'(i)','FontSize',20)

%%



%%
axes(ha(3))
ax1=gca;


al=0;
rm=1737.4;
h=rm+al*ones(length(el),length(az));

[lx,ly,lz] = sph2cart(AZ,EL,h);

Lx=reshape(lx,1,[]);
Ly=reshape(ly,1,[]);
Lz=reshape(lz,1,[]);

a=[Lx;Ly;Lz];

brtp=R20_r(a);

for i=1:3

    br=reshape(brtp(1,:),length(el),[]);
    bt=reshape(brtp(2,:),length(el),[]);
    bp=reshape(brtp(3,:),length(el),[]);
    
    
end

ball=(br.^2+bt.^2+bp.^2).^0.5;


min(min(ball))
max(max(ball))

plot_model_2(Az,El,br,0)

%caxis([-1000 1000]);
caxis([-15 15]);

title('Moon','FontSize',15)
text(h1,h2,'(c)','FontSize',20)

%%
axes(ha(4))
ax1=gca;


al=0;
rm=3393.5;
h=rm+al*ones(length(el),length(az));

[lx,ly,lz] = sph2cart(AZ,EL,h);

Lx=reshape(lx,1,[]);
Ly=reshape(ly,1,[]);
Lz=reshape(lz,1,[]);

a=[Lx;Ly;Lz];

brtp=lang18_r(a);

for i=1:3

    br=reshape(brtp(1,:),length(el),[]);
    bt=reshape(brtp(2,:),length(el),[]);
    bp=reshape(brtp(3,:),length(el),[]);
    
    
end

ball=(br.^2+bt.^2+bp.^2).^0.5;


min(min(ball))
max(max(ball))

plot_model_2(Az,El,br,0)

caxis([-1000 1000]);

title('Mars','FontSize',15)
text(h1,h2,'(d)','FontSize',20)

load mycolormap10
colormap(mycolormap10)

%%

print('-dtiff','-r300',['C:\Users\admin\Desktop\BaiduSyncdisk\program\planetary/Fig3.tiff']);

print('-depsc','-r300',['C:\Users\admin\Desktop\BaiduSyncdisk\program\planetary/Fig3.eps']);


