%关注微信公众号：您好啊数模君，免费白嫖算法和思路及程序
clear
clc
%cao法求嵌入维，结果看两条线的第一个交点
data = textread('深证.txt');             % 时间序列，列向量
min_m=1;
max_m=20;
tau=2;
k=1;
N=length(data);
En=[];
for m=min_m:max_m
    Nm=N-tau*(m-1);
    Y=[];
    D=[];
    ad=[];
    Y=reconstitution(data,N,m,tau);
    for i=1:N-m*tau
        d=[];
        for j=1:N-m*tau
            d(j)=norm(Y(:,i)-Y(:,j),inf);
        end
        temp=[];
        temp=sort(d);
        D(i,1)=i;  
        temp1=[];
        temp2=[];
        temp1=find(temp>0);
        temp2=find(d==temp(temp1(1)));
        D(i,2)=temp2(1);  
        D(i,3)=temp(temp1(1));
        %计算a(i,m)
        Y1=[];
        Y2=[];
        Y1=[Y(:,i);data(m*tau+i)];
        Y2=[Y(:,D(i,2));data(D(i,2)+m*tau)];
        ad(i)=norm(Y1-Y2,inf)/D(i,3);
    end
    %求E(d)
    E(k,1)=m;
    E(k,2)=sum(ad)/(N-m*tau);
    %求E*(d)
    En(k,1)=m;
    dd=[];
    for kk=1:N-m*tau
        dd(kk)=abs(data(D(kk,1)+m*tau)-data(D(kk,2)+m*tau));
    end
    En(k,2)=sum(dd)/(N-m*tau);
    k=k+1;
end
%求E1(d)
E1=[];
for i=1:(max_m-min_m)
    E1(i,1)=E(i,1);
    E1(i,2)=E(i+1,2)/E(i,2);
end
%求E2(d)
E2=[];
for i=1:(max_m-min_m)
    E2(i,1)=En(i,1);
    E2(i,2)=En(i+1,2)/En(i,2);
end
figure(1)
plot(E1(:,1),E1(:,2),'-bs',E2(:,1),E2(:,2),'-r*');xlabel('嵌入维数');ylabel('E1(m)&E2(m)');
grid on