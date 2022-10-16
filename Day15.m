clc
clear

data=load("Day15 - input.txt");

x=1;
y=1;
n=size(data,1);

seq=[];
mx=0;

options_ga = optimoptions('ga');
options_ga = optimoptions(options_ga,'MaxGenerations', 100*18);
options_ga = optimoptions(options_ga,'PopulationSize', 18);
options_ga = optimoptions(options_ga,'UseParallel', true);
% options_ga = optimoptions(options_ga,'FunctionTolerance', FunctionTolerance_Data);
% options_ga = optimoptions(options_ga,'ConstraintTolerance', ConstraintTolerance_Data);
options_ga = optimoptions(options_ga,'Display', 'diagnose');
options_ga = optimoptions(options_ga,'PlotFcn', {  @gaplotbestf @gaplotbestindiv @gaplotdistance @gaplotexpectation @gaplotgenealogy @gaplotrange @gaplotscorediversity @gaplotscores @gaplotselection @gaplotstopping @gaplotmaxconstr });

%% Part 1

%baseline
while 1
    if x==n
        if y==n
            break
        end
        y=y+1;
        seq=[seq;1];
        mx=mx+data(x,y);
        continue
    end
    if y==n
        if x==n
            break
        end
        x=x+1;
        seq=[seq;0];
        mx=mx+data(x,y);
        continue
    end
    if data(x+1,y)>data(x,y+1)
        y=y+1;
        seq=[seq;1];
        mx=mx+data(x,y);
        continue
    end
    x=x+1;
    seq=[seq;0];
    mx=mx+data(x,y);
    continue
end

options_ga = optimoptions(options_ga,'InitialPopulationMatrix', seq');
f=@(x) Day15_risk(x,data);
[x_ga,fval,exitflag,output,population,score]=ga(f,2*(n-1),[],[],[],[],zeros(2*(n-1),1),ones(2*(n-1),1),[],1:2*(n-1),options_ga);

