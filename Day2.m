data=readtable('Day2 - input.txt','Delimiter',',');
tags=data(:,1).Var1;
vals=data(:,2).Var2;

%% Part 1

loc=[];

[m n]=size(tags);

for j=1:m
    t=tags(j);
    if t{1}=="forward"
        loc=[loc;+vals(j)];
    end
    if t{1}=="up"
        loc=[loc;-vals(j)*i];
    end
    if t{1}=="down"
        loc=[loc;+vals(j)*i];
    end
end

sum(real(loc))*sum(imag(loc))

%% Part 2

aim=0;

x=0;
y=0;

for el=loc'
    
    aim=aim-imag(el);
    x=x+real(el);
    y=y+aim*real(el);

end

x*y