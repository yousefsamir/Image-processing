im=imread('E:\P_Years\Y3_T2\2 image_processing\Penguins.jpg');
im=rgb2gray(im);
% imshow(im);
% imshow(im2bw(im));
[s1,s2]=size(im);
% hist1=multithresh(im);
% hh=imquantize(im,hist1);
% plot(imhist(im));
[peak,count]=histcounts(im,3);
t=[];
[r,c1]=size(count);
for i=2:c1-1
    t(i)=(count(i)+count(i+1))/2;
end
count
peak
for i=1:s1
    for j=1:s2
        for k=1:c1-2
            if(im(i,j)>=t(k)&& im(i,j)<t(k+1))
                im(i,j)=t(k);
            end
        end
    end
end
  imshow(im);       
% t=clusterdata(double(im),'maxclust',3)
% [k,c]=kmeans(double(im),4);
% imshow(hh,[]);
% x=randn(100,3);
% [h,c]=hist(x,9);
