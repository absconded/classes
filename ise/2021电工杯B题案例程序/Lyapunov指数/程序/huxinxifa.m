%关注微信公众号：您好啊数模君，免费白嫖算法和思路及程序
clc
clear
%互信息函数法求延迟时间
data = textread('深证.txt');             % 时间序列，列向量
figure
plot(data)
title('时间序列')
axis([1,length(data),min(data),max(data)])
tau_max = 30;          % 最大时延
n = 5;             % 每一座标划分的份数
[~,r] = mutual_information(data,tau_max,n);

%----------------------------------------------------------------------%
% 寻找第一个局部极小点

for i = 1:length(r)-1           
    if (r(i)<=r(i+1))
        tau = i;        % 第一个局部极小值位置
        break;
    end
end
optimal_tau = tau -1    % r 的第一个值对应 tau = 0,所以要减 1

%----------------------------------------------------------------------%
% 图形显示
figure
plot(0:length(r)-1,r)
hold on 
plot([optimal_tau,optimal_tau],[min(r),max(r)],'--')
axis([0,length(r)-1,min(r),max(r)])
xlabel('时延');
title('互信息法求时延');