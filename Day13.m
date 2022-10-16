clear
clc

data=load("Day13 - input.txt");
data2=readtable("Day13 - input2.txt","Delimiter","=","ReadVariableNames",false);
data2=table2cell(data2);



%% Part 1

mp=zeros(max(max(data))+1);
for p=data'
    mp(p(1)+1,p(2)+1)=1;
end

fold=data2(1,:);
sym=fold{2}+1;
if fold{1}=="x"
    for x=max(max(data))+1:-1:sym
        for y=1:max(max(data))+1
            if mp(x,y)>0
                mp(x,y)=0;
                mp(2*sym-x,y)=mp(2*sym-x,y)+1;
            end
        end
    end
end
sum(sum(sign(mp)))

%% Part 2

mp=zeros(max(max(data))+1);
for p=data'
    mp(p(1)+1,p(2)+1)=1;
end

for fold=data2'
    sym=fold{2}+1;
    if fold{1}=="x"
        for x=max(max(data))+1:-1:sym
            for y=1:max(max(data))+1
                if mp(x,y)>0
                    mp(x,y)=0;
                    mp(2*sym-x,y)=mp(2*sym-x,y)+1;
                end
            end
        end
        continue
    end
    for y=max(max(data))+1:-1:sym
        for x=1:max(max(data))+1
            if mp(x,y)>0
                mp(x,y)=0;
                mp(x,2*sym-y)=mp(x,2*sym-y)+1;
            end
        end
    end
end

pts=[];
for x=1:max(max(data))+1
    for y=1:max(max(data))+1
        if mp(x,y)>0
            pts=[pts;x,-y];
        end
    end
end
scatter(pts(:,1),pts(:,2))