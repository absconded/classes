function [tau,I_sq]=mutual_information(data,tau_max,n)
%�����������û���Ϣ����ʱ�����е�ʱ���ӳ�Tau
%data���������ʱ������
%tau_max�����ʱ���ӳ�
%n���ȼ��С���ӻ�����

I_sq=zeros(tau_max,1);
N=length(data);
%ʱ�����еĳ���
for tau=1:tau_max
    s=[];q=[];
    s=data(1:N-tau);q=data(tau+1:N);
    %�ѵ�����ʱ���������䵽��ά��ռ�(s,q)��
    as=min(s);bq=min(q);
    %���ع�����ͼ��ȡ�򣬾��Ȼ��ֳ�n*n��С����
    delts=[];
    delts=(max(s)-as)/n;deltq=(max(q)-bq)/n;
    N_sq=zeros(n);
    for ii=1:n
    %����λ�ڸ���(ii,jj)�ڵ�������
        for jj=1:n
            for k=1:N-tau
                as_k=(s(k)-as)/delts; bq_k=(q(k)-bq)/deltq;
                if as_k>=ii-1&as_k<ii&bq_k>=jj-1&bq_k<jj                   
                       N_sq(ii,jj)=N_sq(ii,jj)+1;   
                end 
            end
        end
    end
    Ntotal=sum(sum(N_sq));
    Ps=sum(N_sq)/Ntotal;
    %����λ��һάs�����ڵĸ���
    Pq=sum(N_sq')/Ntotal;
    %����λ��һάq�����ڵĸ���
    Psq=N_sq/Ntotal;
    %����λ�ڶ�ά����(ii,jj)�ڸ���
    H_s=0;
    %����s����
    H_q=0;
    %����q����
    for i=1:n
        if Ps(i)~=0
            H_s=H_s-Ps(i)*log(Ps(i));
        elseif Pq(i)~=0
            H_q=H_q-Pq(i)*log(Pq(i));
        end
    end
    
    H_sq=0;
    %����(s,q)��������
    for i=1:n
        for j=1:n
            if Psq(i,j)~=0
                H_sq=H_sq-Psq(i,j)*log(Psq(i,j));
            end
        end
    end      
    I_sq(tau)=H_s+H_q-H_sq;
    %����tau�µĻ���Ϣ����
    clear s q;
    %��ձ���s��q
end