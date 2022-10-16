clear
clc

data=readtable("Day8 - input.txt",'ReadVariableNames',false);
data(:,11)=[];
data=table2cell(data);

%% Part 1

outero=[];

for dp=data'
    disp=dp';
    state=zeros(10,7);
    outpt=zeros(4,7);
    for i=1:10
        dig=disp{i};
        if contains(dig,"a") state(i,1)=1; end
        if contains(dig,"b") state(i,2)=1; end
        if contains(dig,"c") state(i,3)=1; end
        if contains(dig,"d") state(i,4)=1; end
        if contains(dig,"e") state(i,5)=1; end
        if contains(dig,"f") state(i,6)=1; end
        if contains(dig,"g") state(i,7)=1; end
    end

    for i=11:14
        dig=disp{i};
        if contains(dig,"a") outpt(i-10,1)=1; end
        if contains(dig,"b") outpt(i-10,2)=1; end
        if contains(dig,"c") outpt(i-10,3)=1; end
        if contains(dig,"d") outpt(i-10,4)=1; end
        if contains(dig,"e") outpt(i-10,5)=1; end
        if contains(dig,"f") outpt(i-10,6)=1; end
        if contains(dig,"g") outpt(i-10,7)=1; end
    end

    result=zeros(10,7);

    %find 1,4,7,8
    delet=[];
    for i=1:10
        dig=state(i,:);
        if sum(dig)==2
            result(2,:)=dig;
            delet=[delet, i];
        end
        if sum(dig)==4
            result(5,:)=dig;
            delet=[delet, i];
        end
        if sum(dig)==3
            result(8,:)=dig;
            delet=[delet, i];
        end
        if sum(dig)==7
            result(9,:)=dig;
            delet=[delet, i];
        end
    end
    state(delet,:)=[];
    
    %find 3
    for i=1:size(state,1)
        dig=state(i,:);
        if sum(abs(dig-result(2,:)))==3
            result(4,:)=dig;
            state(i,:)=[];
            break
        end
    end

    %find 2, 5
    delet=[];
    for i=1:size(state,1)
        dig=state(i,:);
        if sum(dig)==5
            if sum(abs(dig-result(5,:)))==3
                result(6,:)=dig;
                delet=[delet, i];
            end
            if sum(abs(dig-result(5,:)))==5
                result(3,:)=dig;
                delet=[delet, i];
            end
        end
    end
    state(delet,:)=[];

    %find 9
    for i=1:size(state,1)
        dig=state(i,:);
        if sum(abs(dig-result(5,:)))==2
            result(10,:)=dig;
            state(i,:)=[];
            break
        end
    end

    %find 0, 6
    delet=[];
    for i=1:size(state,1)
        dig=state(i,:);
        if sum(abs(dig-result(2,:)))==4
            result(1,:)=dig;
            delet=[delet, i];
        end
        if sum(abs(dig-result(2,:)))==6
            result(7,:)=dig;
            delet=[delet, i];
        end
    end
    state(delet,:)=[];

    output=[];
    for o=outpt'
        out=o';
        if sum(abs(out-result(1,:)))==0 output=[output,0]; end
        if sum(abs(out-result(2,:)))==0 output=[output,1]; end
        if sum(abs(out-result(3,:)))==0 output=[output,2]; end
        if sum(abs(out-result(4,:)))==0 output=[output,3]; end
        if sum(abs(out-result(5,:)))==0 output=[output,4]; end
        if sum(abs(out-result(6,:)))==0 output=[output,5]; end
        if sum(abs(out-result(7,:)))==0 output=[output,6]; end
        if sum(abs(out-result(8,:)))==0 output=[output,7]; end
        if sum(abs(out-result(9,:)))==0 output=[output,8]; end
        if sum(abs(out-result(10,:)))==0 output=[output,9]; end
    end

    outero=[outero;output];

end

sum(sum(1-abs(sign(outero-1))))+sum(sum(1-abs(sign(outero-4))))+sum(sum(1-abs(sign(outero-7))))+sum(sum(1-abs(sign(outero-8))))

%% Part 2

sum(outero(:,1)*1000+outero(:,2)*100+outero(:,3)*10+outero(:,4)*1)