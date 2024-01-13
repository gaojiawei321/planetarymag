
clear all;close all;clc
%curstal field Bx at Martian surface (nT)'


wei=25.1/180*pi;
jing=109.7/180*pi;

%wei=4.5/180*pi;
%jing=135.62/180*pi;

rm=3393.5;
r=rm+00;

        [x,y,z] = sph2cart(jing,wei,r);
      
        Bping=mgao_r([x y z]','g_120_mm_qx_re2.5','h_120_mm_qx_re2.5');
        
   %     [Bping,ddBr,ddBt,ddBp]=gao_r_110([x y z]');
        
      [Bping,ddBr,ddBt,ddBp]=lang18_r([x y z]');
        
 Bping
 
% load ddBr
 
       dnBr= sum(ddBr);
       dnBt= sum(ddBt);
       dnBp= sum(ddBp);
       
       dnBh= sum((ddBt.^2+ddBp.^2).^0.5 );
       
       dnBhh= ((dnBt.^2+dnBp.^2).^0.5 );
       
       %%

      
      for i=1:length(dnBr)
          djBr(i)=sum(dnBr(1:i));
          djBt(i)=sum(dnBt(1:i));
          djBp(i)=sum(dnBp(1:i));
          
      end
      
       %{
      subplot(3,1,1)
       plot(djBr);
       xlabel('SH degree (truncate)')
       ylabel('nT')
       title('G120 model, Zhurong location, B_r')
       
             
       subplot(3,1,2)
       plot(djBt);
       xlabel('SH degree (truncate)')
       ylabel('nT')
       title('B_\theta')
       
       subplot(3,1,3)
       plot(djBp);
       xlabel('SH degree (truncate)')
       ylabel('nT')
       title('B_\phi')
       
      
pos=[0 0 15 20];
%colorbar

%set(gca,'FontSize',20)


set(gcf,'PaperPositionMode','manual','PaperUnits','centimeters',...
        'PaperPosition',pos,'units','centimeters','position',pos);


print('-dtiff ','-r600',[ '/Users/gaojiawei/Desktop/model/wave/','Trun_Zhurong_surface_g120.tiff'])
   
%}
       
   %%
   
     djBH= ( djBt.^2+djBp.^2 ).^0.5;
     djBT=( djBt.^2+djBp.^2+djBr.^2 ).^0.5;
          
   
         subplot(3,1,1)
       plot(djBr);
       xlabel('SH degree (truncate)')
       ylabel('nT')
       title('L134 model, InSight location, B_r')
       
             
       subplot(3,1,2)
       plot(djBH);
       xlabel('SH degree (truncate)')
       ylabel('nT')
       title('B_{horizontal}')
       
       subplot(3,1,3)
       plot(djBT);
       xlabel('SH degree (truncate)')
       ylabel('nT')
       title('B_{total}')
       
      
pos=[0 0 15 20];
%colorbar

%set(gca,'FontSize',20)


set(gcf,'PaperPositionMode','manual','PaperUnits','centimeters',...
        'PaperPosition',pos,'units','centimeters','position',pos);


print('-dtiff ','-r600',[ '/Users/gaojiawei/Desktop/model/wave/','Trun_InSight_Hori_L134.tiff'])
   
   a=1  
       
       %%
       
       
      % plot(dnBhh);
      % xlabel('SH degree')
       %ylabel('nT')
      % 
       
     %  title('Langlais 2019 model, Zhurong location, B_{horizontal}')       
     %  print('-dtiff ','-r600',[ '/Users/gaojiawei/Desktop/model/wave/','Wave_Zhurong_surface_l134_hori.tiff'])
    
       
       %%
       
       %{
       subplot(3,1,1)
       plot(dnBr);
       xlabel('SH degree')
       ylabel('nT')
       
       
       title('Langlais 2019 model, Zhurong location, B_r')
%       title('Langlais 2019 model, InSight location, B_r')
       
   %   title('G110 model, Zhurong location, B_r')
  %      title('G110 model, InSight location, B_r')
       
       
       subplot(3,1,2)
       plot(dnBt);
       xlabel('SH degree')
       ylabel('nT')
       title('B_\theta')
       
       subplot(3,1,3)
       plot(dnBp);
       xlabel('SH degree')
       ylabel('nT')
       title('B_\phi')
       
      
pos=[0 0 15 20];
%colorbar

%set(gca,'FontSize',20)


set(gcf,'PaperPositionMode','manual','PaperUnits','centimeters',...
        'PaperPosition',pos,'units','centimeters','position',pos);


%print('-dtiff ','-r600',[ '/Users/gaojiawei/Desktop/model/wave/','Wave_insight_surface_g110.tiff'])

%print('-dtiff ','-r600',[ '/Users/gaojiawei/Desktop/model/wave/','Wave_insight_surface_l134.tiff'])
    
print('-dtiff ','-r600',[ '/Users/gaojiawei/Desktop/model/wave/','Wave_Zhurong_surface_l134.tiff'])
    
%print('-dtiff ','-r600',[ '/Users/gaojiawei/Desktop/model/wave/','Wave_Zhurong_surface_g110.tiff'])
    

%print('-dtiff ','-r600',[ 'C:\Users\Dell\Desktop\','surface_x.tiff'])


%}


