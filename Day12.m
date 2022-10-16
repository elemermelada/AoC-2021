clear all
clc

data=readtable("Day12 - input.txt", 'ReadVariableNames',false,"Delimiter","-");
data=table2cell(data);

%TOUCH
orgdata=table();
for el=data'
    el=el';

    orgdata.(el{1})=["puaj"];
    orgdata.(el{2})=["puaj"];
end

%ADD DATA
for el=data'
    el=el';

    orgdata.(el{1})=[orgdata.(el{1}),el{2}];
    orgdata.(el{2})=[orgdata.(el{2}),el{1}];
end

%REMOVE TOUCH
for el=orgdata
    tmp=orgdata.(el.Properties.VariableNames{1});
    orgdata.(el.Properties.VariableNames{1})=tmp(2:end);
end

%% Part 1

paths={["start"]};
explored={};
while size(paths,1)~=0
    newpaths={};
    for el=paths
        pth=el';
        pth=pth{1};
        lst=pth(end);
        if lst=="end"
            explored{end+1}=pth;
            continue
        end
        opt=orgdata.(lst);
        for op=opt
            if op==lower(op)
                add=1;
                for st=pth
                    if st(1)==op
                        add=0;
                        break
                    end
                end
                if add
                    newpaths{end+1}=[pth, op];
                end
                continue
            end
            newpaths{end+1}=[pth, op];
        end
    end
    paths=newpaths;
end

%% Part 1

paths={["start"]};
explored={};
while size(paths,1)~=0
    newpaths={};
    for el=paths
        pth=el';
        pth=pth{1};
        lst=pth(end);
        if lst=="end"
            explored{end+1}=pth;
            continue
        end
        if lst=="d"
            pth
        end
        opt=orgdata.(lst);
        for op=opt
            %START and END criterion
            if op=="start"
                continue
            end
            if op=="end"
                newpaths{end+1}=[pth, op];
                continue
            end
            %lowercase crit
            if op==lower(op)
                add=1;
                for st=pth      %check if already inside
                    if st(1)==op
                        add=0;
                        break
                    end
                end
                if add==0
                    if pth(1)=="start"
                        tmp=pth;
                        tmp(1)="strt";
                        newpaths{end+1}=[tmp, op];
                    end
                    continue
                end
                newpaths{end+1}=[pth, op];
                continue
            end
            %mayus
            newpaths{end+1}=[pth, op];
        end
    end
    paths=newpaths;
end