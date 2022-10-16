clear all
clc
data=readtable("Day10 - input.txt",'ReadVariableNames',false,"Delimiter",",");
data=table2cell(data);

%% Part 1

[m,n]=size(data);

errs=zeros(m,1);
las={};

for i=1:m
    lastch=[];
    el=data(i,:);
    for ch=el
        %win
        if ch{1}==""
            errs(i)=0;
            break
        end
        %start
        if ch{1} == "("
            lastch=[lastch,")"];
            continue
        end
        if ch{1} == "["
            lastch=[lastch,"]"];
            continue
        end
        if ch{1} == "{"
            lastch=[lastch,"}"];
            continue
        end
        if ch{1} == "<"
            lastch=[lastch,">"];
            continue
        end
        %end
        if ch{1} ~= lastch(end)
            if ch{1}==">"
                errs(i)=25137;  
                break
            end
            if ch{1}=="}"
                errs(i)=1197;   
                break
            end
            if ch{1}=="]"
                errs(i)=57;   
                break
            end
            if ch{1}==")"
                errs(i)=3;   
                break
            end
        end
        %close
        lastch=lastch(1:end-1);
    end
    las=[las;{lastch}];
end

%% Part 2

score=[]
for i=1:m
    if (errs(i)==0)
        sc=0;
        for j=size(las{i,1},2):-1:1
            st=las{i,1};
            sc=sc*5;
            ch=st(j);
            if ch==")" sc=sc+1; end
            if ch=="]" sc=sc+2; end
            if ch=="}" sc=sc+3; end
            if ch==">" sc=sc+4; end
        end
        score=[score;sc];
    end
end