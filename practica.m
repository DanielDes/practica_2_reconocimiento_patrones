clc; clear all; close all;

%///////////imagenes seleccionada para el entrenamiento///////////
img1=imread('img1.png');
img2=imread('img2.png');
img3=imread('img3.png');
img4=imread('img4.png');

figure;
subplot(2,2,1);
image(img1);
title('Imagen 1');
subplot(2,2,2);
image(img2);
title('Imagen 2');
subplot(2,2,3);
image(img3);
title('Imagen 3');
subplot(2,2,4);
image(img4);
title('Imagen 4');

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

%clasificando datos de img1
clase1_1=recortar(img1);
figure;
imshow(clase1_1);