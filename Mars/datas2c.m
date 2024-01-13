function [ N ] = datas2c( rdat,tdat,pdat,tposn,pposn )
%datas2c 将球坐标系下的数据转换成直角坐标系下。
%输入：rdat tdat pdat 球坐标系数据
% tposn  pposn theta 与phi 角度。弧度制
%输出 N=[Bx,By,Bz]
cp=cos(pposn);
sp=sin(pposn);
ct=cos(tposn);
st=sin(tposn);
%转换矩阵为
%  st*cp    ct*cp    -sp 
%  st*sp    ct*sp     cp  ;
%   ct       -st      0 
N=[(st.*cp.*rdat'+ct.*cp.*tdat'-sp.*pdat');
    (st.*sp.*rdat'+ct.*sp.*tdat'+cp.*pdat');
    (ct.*rdat'-st.*tdat')];
end

