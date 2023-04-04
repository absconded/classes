%��ע΢�Ź��ںţ����ð���ģ������Ѱ����㷨��˼·������
clc
clear
%����Ϣ���������ӳ�ʱ��
data = textread('��֤.txt');             % ʱ�����У�������
figure
plot(data)
title('ʱ������')
axis([1,length(data),min(data),max(data)])
tau_max = 30;          % ���ʱ��
n = 5;             % ÿһ���껮�ֵķ���
[~,r] = mutual_information(data,tau_max,n);

%----------------------------------------------------------------------%
% Ѱ�ҵ�һ���ֲ���С��

for i = 1:length(r)-1           
    if (r(i)<=r(i+1))
        tau = i;        % ��һ���ֲ���Сֵλ��
        break;
    end
end
optimal_tau = tau -1    % r �ĵ�һ��ֵ��Ӧ tau = 0,����Ҫ�� 1

%----------------------------------------------------------------------%
% ͼ����ʾ
figure
plot(0:length(r)-1,r)
hold on 
plot([optimal_tau,optimal_tau],[min(r),max(r)],'--')
axis([0,length(r)-1,min(r),max(r)])
xlabel('ʱ��');
title('����Ϣ����ʱ��');