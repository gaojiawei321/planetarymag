function  plot_model_1(u1,u2,RC,dc)
%PLOT_MODEL_1 Summary of this function goes here
%   Detailed explanation goes here

axesm mollweid ;

axis off

%axesm apianus;
load coast
framem; 
gridm

%getm(gca,'FLineWidth')
%setm(gca,'FLineWidth',4)

%    max_cut=15;

%zd=find(RC>max_cut);
%RC(zd)=max_cut;

[X,Y] = meshgrid(u1-dc,u2(1:end));

%contourfm(u2,u1,RC(:,1:end));
contourfm(Y,X,RC(:,1:end));


%contourfm(u2,u1,RC(:,1:end))


%caxis([-800 400]);

% colormap jet
hcb = contourcbar('horiz');

set(hcb,'FontSize',12);
set(get(hcb,'Xlabel'),'String','Surface magnetic field (nT)','interpreter','LaTeX');
set(get(hcb, 'Xlabel'),'FontSize',12,'FontWeight','bold');
set(hcb, 'TickLabelInterpreter', 'Latex');


end

