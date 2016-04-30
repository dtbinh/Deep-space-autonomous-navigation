function [r2,v2]=relative2absolute(r_v0,r_v1)
%��֪�ο����ǵĹ���������Ǿ��Ѿ�֪��������ת�Ƕȣ�����ת����
%����Ϊ�ο����ǵľ�����Ϣ����������֮��������Ϣ������Ҫ�������תΪ��������ϵ�µ���
%Ȼ����ͨ��ʸ���Ӽ���ð������ǵľ���λ���ٶ�
r0=r_v0(1:3);v0=r_v0(4:6);
r1=r_v1(1:3);v1=r_v1(4:6);
h=cross(r0,v0);     %λ�ú��ٶȵĲ��
hm=norm(h); %��������ľ���
rm=norm(r0);
i=acos(h(3)/hm);
b=atan2(h(1),-h(2)); 
u=atan2(r0(3),(r0(2)*sin(b)+r0(1)*cos(b))*sin(i));
B=[cos(b)*cos(u)-sin(b)*sin(u)*cos(i),-cos(b)*sin(u)-sin(b)*cos(u)*cos(i),...
  sin(b)*sin(i);sin(b)*cos(u)+cos(b)*sin(u)*cos(i),-sin(b)*sin(u)+cos(b)*cos(u)*cos(i),...
   -cos(b)*sin(i);sin(u)*sin(i),cos(u)*sin(i),cos(i)];
B1=B';
r2=B1\r1+r0;%�������ת������ϵ��
v2=B1\(v1+(cross([0,0,hm/rm^2],r1'))')+v0;
  %�������Ǿ���λ��λ�ú��ٶȣ���x1+x0
