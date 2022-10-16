load('Day3 - input.txt');

%% Part 1
[m n] = size(Day3___input);
g=[];
for v = Day3___input
    g=[g,round(sum(v)/m)];
end
e=abs(g-1);

gdec=0;
edec=0;
for j=1:n
    index=n-j;
    gdec=gdec+g(j)*2^index;
    edec=edec+e(j)*2^index;
end
gdec*edec

%% Part 2
data=Day3___input;
[m n] = size(data);
oxy=[];
for j=1:n
    [m n] = size(data);
    most_common=round(sum(data(:,j))/m);
    oldata=data;
    data=[];
    for el = oldata'
        if el(j)==most_common
            data=[data;el'];
        end
    end
end
oxy=data;

data=Day3___input;
co2=[];
for j=1:n
    if size(data)==0
        break
    end
    [m n] = size(data);
    most_common=abs(1-round(sum(data(:,j))/m))
    oldata=data;
    data=[];
    for el = oldata'
        if el(j)==most_common
            data=[data;el'];
        end
    end
end
co2=oldata;

odec=0;
cdec=0;
for j=1:n
    index=n-j;
    odec=odec+oxy(j)*2^index;
    cdec=cdec+co2(j)*2^index;
end
odec*cdec
