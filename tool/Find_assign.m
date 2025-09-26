function [f1,f2]=Find_assign(f1,f2)

[row,col]=size(f1);

for i=1:row
    for j=1:col
        if f1(i,j)==0 && f2(i,j)==0
            f2(i,j)=1;
            f1(i,j)=0;
        end
    end
end
