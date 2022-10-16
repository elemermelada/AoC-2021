load("Day1 - input.txt")

% Day1___input=[199
% 200
% 208
% 210
% 200
% 207
% 240
% 269
% 260
% 263];         %% TESTING

%% PART 1

%counter
count=-1;
prev=0;
for el = Day1___input'
    if (el>prev)
        count=count+1;
    end
    prev=el;
end
count

%% PART 2

%binning
prev1=0;
prev2=0;
bin=[];
for el = Day1___input'
    bin=[bin;el+prev1+prev2];
    prev2=prev1;
    prev1=el;
end
bin=bin(3:end);

%counter
count=-1;
prev=0;
for el = bin'
    if (el>prev)
        count=count+1;
    end
    prev=el;
end
count