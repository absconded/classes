%关注微信公众号：您好啊数模君，免费白嫖算法和思路及程序
% 计算时间序列 Lyapunov 指数
clc
clear
close all
data = textread('深证.txt');             % 时间序列，列向量
figure
plot(data)
%-----------------------------------------------------------------
% Logistic 入口参数
tau = 2;                        % 通过huxinxifa.m计算时延
m = 17;                          % 算出的时延带入cao.m计算嵌入维
[xn] = PhaSpaRecon(data,tau,m);    % 每列为一个点
xn = xn';                      
P =fix(period_mean_fft(data));     % 序列平均周期
taumax = tau*m*10;                    % 最大离散步进时间
if P>length(data)
    P=length(data);
end
if taumax>P
    taumax=P;
end
fs = 1;                         % 采样频率
Y = Lyapunov_rosenstein_2(xn,fs,tau,m,taumax,P);
Y(1)=[];
figure
plot(log(Y),'b-'); grid; xlabel('i'); ylabel('y(i)');
linear_zone=[1:length(Y)]';
F = polyfit(linear_zone,log(Y),1);
y=linear_zone.*F(1)+F(2);
hold on
plot(linear_zone,y,'r-')
legend('data','线性')
str = ['y=',num2str(F(1)),'x+(',num2str(F(2)),')'];
text(50,max(y),str)