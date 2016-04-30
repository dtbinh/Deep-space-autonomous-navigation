%����ȫ�ֱ��� ��ʼ��
global u  RA  omega f R1 T J Re
global N H  Q R x P0 w_k v_k x_err xt yt
% global A2m Cd JED Mat

u=398600.4418;
RA=0;             %Right ascending
omega=0;          %���ص����
f=0;              %True Anomaly
R1=10;%��λkm
T=5;
N=4000;%�������
H=[eye(3),zeros(3),-eye(3),zeros(3)];%�۲����
%------------------------------------------------
%step2:define noise assumption
Q=diag([10^(-12) 10^(-12) 10^(-12) 10^(-16) 10^(-16) 10^(-16)...
    10^(-12) 10^(-12) 10^(-12) 10^(-16) 10^(-16) 10^(-16)]);%������������
R=diag([10^(-8) 10^(-8) 10^(-8)]);%�۲���������
%-------------------------------------------------------------------------
%step3:initiate state and covariance

P0=diag([100 100 100 10^(-6) 10^(-6) 10^(-6)...
    100 100 100 100^(-6) 10^(-6) 10^(-6)]);%��ʼ����
x=zeros(12,N);

%------------------------------------------------------------------------

%simulation only calculate the true state trajectory for comparison
%also calculate the measurement vector
w_k=[10^(-6)*wgn(3,N,0,'real');10^(-8)*wgn(3,N,0,'real');10^(-6)*wgn(3,N,0,'real');10^(-8)*wgn(3,N,0,'real')];
v_k=10^(-4)*wgn(3,N,0,'real');%�۲�����
%-------------------------------------------
x_err=zeros(12,N);
xt=zeros(12,N);%λ���ٶ�״̬
yt=zeros(3,N); %�۲�״̬
%--------------����״̬���£�����ѧģ�Ͱ��������㶯-------------
Re=6378.14;
J=1.0826e-3;
