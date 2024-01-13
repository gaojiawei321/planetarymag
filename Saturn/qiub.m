function [ B ] = qiub( g, h, a_over_r, sct, scp )
%SPH_B 为计算给定坐标的球坐标系下的磁场强度。使用球谐展开中的球谐模型。
%输入变量： g h为球谐参数。
%a_over_r为球谐展开中的a/r，卫星到火星中心的距离/火星半径
%sct，scp为余纬度和经度，弧度制。
%输出为球坐标系下磁场三分量B= [Br, Bt, Bp]
a=size(g);
nmax=a(2)-1;%获得球谐展开阶数
cntarr=0:1:nmax;
%计算每一个n对应的R（r）与dR（r）
%R(r) = [a/r]^(n+1)
%dR(r) = (n+1)*[a/r]^(n+1)
R = (a_over_r).^(cntarr+1);
dR = R.*(cntarr+1);
%计算在每一个m，n组合中Phi(phi) and dPhi(phi)的大小 
%Phi(phi) = gnm * cos(m*phi) + hnm * sin(m*phi)
%dPhi(phi) = m * [-gnm * sin(m*phi) + hnm * cos(m*phi)]
cos_m_phi = cos( cntarr * scp );
sin_m_phi = sin( cntarr * scp );
Phi  = g*0;  %建立空矩阵
dPhi = Phi;
for n=1:nmax
     Phi(:,n+1)  = cos_m_phi .* g(:,n+1)' + sin_m_phi .* h(:,n+1)';
     dPhi(:,n+1) = ( cos_m_phi.*h(:,n+1)'-sin_m_phi.* g(:,n+1)') .* cntarr;
end

cos_theta = cos(sct);
sin_theta = sin(sct);
[ Theta, dTheta ] = pmn(sct,nmax);


% jis suan theta dtheta...

%把结果加在一起
%Br = （a/r）* Sum(n=1,nmax) { (n+1) * R(r) *  Sum(m=0,n) { Theta(theta) * Phi(phi) } }

vv=sum(Theta.*Phi);
br=sum(vv.*dR)*a_over_r;

%Btheta=a*sin(theta)/r Sum(n=1,nmax) { R(r) *Sum(m=0,n) { dTheta(theta) * Phi(phi) } }
tt=sum(dTheta.*Phi);
bt=-1*sum(tt.*R)*a_over_r;

%Bphi= -a/r/sin(theta) Sum(n=1,nmax) { R(r) *Sum(m=0,n) { Theta(theta) * DPhi(phi) } }
pp=sum(Theta.*dPhi);
bp=-1*sum(pp.*R)*a_over_r/sin_theta;

B=[br,bt,bp];
end

