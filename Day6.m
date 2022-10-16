data = load("Day6 - input.txt");

%% Part 1

for day=1:80
    add=0;
    for l=1:size(data,2)
        data(1,l)=data(1,l)-1;
        if data(1,l)==-1
            data(1,l)=6;
            add=add+1;
        end
    end
    data=[data,8*ones(1,add)];
end

size(data,2)

%% Part 2
% latter code is too slow
% all fish with same state are grouped now

data = load("Day6 - input.txt");
amount = [sum(data==0),sum(data==1),sum(data==2),sum(data==3),sum(data==4),sum(data==5),sum(data==6),0,0,0];
for day=1:256
    old0=amount(1);
    amount(1)=amount(2);
    amount(2)=amount(3);
    amount(3)=amount(4);
    amount(4)=amount(5);
    amount(5)=amount(6);
    amount(6)=amount(7);
    amount(7)=amount(8);
    amount(8)=amount(9);

    amount(7)=amount(7)+old0;
    amount(9)=old0;
end
sum(amount)