%% Part 1

clear
clc

data=readtable("Day14 - input.txt","Delimiter",",","ReadVariableNames",false);
data=convertCharsToStrings(table2cell(data));
data2=readtable("Day14 - input2.txt","Delimiter",">","ReadVariableNames",false);
data2=convertCharsToStrings(table2cell(data2));

for t=1:7
add=[];
for el=1:size(data,2)-1
    ch=data(el);
    ch2=data(el+1);
    for tm=data2'
        if ch+ch2==tm(1)
            add=[add,tm(2)];
        end
    end
end
for i=1:size(add,2)
    data=[data(1:2*i-1),add(i),data(2*i:end)];
end
end

duta=readtable("Day14 - input.txt","Delimiter",",","ReadVariableNames",false);
duta=convertCharsToStrings(table2cell(duta));

Ls=table();
for L=duta
    Ls.(L)=0;
end

for L=data
    Ls.(L)=Ls.(L)+1;
end

Ls_t=table2cell(Ls);
mx=0;
mn=inf;
for L=Ls_t
    if L{1}>mx
        mx=L{1};
    end
    if L{1}<mn
        mn=L{1};
    end
end
mx-mn

%% Part 2
%much more efficient ⏳⏳⏳
clear
clc

data=readtable("Day14 - input.txt","Delimiter",",","ReadVariableNames",false);
data=convertCharsToStrings(table2cell(data));
data2=readtable("Day14 - input2.txt","Delimiter",">","ReadVariableNames",false);
data2=convertCharsToStrings(table2cell(data2));

template=table();
for el=data2'
    template.(el(1))={el(2),0};
end
for i=1:size(data,2)-1
    template.(data(i)+data(i+1)){2}=template.(data(i)+data(i+1)){2}+1;
end

for i=1:40
    newtemp=template;
    for c=data2'
        c=c{1};
        newtemp.(c){2}=0;
    end
    for c=data2'
        c=c{1};
        count=template.(c){2};
        addL=template.(c){1};
        add1=c(1)+addL;
        add2=addL+c(2);
        newtemp.(add1){2}=newtemp.(add1){2}+count;
        newtemp.(add2){2}=newtemp.(add2){2}+count;
    end
    template=newtemp;
end

letters=table();
for c=data2'
    c=c{1};
    letters.(c(1))=0;
    letters.(c(2))=0;
end
for c=data2'
    c=c{1};
    count=template.(c){2};
    letters.(c(1))=letters.(c(1))+count;
    letters.(c(2))=letters.(c(2))+count;
end

mx=0;
mn=inf;
for el=table2cell(letters)
    if(el{1}>mx)
        mx=el{1};
    end
    if(el{1}<mn)
        mn=el{1};
    end
end
round((mx-mn)/2+0.1)