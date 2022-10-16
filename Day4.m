game=load("Day4 - input.txt");
boards=reshape(load("Day4 - input2.txt")',5,5,[]);
masks=boards.*0+1;

[m m n]=size(boards);
winner=0;
stop = false;

for num=game
    if stop
        break
    end
    for bd=1:n
        board=boards(:,:,bd);
        mask=masks(:,:,bd);
        for i = 1:m
            for j = 1:m
                if board(i,j)==num
                    mask(i,j)=0;
                end
            end
        end
        checkwin=1;
        for j=1:m
            checkwin=checkwin*sum(mask(j,:))*sum(mask(:,j));
        end
        if checkwin==0
            winner=bd;
            num
            mask
            board
            sum(sum(num*board.*mask))
            stop=true;
        end
        masks(:,:,bd)=mask;
    end
end

%% Part 2
%same but delete winner and run again

while true
    boards(:,:,winner)=[];
    masks(:,:,winner)=[];
    [m m n]=size(boards);
    if n==0
        return
    end
    winner=0;
    
    stop=false;
    for num=game
        if stop
            break
        end
        for bd=1:n
            board=boards(:,:,bd);
            mask=masks(:,:,bd);
            for i = 1:m
                for j = 1:m
                    if board(i,j)==num
                        mask(i,j)=0;
                    end
                end
            end
            checkwin=1;
            for j=1:m
                checkwin=checkwin*sum(mask(j,:))*sum(mask(:,j));
            end
            if checkwin==0
                winner=bd;
                num
                mask
                board
                sum(sum(num*board.*mask))
                stop=true;
            end
            masks(:,:,bd)=mask;
        end
    end
end