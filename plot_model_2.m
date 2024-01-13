function  plot_model_2(u1,u2,RC,dc)
%PLOT_MODEL_1 Summary of this function goes here
%   Detailed explanation goes here


%L1=500;

%ax2=axesm  ;
%pcolorm(az,el,br)

axesm mollweid; 
framem;
gridm;
axis off

aj=1;
geoidrefvec=[1/aj,90,180];  
B=geoshow(RC, geoidrefvec, 'DisplayType', 'texturemap'); hold on;

%colormap(ax2,mycolormap6)

%caxis([-L1 L1]);


hcb = contourcbar('horiz');

set(hcb,'FontSize',12);
set(get(hcb,'Xlabel'),'String','Surface magnetic field (nT)','interpreter','LaTeX');
set(get(hcb, 'Xlabel'),'FontSize',12,'FontWeight','bold');
set(hcb, 'TickLabelInterpreter', 'Latex');


end

