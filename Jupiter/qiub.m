function [ B ] = qiub( g, h, a_over_r, sct, scp )
%SPH_B Ϊ������������������ϵ�µĴų�ǿ�ȡ�ʹ����гչ���е���гģ�͡�
%��������� g hΪ��г������
%a_over_rΪ��гչ���е�a/r�����ǵ��������ĵľ���/���ǰ뾶
%sct��scpΪ��γ�Ⱥ;��ȣ������ơ�
%���Ϊ������ϵ�´ų�������B= [Br, Bt, Bp]
a=size(g);
nmax=a(2)-1;%�����гչ������
cntarr=0:1:nmax;
%����ÿһ��n��Ӧ��R��r����dR��r��
%R(r) = [a/r]^(n+1)
%dR(r) = (n+1)*[a/r]^(n+1)
R = (a_over_r).^(cntarr+1);
dR = R.*(cntarr+1);
%������ÿһ��m��n�����Phi(phi) and dPhi(phi)�Ĵ�С 
%Phi(phi) = gnm * cos(m*phi) + hnm * sin(m*phi)
%dPhi(phi) = m * [-gnm * sin(m*phi) + hnm * cos(m*phi)]
cos_m_phi = cos( cntarr * scp );
sin_m_phi = sin( cntarr * scp );
Phi  = g*0;  %�����վ���
dPhi = Phi;
for n=1:nmax
     Phi(:,n+1)  = cos_m_phi .* g(:,n+1)' + sin_m_phi .* h(:,n+1)';
     dPhi(:,n+1) = ( cos_m_phi.*h(:,n+1)'-sin_m_phi.* g(:,n+1)') .* cntarr;
end

cos_theta = cos(sct);
sin_theta = sin(sct);
[ Theta, dTheta ] = pmn(sct,nmax);


% jis suan theta dtheta...

%�ѽ������һ��
%Br = ��a/r��* Sum(n=1,nmax) { (n+1) * R(r) *  Sum(m=0,n) { Theta(theta) * Phi(phi) } }

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

