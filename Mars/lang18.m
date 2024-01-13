function [ bpc_xyz,ddBr,ddBt,ddBp] = lang18( pc_xyz )
%CAIN �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
nmax=134;     
%��гչ���Ľ�����������Ĭ��Ϊ90�������޸ĵĸ�С��

load g_lang_18.mat
load h_lang_18.mat

g=g;
h=h;
%������гϵ��
rplanet=3393.5;

sz=size(pc_xyz);
num=sz(2);  %������ݸ���

[pcp, pct, pcr]=cart2sph(pc_xyz(1,:),pc_xyz(2,:),pc_xyz(3,:));
pct=pi/2-pct; %��pc�ѿ�������ϵ�µ�λ��ת����������ϵ�µ�λ�ã�lon/lat/r��
% (���Ƚǣ���γ�Ƚǣ�����)��
bpcsph=zeros(num,3);
parfor i=1:num
  
    %[ bpcsph(i,:),ddBr,ddBt,ddBp]=sph_r(g,h,rplanet,pcr(i),pct(i),pcp(i));
  [ bpcsph(i,:)]=sph_r(g,h,rplanet,pcr(i),pct(i),pcp(i));
  
end

bpc_xyz=datas2c(bpcsph(:,1),bpcsph(:,2),bpcsph(:,3),pct,pcp);


%�������������ϵ��ת��Ϊֱ������ϵ�¡�
%bt=(bpc_xyz(1,:).^2+bpc_xyz(2,:).^2+bpc_xyz(3,:).^2).^0.5;

end

