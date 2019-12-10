im=imread('D:\projectimg\Phase-1\Penguins.jpg');
im=rgb2gray(im);
[s1,s2]=size(im);
[peak,count]=histcounts(im,3);
[r,c1]=size(count);
array=mat2cell(im,[s1/2,s1/2],[s2/2,s2/2]);
s=double(array{1,1});
[x1,x2]=size(im);
new=[];
new(1:x1,1:x2)=0;
[peak1,count1]=histcounts(im,3);
b=(count1(2)+count1(3))/2;
x=regionprops(double(im),'centroid');
cent=cat(1,x.Centroid);
val=min(cent);
g=im(uint8(val(:,1)),uint8(val(:,2)));
% b=b-g;
queue=[];
i=uint8(val(:,1));
j=uint8(val(:,2));
queue(1,1)=uint8(val(:,1));
queue(1,2)=uint8(val(:,2));
[z1,z2]=size(queue);
x=b-g;
for i=1:x1
    for j=1:x2
        if(abs(im(i,j)-x)<=b)
            new(i,j)=0;
        else
            new(i,j)=255;
        end
    end
end
subplot(2,2,1);
imshow(uint8(im)); 
subplot(2,2,2);
imshow(uint8(new));
% while(z1>=1)
%     abs(im(i-1,j-1)-x);
%     if(abs(im(i-1,j-1)-x)>=b)
%         new(i-1,j-1)=255;
%         [z1,z2]=size(queue);
%         queue(z1+1,1)=i-1;
%         queue(z1+2,2)=j-1;
%     end
%     if(abs(im(i-1,j)-x)>=b)
%         new(i-1,j)=255;
%         [z1,z2]=size(queue);
%         queue(z1+1,1)=i-1;
%         queue(z1+2,2)=j;
%     end
%     if(abs(im(i-1,j-1)-x)>=b)
%         new(i-1,j+1)=255;
%         [z1,z2]=size(queue);
%         queue(z1+1,1)=i-1;
%         queue(z1+2,2)=j-1;
%     end
%     if(abs(im(i,j-1)-x)>=b)
%         new(i,j-1)=255;
%         [z1,z2]=size(queue);
%         queue(z1+1,1)=i;
%         queue(z1+2,1)=j-1;
%     end
%     if(abs(im(i,j+1)-x)>=b)
%         new(i,j+1)=255;
%         [z1,z2]=size(queue);
%         queue(z1+1,1)=i;
%         queue(z1+2,1)=j+1;
%     end
%     if(abs(im(i+1,j-1)-x)>=b)
%         new(i+1,j-1)=255;
%         [z1,z2]=size(queue);
%         queue(z1+1,1)=i+1;
%         queue(z1+2,1)=j-1;
%     end
%     if(abs(im(i+1,j)-x)>=b)
%         new(i+1,j)=255;
%         [z1,z2]=size(queue);
%         queue(z1+1,1)=i+1;
%         queue(z1+2,1)=j;
%     end
%     if(abs(im(i+1,j+1)-x)>=b)
%         new(i+1,j+1)=255;
%         [z1,z2]=size(queue);
%         queue(z1+1,1)=i+1;
%         queue(z1+2,1)=j+1;
%     end
%     queue=queue(2:end,:);
%     [z1,z2]=size(queue);
%     i=queue(1,1);
%     j=queue(1,2);
% end
% size(queue)
% imshow(uint8(new));
