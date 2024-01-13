function [ B ] = sph_b( g, h, a_over_r, sct, scp )
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
dtheta=Phi;
dPhi = Phi;
for n=1:nmax
     Phi(:,n+1)  = cos_m_phi .* g(:,n+1)' + sin_m_phi .* h(:,n+1)';
     dPhi(:,n+1) = ( cos_m_phi.*h(:,n+1)'-sin_m_phi.* g(:,n+1)') .* cntarr;
end
%计算Theta and dTheta at each m,n combo
%Theta(theta) = P(n,m,x)  施密特正则化下的勒让德分解。
%dTheta(theta) = m * cos(theta) / sin(theta) * P(n,m,x) -
%                 C(n,m) / C(n,m+1) * P(n,m+1,x)
%                  Where C(n,m) = 1 if m=0
%                        C（n,m) =( 2 * (n-m)! / (n+m)! ) ^ (1/2)
cos_theta = cos(sct);
sin_theta = sin(sct);

Theta=legendre_schmidt_all(nmax,cos_theta);
dTheta=g*0;

dTheta(:,2)=cntarr.*cos_theta./sin_theta.*Theta(:,2)';
dTheta(1,2)=dTheta(1,2)-Theta(2,2);

for n=2:nmax
    dTheta(:,n+1)=cntarr*cos_theta/sin_theta.*Theta(:,n+1)';
    dTheta(1,n+1)=dTheta(1,n+1)-sqrt((n*(n+1))*0.5)*Theta(2,n+1);
    hou=[Theta(3:n+1,n+1)',(0)];
    zhong=sqrt((n-cntarr(2:n+1)).*(n+cntarr(2:n+1)+1));
    dTheta(2:n+1,n+1)=dTheta(2:n+1,n+1)'-zhong.*hou;
end

for i=1:nmax+1
    Phi(i+1:nmax,i)=0;
    dPhi(i+1:nmax,i)=0;
end   %将可能导致错误的NaN去掉
        
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

