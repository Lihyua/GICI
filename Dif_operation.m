function Map=Dif_operation(f,f1)
[row,col]=size(f);
Map=zeros(row,col);
for i=1:row
    for j=1:col
        Map(i,j)=f(i,j)-f1(i,j);
    end
end