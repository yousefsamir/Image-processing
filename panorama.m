function [] = panorama( )

img1 = imread('E:\1_computer_vesion\New folder\FB_IMG_1555320961694.jpg');
img2 = imread('E:\1_computer_vesion\New folder\FB_IMG_1555320968941.jpg');
subplot(2,2,1)
imshow(img1)
subplot(2,2,2)
imshow(img2)
 gimg1 = rgb2gray(img1);
 gimg2 = rgb2gray(img2);
p1 = detectSURFFeatures(gimg1);                   
[f1, p1] = extractFeatures(gimg1, p1);

p2 = detectSURFFeatures(gimg2);
[f2, p2] = extractFeatures(gimg2, p2);

mp= matchFeatures(f1,f2);

pts1 = p1(mp(:,1));
pts2 = p2(mp(:,2)); 
tform = estimateGeometricTransform(pts2,pts1,'projective');    

imageSize = size(img1);
panorama = ones([imageSize(1) imageSize(2)*2 3],'like',img1);
Tinv = invert(tform);

blender = vision.AlphaBlender('Operation', 'Binary mask','MaskSource', 'Input port');   
panoramashape = imref2d([1000 1000]);
    
      warpedImage = imwarp(img2, tform, 'OutputView', panoramashape);

     panorama = step(blender, panorama, warpedImage, warpedImage(:,:,1));

    tform.T=tform.T*Tinv.T;
  
    warpedImage = imwarp(img1, tform, 'OutputView', panoramashape);

    panorama = step(blender, panorama, warpedImage, warpedImage(:,:,1));
    
subplot(2,2,3)
imshow(panorama);

figure ;
showMatchedFeatures(img1,img2,pts1,pts2);
end