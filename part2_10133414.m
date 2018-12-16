%Monica Rao (10133414)
%CISC 881- Medical Imaging and Signal Processing 
% Assignment 2_Part 2 (a,b,c)
clear all
close all
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Part A%

 V = niftiread('PROSTATEx0014.nii');  
 new_V = double(V);     % nomalization of image to show better enhancement in Part A
 N = normalize(new_V);
 
 S_V= N(:,:,2);         % taking a slice of the image in the middle (Normalized data)
 J = imrotate(S_V, 90); 
 imagesc(J);
 colormap gray
 
 
 S_V2=V(:,:,2);         % taking a slice of the image in the middle (Non-Normalized data)
 J2= imrotate(S_V2,90);
 figure (2)             % Plot of Non Normalized data
 imagesc (J2);
 colormap 'gray'
 
 
 hold off               % Histrogram Plot
 figure (3);
 imhist (J);
 title ('Histrogram of Prostatex0014 T2 ');
 ylabel ('Frequency');
 xlabel ('Pixel Intensity');

 hold off                % Equalization Plot 
 figure (4);
 K=histeq (J);
 imagesc(K);
 colormap gray
 
 hold off                % Histrogram of Equalization
 figure (5);
 imhist (K);
 title ('Histrogram Equalized Prostatex0014 T2');
 ylabel ('Frequency');
 xlabel ('Pixel Intensity');
 
 figure (6)              % Plot showing the comparison between original image vs enhanced image             
 subplot(2,1,1);
 imagesc(J);
 colormap gray
 title ('original image')
 
 subplot (2,1,2);
 imagesc(K);
 colormap gray
 title ('enhanced image')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Part B%

hold off                    %2D FFT of the phase-removed Plot 
Y =fft(J2);                 % Remove phase by taking magnitude                  
Y_zerophase=abs(Y);
X = ifft(Y_zerophase);      % taking inverse fft of the image

figure (7)                  % figure showing inverse FFT of phase removed and applying fftshift
imagesc(fftshift(abs(X)))
title ('The inverse 2D FFT of the phase removed image (with using fftshift)');
colormap gray

hold off                     % figure showing inverse FFT of the phase removed
figure (8)
imagesc((abs(X)))
title ('The Inverse 2D FFT of the phase removed image');
colormap gray

hold off                     % Original image Plot 
figure(9);
imagesc(J2);
title ('Original Image') 
colormap gray
 
hold off
figure (10)                  % Plot showing the comparison between original image vs Inverse 2D FFT of the Phase Removed Image  
subplot(2,1,1);
imagesc (J2);
colormap gray
title ('Original image');

subplot(2,1,2);
imagesc(abs(X))
colormap gray
title ('The Inverse 2D FFT of the Phase Removed Image')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Part C%

h = fspecial('laplacian');      %Creating Laplacian filter size 3x3
W = fft2(h);                    % Calculate its equivalent transfer function
Filter_slice = imfilter(J2,h,'replicate'); % appying the filter to the image

hold off                        % Plot showing the 2D frequency response of filter (Laplacian filter as an edge dector filter)
figure (11)
freqz2(h);
title ('2D frequency response of Laplacian Filter')

hold off                        % Figure showing the image with the applied filter to it (edge dector filter)
figure (12)
imagesc (Filter_slice);
title ('Filtered Image')
colormap gray

U = ifft2(Filter_slice);        % Figure showing the image with the applied filter and taking the inverse ifft2
hold off
figure (13)
imshow(abs(U));
colormap gray
title ('Filtered Image after taking the inverse 2D fft')
colormap gray

hold off                        % Figure showing the image with the applied filter and taking the inverse ifft2 (with using fftshift)
figure (14)
imshow(fftshift(abs(U)))
title ('Filtered Image after taking the inverse 2D fft with using fftshift')
colormap 'gray'

hold off                        % Plot showing the comparison between original image vs Inverse 2D FFT of the filtered image 
figure (15)
subplot (2,1,1);
imagesc(J2);
colormap gray
title ('Original image')

subplot(2,1,2);
imshow(abs(U));
colormap ('gray');
title ('Filtered Image after taking the inverse 2D fft')
colormap gray
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%















