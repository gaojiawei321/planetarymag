function [ bpcsph ] = R20_r( pc_xyz )
%CAIN �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%nmax=90;     
%��гչ���Ľ�����������Ĭ��Ϊ90�������޸ĵĸ�С��

%load g.mat
%load h.mat

load('R20.mat','g','h')

%g=gc;
%h=hc;
%������гϵ��
rplanet=1737.4;

sz=size(pc_xyz);
num=sz(2);  %������ݸ���
%if nmax~=90;
%    g=g(1:nmax+1,1:nmax+1);
%    h=h(1:nmax+1,1:nmax+1);
%end
[pcp, pct, pcr]=cart2sph(pc_xyz(1,:),pc_xyz(2,:),pc_xyz(3,:));
pct=pi/2-pct; %��pc�ѿ�������ϵ�µ�λ��ת����������ϵ�µ�λ�ã�lon/lat/r��
% (���Ƚǣ���γ�Ƚǣ�����)��
bpcsph=zeros(num,3);
parfor i=1:num
 bpcsph(i,:)=sph_r(g,h,rplanet,pcr(i),pct(i),pcp(i));
    
end

bpc_xyz=datas2c(bpcsph(:,1),bpcsph(:,2),bpcsph(:,3),pct,pcp);
%�������������ϵ��ת��Ϊֱ������ϵ�¡�
%bt=(bpc_xyz(1,:).^2+bpc_xyz(2,:).^2+bpc_xyz(3,:).^2).^0.5;

bpcsph=bpcsph';
end

