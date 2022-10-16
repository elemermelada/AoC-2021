data=load("Day11 - input.txt");
marg=999;
data=[-marg*ones(1,10);data;-marg*ones(1,10)];
data=[-marg*ones(12,1),data,-marg*ones(12,1)];

%% Part 1

fls=0;
for c=1:1000     %100 cycles
    ign=zeros(12,12);
    igned=zeros(12,12);
    data=data+1;%sum 1
    for x=2:11
        for y=2:11
            if data(x,y)==10
                data(x,y)=0;
                ign(x,y)=1;
            end
        end
    end

    while sum(sum(ign))~=0
        newign=zeros(12,12);
        for x=2:11
            for y=2:11
                if ign(x,y)==1
                    igned(x,y)=1;
                    data(x-1:x+1,y-1:y+1)=data(x-1:x+1,y-1:y+1)+1;
                    fls=fls+1;
                end
            end
        end
        for x=2:11
            for y=2:11
                if data(x,y)>9
                    data(x,y)=0;
                    if igned(x,y)==0
                        newign(x,y)=1;
                    end
                    igned(x,y)=1;
                end
            end
        end
        ign=newign;
    end

    data=data.*(1-igned);
    if sum(sum(igned))==100
        c
        break
    end
end
fls