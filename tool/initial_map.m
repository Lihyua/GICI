function M=initial_map(map1,map2)
[row,col]=size(map1);
for i=1:row
    for j=1:col
        if map1(i,j)>map2(i,j)
            M(i,j)=1;
        else 
            M(i,j)=0;
        end
    end
end