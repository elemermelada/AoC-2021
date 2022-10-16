data=load("Day5 - input.txt");
data=reshape(data',2,[])';
data=reshape(data',2,2,[]);

%% Part 1

[m m n] = size(data);
mx=max(max(max(data)));
mp=zeros(mx,mx);

for ln=1:n
    line=data(:,:,ln);
    if line(1,1)==line(1,2)
        mp(min(line(2,1),line(2,2)):max(line(2,1),line(2,2)),line(1,1))=mp(min(line(2,1),line(2,2)):max(line(2,1),line(2,2)),line(1,1))+1;
    end
    if line(2,1)==line(2,2)
        mp(line(2,1),min(line(1,1),line(1,2)):max(line(1,1),line(1,2)))=mp(line(2,1),min(line(1,1),line(1,2)):max(line(1,1),line(1,2)))+1;
    end
end

sum(sum((sign(mp-1.1)+1)/2))

%% Part 2

[m m n] = size(data);
mx=max(max(max(data)));
mp=zeros(mx,mx);

for ln=1:n
    line=data(:,:,ln);
    if line(1,1)==line(1,2)
        mp(min(line(2,1),line(2,2)):max(line(2,1),line(2,2)),line(1,1))=mp(min(line(2,1),line(2,2)):max(line(2,1),line(2,2)),line(1,1))+1;
    end
    if line(2,1)==line(2,2)
        mp(line(2,1),min(line(1,1),line(1,2)):max(line(1,1),line(1,2)))=mp(line(2,1),min(line(1,1),line(1,2)):max(line(1,1),line(1,2)))+1;
    end
    if (line(1,1)-line(1,2))*(line(2,1)-line(2,2))~=0
        I=eye(abs(line(1,1)-line(1,2))+1);
        if (line(1,1)-line(1,2))/(line(2,1)-line(2,2))<0
            l=abs(line(1,1)-line(1,2))+1;
            I = zeros(l);
            I(l:l-1:end-1) = 1;

        end
        mp(min(line(2,1),line(2,2)):max(line(2,1),line(2,2)),min(line(1,1),line(1,2)):max(line(1,1),line(1,2)))=mp(min(line(2,1),line(2,2)):max(line(2,1),line(2,2)),min(line(1,1),line(1,2)):max(line(1,1),line(1,2)))+I;
    end
end

sum(sum((sign(mp-1.1)+1)/2))