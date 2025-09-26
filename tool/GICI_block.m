function f=GICI_block(f1,f2,f3)
r=0.5;
[row,col]=size(f1);
for i=1:row
    for j=1:col
        f(i,j)=(f1(i,j)+f2(i,j))-f3(i,j)*r;
    end
end