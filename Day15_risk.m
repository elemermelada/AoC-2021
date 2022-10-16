function risk = Day15_risk(x,data)
    ex=1;
    ey=1;
    risk=0;
    n=size(data,1);
    for step=x
        if step==0
            ex=ex+1;
        end
        if step==1
            ey=ey+1;
        end
        if ex>n
            ex=n;
            ey=ey+1;
        end
        if ey>n
            ey=n;
            ex=ex+1;
        end
        risk=risk+data(ex,ey);
    end
end