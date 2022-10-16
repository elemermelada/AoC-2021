data=load("Day9 - input.txt");
[m n] = size(data);

%% Part 1
data=[9*ones(m,1),data,9*ones(m,1)];
data=[9*ones(1,n+2);data;9*ones(1,n+2)];
mask=zeros(m+2,n+2);

for i=2:m+1
    for j=2:n+1
        if (data(i,j)<data(i+1,j)&&data(i,j)<data(i-1,j)&&data(i,j)<data(i,j+1)&&data(i,j)<data(i,j-1))
            mask(i,j)=1;
        end
    end
end

sum(sum(mask.*(data+1)))


%% Part 2

mp=data;
downs=[];
for i=1:m+2
    for j=1:n+2
        if mp(i,j)==9
            mp(i,j)=8;
        else
            mp(i,j)=0;
        end
        if mask(i,j)==1
            downs=[downs;i,j];
        end
    end
end
mp=mp+2*mask;


%crawling algorithm
areas=[];
for mn=downs'

    new=mn';
    a=1;
    while true
        if size(new)==0
            break
        end
    
        %iterate
        nxt=[];
        for el=new'
            pt=el';
            for j=[-1,1]
                if (mp(el(1)+j,el(2))==0)
                    mp(el(1)+j,el(2))=2;
                    a=a+1;
                    nxt=[nxt;el(1)+j,el(2)];
                end
                if (mp(el(1),el(2)+j)==0)
                    mp(el(1),el(2)+j)=2;
                    a=a+1;
                    nxt=[nxt;el(1),el(2)+j];
                end
            end
        end
        new=nxt;
    end
    areas=[areas,a];
    % [X,Y]=meshgrid(1:102,1:102);
    % Z=mp;
    % surf(X,Y,Z)

end

for i=1:4
    mx=max(areas)
    areas(find(areas==mx))=[];
end

