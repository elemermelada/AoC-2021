data = load("Day7 - input.txt");
mn=min(data);
mx=max(data);

%% Part 1

fuel=[];
for pos=mn:mx
    v=pos*ones(1,size(data,2));
    fuel=[fuel,sum((abs(data-v)+1).*abs(data-v)/2)];
end

min(fuel)