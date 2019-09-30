load('Imagen_A_clases.mat','a_urban','a_rural','a_virgen');
load('Imagen_B_clases.mat','b_urban','b_rural','b_virgen');
load('Imagen_C_clases.mat','c_urban','c_rural','c_virgen');


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

%Preparamos los vectores de media para cada clase por imagen

a_urbv_mean = zeros(1,3);
a_rural_mean = zeros(1,3);
a_virgen_mean = zeros(1,3);


b_urbv_mean = zeros(1,3);
b_rural_mean = zeros(1,3);
b_virgen_mean = zeros(1,3);


c_urbv_mean = zeros(1,3);
c_rural_mean = zeros(1,3);
c_virgen_mean = zeros(1,3);

%Iniciamos un arreglo donde pondremos los contadores de cada clase por cada
%imagen.
pixel_counters = zeros(3,3);

a_urbv_pix = 0;
a_rural_pix = 0;
a_virgen_pix = 0;

b_urbv_pix = 0;
b_rural_pix = 0;
b_virgen_pix = 0;

c_urbv_pix = 0;
c_rural_pix = 0;
c_virgen_pix = 0;

rows = size(a_urban,1);
columns = size(a_urban,2);

for x = 1:rows
    for y = 1:columns
        
        if(a_urban(x,y)>1)
            pixel_counters(1,1) = pixel_counters(1,1) + 1;
            a_urbv_pix = a_urbv_pix + 1;
            double_pixel_value = double(a_urban(x,y));
            a_urbv_mean = a_urbv_mean + [double_pixel_value,x,y];
        end
        if(a_rural(x,y)>1)
            pixel_counters(1,2) = pixel_counters(1,2) + 1;
            a_rural_pix = a_rural_pix + 1;
            double_pixel_value = double(a_rural(x,y));
            a_rural_mean = a_rural_mean + [double_pixel_value,x,y];
        end
        if(a_virgen(x,y)>1)
            pixel_counters(1,3) = pixel_counters(1,3) + 1;
            a_virgen_pix = a_virgen_pix + 1;
            double_pixel_value = double(b_virgen(x,y));
            a_virgen_mean = a_virgen_mean + [double_pixel_value,x,y];
        end
        
        if(b_urban(x,y)>1)
            pixel_counters(2,1) = pixel_counters(2,1) + 1;
            b_urbv_pix = b_urbv_pix + 1;
            double_pixel_value = double(b_urban(x,y));
            b_urbv_mean = b_urbv_mean + [double_pixel_value,x,y];
        end
        if(b_rural(x,y)>1)
            pixel_counters(2,2) = pixel_counters(1,2) + 1;
            b_rural_pix = b_rural_pix + 1;
            double_pixel_value = double(a_rural(x,y));
            b_rural_mean = b_rural_mean + [double_pixel_value,x,y];
        end
        if(b_virgen(x,y)>1)
            pixel_counters(2,3) = pixel_counters(2,3) + 1;
            b_virgen_pix = b_virgen_pix + 1;
            double_pixel_value = double(b_virgen(x,y));
            b_virgen_mean = b_virgen_mean + [double_pixel_value,x,y];
        end
        
        if(c_urban(x,y)>1)
            pixel_counters(3,1) = pixel_counters(3,1) + 1;
            c_urbv_pix = c_urbv_pix + 1;
            double_pixel_value = double(c_urban(x,y));
            c_urbv_mean = c_urbv_mean + [double_pixel_value,x,y];
        end
        if(c_rural(x,y)>1)
            pixel_counters(3,2) = pixel_counters(3,2) + 1;
            c_rural_pix = c_rural_pix + 1;
            double_pixel_value = double(c_rural(x,y));
            c_rural_mean = c_rural_mean + [double_pixel_value,x,y];
        end
        if(c_virgen(x,y)>1)
            pixel_counters(3,3) = pixel_counters(3,3) + 1;
            c_virgen_pix = c_virgen_pix + 1;
            double_pixel_value = double(c_virgen(x,y));
            c_virgen_mean = c_virgen_mean + [double_pixel_value,x,y];
        end
        
    end
end


%Terminamos de calcular las medias


a_urbv_mean = a_urbv_mean / pixel_counters(1,1);
a_rural_mean = a_rural_mean / pixel_counters(1,2);
a_virgen_mean = a_virgen_mean / pixel_counters(1,3);

b_urbv_mean = b_urbv_mean / pixel_counters(2,1);
b_rural_mean = b_rural_mean / pixel_counters(2,2);
b_virgen_mean = b_virgen_mean / pixel_counters(2,3);

c_urbv_mean = c_urbv_mean / pixel_counters(3,1);
c_rural_mean = c_rural_mean / pixel_counters(3,2);
c_virgen_mean = c_virgen_mean / pixel_counters(3,3);

pixel_count = rows * columns;

%Ahora vamos a sacar la probabilidad para cada clase

a_urbv_prob = proba(pixel_counters(1,1),pixel_count);
a_rural_prob = proba(pixel_counters(1,2),pixel_count);
a_virgen_prob = proba(pixel_counters(1,3),pixel_count);

b_urbv_prob = proba(pixel_counters(2,1),pixel_count);
b_rural_prob = proba(pixel_counters(2,2),pixel_count);
b_virgen_prob = proba(pixel_counters(2,3),pixel_count);

c_urbv_prob = proba(pixel_counters(3,1),pixel_count);
c_rural_prob = proba(pixel_counters(3,2),pixel_count);
c_virgen_prob = proba(pixel_counters(3,3),pixel_count);


%Preparamos la medias para la covarianza

urbvan_mean = (a_urbv_mean + b_urbv_mean + c_urbv_mean)/3;
rural_mean = (a_rural_mean + b_rural_mean + c_rural_mean) / 3;
virgen_mean = (a_virgen_mean + b_virgen_mean + c_virgen_mean) / 3;

%Preparamos las matrizes de covarizanza

urb_cov = zeros(3,3);
rur_cov = zeros(3,3);
vir_cov = zeros(3,3);


for x = 1:rows
    for y = 1:columns
        
        if(a_urban(x,y)>1)
            double_pixel_value = double(a_urban(x,y));
            ua = [double_pixel_value,x,y];
            urb_cov = urb_cov + ((ua - urbvan_mean)' * (ua - urbvan_mean));
        end
        if(a_rural(x,y)>1)
            double_pixel_value = double(a_rural(x,y));
            ra = [double_pixel_value,x,y];
            rur_cov = rur_cov + ((ra - rural_mean)' * (ra - rural_mean));
        end
        if(a_virgen(x,y)>1)
            double_pixel_value = double(a_virgen(x,y));
            va = [double_pixel_value,x,y];
            vir_cov = vir_cov + ((va - virgen_mean)' * (va - virgen_mean));
        end
        
        if(b_urban(x,y)>1)
            double_pixel_value = double(b_urban(x,y));
            ub = [double_pixel_value,x,y];
            urb_cov = urb_cov + ((ub - urbvan_mean)' * (ub - urbvan_mean));
        end
        if(b_rural(x,y)>1)
            double_pixel_value = double(b_rural(x,y));
            rb = [double_pixel_value,x,y];
            rur_cov = rur_cov + ((rb - rural_mean)' * (rb - rural_mean));
        end
        if(b_virgen(x,y)>1)
            double_pixel_value = double(b_virgen(x,y));
            vb = [double_pixel_value,x,y];
            vir_cov = vir_cov + ((vb - virgen_mean)' * (vb - virgen_mean));
        end
        
        if(c_urban(x,y)>1)
            double_pixel_value = double(c_urban(x,y));
            uc = [double_pixel_value,x,y];
            urb_cov = urb_cov + ((uc - urbvan_mean)' * (uc - urbvan_mean));
        end
        if(c_rural(x,y)>1)
            double_pixel_value = double(c_rural(x,y));
            rc = [double_pixel_value,x,y];
            rur_cov = rur_cov + ((rc - rural_mean)' * (rc - rural_mean));
        end
        if(c_virgen(x,y)>1)
            double_pixel_value = double(c_virgen(x,y));
            vc = [double_pixel_value,x,y];
            vir_cov = vir_cov + ((vc - virgen_mean)' * (vc - virgen_mean));
        end
        
    end
end

%terminamos de sacar covarianzas 
vir_cov = vir_cov / (3 * (pixel_counters(3,1) + pixel_counters(3,2) + pixel_counters(3,3)));
urb_cov = urb_cov / (3 * (pixel_counters(1,1) + pixel_counters(2,1) + pixel_counters(3,1)));
rur_cov = rur_cov / (3 * (pixel_counters(1,2) + pixel_counters(2,2) + pixel_counters(3,2)));


in_urb_cov = inv(urb_cov);
in_rur_cov = inv(rur_cov);
in_vir_cov = inv(vir_cov);

urbvan_mean = urbvan_mean';
rural_mean = rural_mean';
virgen_mean = virgen_mean';

load('Test_1.mat','img4');
figure;
imshow(img4);
test_1 = zeros(rows,columns);
img4 = imread('img4.PNG');
img4 = rgb2gray(img4);

img4=imgaussfilt(img4);
ima4=double(img4);
for x = 1:rows
    for y = 1:columns
        
        double_value = double(img4(x,y));
        V = [double_value,x,y];
        
        p_urban = exp((-1/2)*(V'- urbvan_mean)'*in_urb_cov*(V'- urbvan_mean))/sqrt((2*pi)*(det(urb_cov)));
        p_rural = bayes_disc(V,rural_mean,rur_cov);
        p_virgen = bayes_disc(V,virgen_mean,vir_cov);
        
        value = 0;
        if( p_urban > p_rural && p_urban > p_virgen)
            value = 250;
        else 
            if (p_rural > p_urban && p_rural > p_virgen)
                value = 128;
            else 
                value = 0;
            end
        end
        
        test_1(x,y) = value;
    end
end


figure;
colormap gray;
imagesc(prueba1);