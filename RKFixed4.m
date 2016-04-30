function NewSat = RKFixed4(dt,OldSat,DfunHandle,varargin)
%���ܣ�����Runge_Kutta�ļ��Ľ׶������������Dx = f(x)��ʽ��΢�ַ��̣�
%          ���������Ǹ���΢�ַ��̵Ķ�������������ΪO5(dt).
%Inputs: dt        ---���ֲ���
%        OldSat    ---��һ����״̬,n*1��������
%        DfunHandle---���㵼�����Һ������
%        varargin  ---�䳤���������������ڴ��ݼ����ҵ�����Ҫ�Ĳ�����1*n��Ԫ������
%Output: NewSat    ---�»��ֲ���״̬��n*1��������
%Note 1���������÷���Ϊ��
%        NewSat = RungeKuttaFix4(dt,OldSat,@Dfun,para1,para2,para3,...)
%        ����,DfunΪ�����ҵ����ĺ�������para1,para2,para3,...Ϊ�����ҵ���ʱ��Ҫ�Ĳ���
%Note2�� Dfun�ĺ���ԭ��Ϊ�� DY = Dfun(OldSat,varargin);
%Note3�� �������ݺ�ĵ��÷���Ϊ��         
%         para1,para2,para3,...�ȴ���Dfun�����к󣬷ֱ��Ϊvarargin�еĵ�i��Ԫ���������������ʽ���ػ�
%         para1 = varargin{1};
%         para2 = varargin{2};
%         para3 = varargin{3};
%         .......
%         ֮��Ϳ�����Dfun��ʹ��para1,para2,para3,...�Ȳ���
%Note4��  ������������ڶ����������㷨���Ľ�Runge-Kutta�㷨�ľ����ѻ����ﵽ��߾��ȣ����׵ľ�����߲���
%
%First Edited by Zhang Hongbo on 2008-03-18
%Modified by Zhang Hongbo on 2011-03-28: �޸��˱䳤�����������Ĵ��ݷ�������ֱ�ӵ��ñ�����


%1. ����׼��
C(1) = dt/2;    C(2) = dt/2;    C(3) = dt;  C(4) = dt;  C(5) = dt/2;
[Row,Col] = size(OldSat);
for cnt = 1:Row
    Tmp2Sat(cnt,1) = OldSat(cnt);
    NewSat (cnt,1) = OldSat(cnt);
end

%2. �Ľ׻���
for Step = 1:4
    DiffSat = feval(DfunHandle,Tmp2Sat,varargin{:});
    for cnt = 1:Row
        Tmp2Sat(cnt,1) = OldSat(cnt)+C(Step  )*DiffSat(cnt);
        NewSat (cnt,1) = NewSat(cnt)+C(Step+1)*DiffSat(cnt)/3;
    end
end
return;
        
        
        
        
        
        
        
        
        
        
        
