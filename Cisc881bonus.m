% Monica Rao 
%CISC 881 Assignment 1 

% Question 5  Part c Bonus of the Assignment 1

clear all
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ADC 
I= imread('ADC.png');
figure (1);
imshow(I);

S_I=I(:,:,2);            % taking a slice of the image in the middle
J=imresize(S_I, 0.25);   %reduced the image size by 1/4
figure (2);
imshow(J);

hold off
figure (3);
imhist (J);
title ('Intensity Histogram Plot for ADC');
ylabel ('Frequency');
xlabel ('Pixel Intensity');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%BVAL
hold off
I2= imread('BVAL.png');
figure(4);
imshow(I2);

S_I2=I2(:,:,2);            % taking a slice of the image in the middle
J2=imresize(S_I2, 0.25);   %reduced the image size by 1/4
figure (5);
imshow(J2);

hold off 
figure (6);
imhist (J2);
title ('Intensity Histogram Plot for BVAL');
ylabel ('Frequency');
xlabel ('Pixel Intensity');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%t2_trans
hold off
I3= imread('t2_trans.png');
figure (7);
imshow(I3);


S_I3=I3(:,:,2);            % taking a slice of the image in the middle
J3=imresize(S_I3, 0.25);   %reduced the image size by 1/4
figure (8);
imshow(J3);

hold off 
figure (9);
imhist (J3);
title ('Intensity Histogram Plot for t2trans');
ylabel ('Frequency');
xlabel ('Pixel Intensity');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Ktrans
hold off
I4= imread('Ktrans.png');
figure (10);
imshow(I4);

S_I4=I4(:,:,2);            % taking a slice of the image in the middle
J4=imresize(S_I4, 0.25);   %reduced the image size by 1/4
figure (11);
imshow(J4);

hold off
figure (12);
imhist (J4);
title ('Intensity Histogram Plot for Ktrans');
ylabel ('Frequency');
xlabel ('Pixel Intensity');




