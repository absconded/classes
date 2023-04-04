%��ע΢�Ź��ںţ����ð���ģ������Ѱ����㷨��˼·������
% ����ʱ������ Lyapunov ָ��
clc
clear
close all
data = textread('��֤.txt');             % ʱ�����У�������
figure
plot(data)
%-----------------------------------------------------------------
% Logistic ��ڲ���
tau = 2;                        % ͨ��huxinxifa.m����ʱ��
m = 17;                          % �����ʱ�Ӵ���cao.m����Ƕ��ά
[xn] = PhaSpaRecon(data,tau,m);    % ÿ��Ϊһ����
xn = xn';                      
P =fix(period_mean_fft(data));     % ����ƽ������
taumax = tau*m*10;                    % �����ɢ����ʱ��
if P>length(data)
    P=length(data);
end
if taumax>P
    taumax=P;
end
fs = 1;                         % ����Ƶ��
Y = Lyapunov_rosenstein_2(xn,fs,tau,m,taumax,P);
Y(1)=[];
figure
plot(log(Y),'b-'); grid; xlabel('i'); ylabel('y(i)');
linear_zone=[1:length(Y)]';
F = polyfit(linear_zone,log(Y),1);
y=linear_zone.*F(1)+F(2);
hold on
plot(linear_zone,y,'r-')
legend('data','����')
str = ['y=',num2str(F(1)),'x+(',num2str(F(2)),')'];
text(50,max(y),str)