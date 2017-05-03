% Convert the 'concord_ortho_e.tif' image to RGB.
close all;
f = imread('imagen.jpg');
figure('Name','Los clases son','NumberTitle','off');
imshow(f);
[x,y,z]=impixel(f)
v = [f(x,y,1),f(x,y,2),f(x,y,3)]
