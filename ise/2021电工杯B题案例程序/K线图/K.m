%��ע΢�Ź��ںţ����ð���ģ������Ѱ����㷨�ͱ���˼·������
%���ǻ��Ƶ����Ĺ�ƱK��ͼ���򣬵�һ���ǿ��ǵ��Ǽ�Ȩ�ͺ�����壬ע�����
%ע�ⲿ�ֹ�Ʊ��2019������ݣ��������a=find(X(:,3)=='2019-03-04');
    i=1;
    X=[];
    [~,~,X]=xlsread('����1.xlsx',['Sheet0 (',num2str(i),')']);
    X=string(X);
    X=rmmissing(X);%ɾ��<missing>��
    X(2,8)=0;X(2,9)=0;
    a=find(X(:,3)=='2019-03-04');
    b=find(X(:,3)=='2021-04-30');
    c=find(X(:,3)=='2019-04-01');
    Y=double(X(a:b,[4 5 6 7]));%���̼ۡ���߼ۡ���ͼۡ����̼�
    figure
    Kplot(Y(:,1),Y(:,2),Y(:,3),Y(:,4))
    ylabel('�ɽ���')
    title([X(2,2)+'--K��ͼ'])
    xlim([0,length(Y)+1])
    XTick=[1;length(Y)-1];
    XTickLabel=['2019-03-04'
        '2021-04-30'];
    XTickLabel=string(XTickLabel);
    set(gca,'XTick',XTick);
    set(gca,'XTickLabel',XTickLabel);

    
