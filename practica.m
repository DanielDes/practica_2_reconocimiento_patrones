clc; clear all; close all;

%///////////imagenes seleccionada para el entrenamiento///////////
img1=imread('img1.png');
img2=imread('img2.png');
img3=imread('img3.png');
img4=imread('img4.png');

% figure;
% subplot(2,2,1);
% image(img1);
% title('Imagen 1');
% subplot(2,2,2);
% image(img2);
% title('Imagen 2');
% subplot(2,2,3);
% image(img3);
% title('Imagen 3');
% subplot(2,2,4);
% image(img4);
% title('Imagen 4');

%///////////preprocesamiento de las imagenes.///////////

%pasando las imagenes a blanco y negro
img1=rgb2gray(img1);
img2=rgb2gray(img2);
img3=rgb2gray(img3);
img4=rgb2gray(img4);
%aplicando ruido gaussiano
img1 = imnoise(img1,'gaussian',0.1);
img2 = imnoise(img2,'gaussian',0.1);
img3 = imnoise(img3,'gaussian',0.1);
img4 = imnoise(img4,'gaussian',0.1);

%aplicando un filtro gaussiano para suavizar las imagenes
img1=imgaussfilt(img1,[2 2]);
img2=imgaussfilt(img2,[2 2]);
img3=imgaussfilt(img3,[2 2]);
img4=imgaussfilt(img4,[2 2]);

%Definiendo clases de img1
a_urban = recortar(img1);
a_rural = recortar(img1);
a_virgen = recortar(img1);

%Definiendo clases de img2
b_urban = recortar(img2);
b_rural = recortar(img2);
b_virgen = recortar(img2);


%Definiendo clases de img3
c_urban = recortar(img3);
c_rural = recortar(img3);
c_virgen = recortar(img3);


%Mostramos las m?scaras creadas
figure;
subplot(2,2,1);
imshow(a_urban);
title('Imagen 1');
subplot(2,2,2);
imshow(a_rural);
title('Imagen 2');
subplot(2,2,3);
imshow(a_virgen);
title('Imagen 3');

figure;
subplot(2,2,1);
imshow(b_urban);
title('Imagen 1');
subplot(2,2,2);
imshow(b_rural);
title('Imagen 2');
subplot(2,2,3);
imshow(b_virgen);
title('Imagen 3');

figure;
subplot(2,2,1);
imshow(c_urban);
title('Imagen 1');
subplot(2,2,2);
imshow(c_rural);
title('Imagen 2');
subplot(2,2,3);
imshow(c_virgen);
title('Imagen 3');

%Guardamos las m?scaras creadas

save('Imagen_A_clases.mat','a_urban','a_rural','a_virgen');
save('Imagen_B_clases.mat','b_urban','b_rural','b_virgen');
save('Imagen_C_clases.mat','c_urban','c_rural','c_virgen');
save('Test_1.mat','img4');