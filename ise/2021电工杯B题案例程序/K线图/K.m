%关注微信公众号：您好啊数模君，免费白嫖算法和比赛思路及程序
%这是绘制单条的股票K线图程序，第一问是考虑的是加权和后的整体，注意更改
%注意部分股票无2019年的数据，就请更改a=find(X(:,3)=='2019-03-04');
    i=1;
    X=[];
    [~,~,X]=xlsread('附件1.xlsx',['Sheet0 (',num2str(i),')']);
    X=string(X);
    X=rmmissing(X);%删除<missing>行
    X(2,8)=0;X(2,9)=0;
    a=find(X(:,3)=='2019-03-04');
    b=find(X(:,3)=='2021-04-30');
    c=find(X(:,3)=='2019-04-01');
    Y=double(X(a:b,[4 5 6 7]));%开盘价、最高价、最低价、收盘价
    figure
    Kplot(Y(:,1),Y(:,2),Y(:,3),Y(:,4))
    ylabel('成交价')
    title([X(2,2)+'--K线图'])
    xlim([0,length(Y)+1])
    XTick=[1;length(Y)-1];
    XTickLabel=['2019-03-04'
        '2021-04-30'];
    XTickLabel=string(XTickLabel);
    set(gca,'XTick',XTick);
    set(gca,'XTickLabel',XTickLabel);

    
