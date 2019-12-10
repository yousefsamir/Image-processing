function [  ] = SURFF(  )

     Img1 = imread('E:\1_computer_vesion\New folder\FB_IMG_1555320961694.jpg');
     Img2 = imread('E:\1_computer_vesion\New folder\FB_IMG_1555320968941.jpg');
     Img1 = rgb2gray(Img1);
     Img2 = rgb2gray(Img2);
     points1 = detectSURFFeatures(Img1);
     points2 = detectSURFFeatures(Img2);
     [f1,point1] = extractFeatures(Img1,points1);
     [f2,point2] = extractFeatures(Img2,points2);
     indexPairs = matchFeatures(f1,f2);
     size(point1);
     point1 = point1(indexPairs(1:20,1));
     point2 = point2(indexPairs(1:20,2));  
%      showMatchedFeatures(Img1,Img2,point1,point2);
     [tform,x,y] = estimateGeometricTransform(point2,point1,'similarity');
     Tinv = invert(tform);
     tform.T = Tinv.T * tform.T;
     modified_img = imwarp(Img2,tform,'OutputView',imref2d(size(Img2)));
     imshow(modified_img)
     s = size(Img1);
     [xlim(1,:), ylim(1,:)] = outputLimits(tform, [1 s(2)], [1 s(1)]);
     new = zeros(s(1),s(2)+100,'like', Img1);
     new(1:s(1),1:s(2))=Img1;
     final = imfuse(new,modified_img);
     subplot(2,2,1)
     imshow(Img1)
     subplot(2,2,2)
     imshow(Img2)
     subplot(2,2,3)
     imshow(final)

%      str_point = 20;
%      fixed_points  = [];
%      moving_points = [];
%      I_1_points = point1.selectStrongest(str_point);
%      I_2_points = point2.selectStrongest(str_point);
%      
%      for i=1:str_point
%          var1 = I_1_points(i).Location;
%          fixed_points(i,2)  = uint16(var1(1))-1;
%          fixed_points(i,1)  = uint16(var1(2))-1;
%          
%          var1 = I_2_points(i).Location;
%          moving_points(i,2) = uint16(var1(1))-1;
%          moving_points(i,1) = uint16(var1(2))-1;
%      end
%     fixed_points;
    
%     x=fixed_points(1,:);
%     subplot(2,2,2)
%     imshow(Img1)
%     hold on
%     plot(x(1,2),x(1,1),'x','LineWidth',2,'Color','yellow');
%     M_points2 = min_dist(fixed_points,moving_points,Img1,Img2,str_point);
%     showMatchedFeatures(Img1,Img2,fixed_points,M_points2);
%     [tform,x,y] = estimateGeometricTransform(M_points2,fixed_points,'similarity');
%     tform_new = reshape(tform.A,[3 2]);
%     tform_new(:,3) = [0 0 1]';
%     tform_new(2,1)
%     tform_new = affine2d(tform_new);
%     tform_new = affine2d([1 0 0;1 .5 0;0 0 1]);
%      modified_img = imwarp(Img2(:,:,1),tform,'OutputView',imref2d(size(Img2(:,:,1))));
%      subplot(2,2,1)
%      imshow(Img1(:,:,1));
% %      plot(points1.selectStrongest(1));
%      subplot(2,2,2)
%      imshow(modified_img); 
% %      plot(points2.selectStrongest(8));
%      final = imfuse(Img1(:,:,1),modified_img);
%      subplot(2,2,3)
%      imshow(final)
    
    
end

