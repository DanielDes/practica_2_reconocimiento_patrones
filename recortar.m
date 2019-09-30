function [imagen] = recortar(img1)
    figure;
    imshow(img1);

    h = imfreehand; 
    pos = getPosition(h);
    pos=round(pos);
    pos(1,1)
    BW = roipoly(img1,pos(:,1),pos(:,2));
    for i=1:255
        for j=1:255
          if BW(i,j)==1
              img1(i,j)=img1(i,j);
          else
              img1(i,j)=1;
          end
        end
    end
    imagen=img1;
end
