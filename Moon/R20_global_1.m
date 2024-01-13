clear all;close all;clc

rm=1737.4+30;

%rm=1736.0+0;

%rm=1738.1+0;
aj=0.5;
ej=0.5;
Az=0:aj:360;
%El=-90+ej:ej:90;
El=-90:ej:90;

az=Az/180*pi;
el=El/180*pi;

[AZ,EL]=meshgrid(az,el);

al=0;
h=rm+al*ones(length(el),length(az));

[lx,ly,lz] = sph2cart(AZ,EL,h);

Lx=reshape(lx,1,[]);
Ly=reshape(ly,1,[]);
Lz=reshape(lz,1,[]);

a=[Lx;Ly;Lz];

brtp=R20_r(a);

%brtp=gao_r_c(a);

%brtp=lang18_r(a);
%brtp=cain_r(a);



for i=1:3
  %  bx=reshape(bca(1,:),length(el),[]);
  %  by=reshape(bca(2,:),length(el),[]);
  %  bz=reshape(bca(3,:),length(el),[]);

    br=reshape(brtp(1,:),length(el),[]);
    bt=reshape(brtp(2,:),length(el),[]);
    bp=reshape(brtp(3,:),length(el),[]);
    
    
end

ball=(br.^2+bt.^2+bp.^2).^0.5;



%%     

k=1;
for i=1:721
    i
    for j=1:361
        
        d1(k,1)=Az(i);
        d1(k,2)=El(j);
       
        d1(k,3)=br(j,i);
        d1(k,4)=bt(j,i);
        d1(k,5)=bp(j,i);
        
        d1(k,6)=ball(j,i);
        k=k+1;
        
    end
end

dlmwrite('d1.txt',d1,'Delimiter',' ','precision','%.2f')


d1=



%%

fid = fopen( '/Users/gaojiawei/program/mars/crust/mars_crust_model/model_gao/Map_txt/G110_0km_Br.txt', 'wt' );

%Br=round(br,2)

%T = table(Br, 'VariableNames', { 'Br'} )
%writetable(T, 'MyFile.txt')


%writematrix(M, "M.txt");


fprintf(fid, 'G110 model Br (nT) at 0 km altitude  SH coefficients up to N=180   For each row (longitude 0.5:0.5:360)  data in latitude -90:0.5:90  \n')

%fprintf(fid, '\n')


c1=['%6.2f '];

cz=c1;

hh=360;
for i=1:hh
    
    cz=[cz,c1];
end

cz=[cz,' \n']


fprintf(fid, cz, br);

fclose(fid);


 %fprintf(fid, '%', br) %#ok<PRTCAL>
 
 %%
 
 
fid = fopen( '/Users/gaojiawei/program/mars/crust/mars_crust_model/model_gao/Map_txt/G110_0km_Bt.txt', 'wt' );

%Br=round(br,2)

%T = table(Br, 'VariableNames', { 'Br'} )
%writetable(T, 'MyFile.txt')


%writematrix(M, "M.txt");


fprintf(fid, 'G110 model Btheta (nT) at 0 km altitude  SH coefficients up to N=80   For each row (longitude 0.5:0.5:360)  data in latitude -90:0.5:90  \n')

%fprintf(fid, '\n')


c1=['%6.2f '];

cz=c1;

for i=1:hh
    
    cz=[cz,c1];
end

cz=[cz,' \n']


fprintf(fid, cz, bt);

fclose(fid);


%%

 
 
fid = fopen( '/Users/gaojiawei/program/mars/crust/mars_crust_model/model_gao/Map_txt/G110_0km_Bp.txt', 'wt' );

%Br=round(br,2)

%T = table(Br, 'VariableNames', { 'Br'} )
%writetable(T, 'MyFile.txt')


%writematrix(M, "M.txt");


fprintf(fid, 'G110 model Bphi (nT) at 0 km altitude  SH coefficients up to N=80   For each row (longitude 0.5:0.5:360)  data in latitude -90:0.5:90  \n')

%fprintf(fid, '\n')


c1=['%6.2f '];

cz=c1;

for i=1:hh
    
    cz=[cz,c1];
end

cz=[cz,' \n']


fprintf(fid, cz, bp);

fclose(fid);


 

