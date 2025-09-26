function [finmap1,finmap2]=postprocess(map1,map2 ,f1,f2)
    [row,col]=size(map1);
    tempMap1=zeros(size(row,col));
    tempMap2=zeros(size(row,col));
    tempMap3=zeros(size(row,col));
    midmap1=zeros(size(row,col));
    midmap1=zeros(size(row,col));
    ratio=0.02;  
    area=ceil(ratio*row*col);
    tempMap1=bwareaopen(map1,area);
    tempMap2=1-tempMap1;
    tempMap3=bwareaopen(tempMap2,area);
    midmap1=1-tempMap3;
    midmap2=imcomplement(midmap1); 
%%
    r=5; eps=0.3;
    midmap1 = guidedfilter(f1,midmap1, r,eps);
    midmap2 = guidedfilter(f2,midmap2, r,eps);
%%
    finmap1=zeros(size(row,col));
    finmap2=zeros(size(row,col));
    w=round(row*col*0.00005); %0.00005
    if mod(w,2)==1
        window_size=w;
    else
        window_size=w+1;
    end
    finmap1 = majority_consist_new(midmap1,window_size);
    finmap2 = majority_consist_new(midmap2,window_size);
    [finmap1,finmap2]=Find_assign(finmap1,finmap2);