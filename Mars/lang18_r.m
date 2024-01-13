%function [ bpcsph,ddBr,ddBt,ddBp] = lang18_r( pc_xyz )
function [ bpcsph] = lang18_r( pc_xyz )

%CAIN �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
nmax=134;  
%nmax=50;  

%��гչ���Ľ�����������Ĭ��Ϊ90�������޸ĵĸ�С��

load('g_lang_18.mat','g')
load('h_lang_18.mat','h')

%g=g;
%h=h;
%������гϵ��
rplanet=3393.5;

sz=size(pc_xyz);
num=sz(2);  %������ݸ���

%g(:,52:101)=0;
%h(:,52:101)=0;

%g(:,102:135)=0;
%h(:,102:135)=0;

%g(:,1:51)=0;
%h(:,1:51)=0;


[pcp, pct, pcr]=cart2sph(pc_xyz(1,:),pc_xyz(2,:),pc_xyz(3,:));
pct=pi/2-pct; %��pc�ѿ�������ϵ�µ�λ��ת����������ϵ�µ�λ�ã�lon/lat/r��
% (���Ƚǣ���γ�Ƚǣ�����)��
bpcsph=zeros(num,3);

parfor i=1:num
    
    bpcsph(i,:)=sph_r(g,h,rplanet,pcr(i),pct(i),pcp(i));
 %     [ bpcsph(i,:),ddBr,ddBt,ddBp]=sph_r(g,h,rplanet,pcr(i),pct(i),pcp(i));
    

end

bpcsph=bpcsph';


end

