function [ N ] = datas2c( rdat,tdat,pdat,tposn,pposn )
%datas2c ��������ϵ�µ�����ת����ֱ������ϵ�¡�
%���룺rdat tdat pdat ������ϵ����
% tposn  pposn theta ��phi �Ƕȡ�������
%��� N=[Bx,By,Bz]
cp=cos(pposn);
sp=sin(pposn);
ct=cos(tposn);
st=sin(tposn);
%ת������Ϊ
%  st*cp    ct*cp    -sp 
%  st*sp    ct*sp     cp  ;
%   ct       -st      0 
N=[(st.*cp.*rdat'+ct.*cp.*tdat'-sp.*pdat');
    (st.*sp.*rdat'+ct.*sp.*tdat'+cp.*pdat');
    (ct.*rdat'-st.*tdat')];
end

