clc
clear all
close all
tic;

%%
    a1=imread('D:\Evaluation-for-Image-Fusion-main\Image\Source-Image\Lytro\ir\1.jpg');
    a2=imread('D:\Evaluation-for-Image-Fusion-main\Image\Source-Image\Lytro\vi\1.jpg');
    a1=im2double(a1); a2=im2double(a2);
    f1=rgb2gray(a1);  f2=rgb2gray(a2);
    [row,col]=size(f1);
%% Acquisition of the initial decision map
    %% Reconstruct the initial fused image according to the transform domain
    f=Reconstruction_on_grad(f1,f2);
    %% Obtain initial decision map using salient information enhancement
    bb=5;
    fmeasure='SAG';
    [Qa,Qb,sf]=salient_map(f,f1,f2,bb,fmeasure);

    map1=zeros(size(row,col));map2=zeros(size(row,col));
    map1=initial_map(Qa,sf);
    map2=imcomplement(map1);
    
%% Optimization and acquisition of the fused image
    %% Post-processing 
    [finmap1,finmap2]=postprocess(map1,map2,f1,f2);
    %% fusin
    F=zeros(size(a1));
    F(:,:,1) = finmap1.*a1(:,:,1) + finmap2.*a2(:,:,1);
    F(:,:,2) = finmap1.*a1(:,:,2) + finmap2.*a2(:,:,2);
    F(:,:,3) = finmap1.*a1(:,:,3) + finmap2.*a2(:,:,3);

  figure,imshow(F);
  toc;