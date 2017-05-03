%Algoritmo de la cadena
clc;
warning off all;
clear all;
close all;
[filename,pathname] = uigetfile('*.jpg','Selecciona una imagen');
f = imread(char(filename));
alto = length(f(:,1));
ancho = length(f(1,:,1));
close all;
umbral = 1;
numM = input('cuantas muestras quieres? ->');
acept = 0;
x = [];
y = [];
for i=1:numM
    x = [x;randi([1 ancho],1,1)];
    y = [y;randi([1 alto],1,1)];
end

p = getRGB(x,y,numM,f);
z = double(p);
% while(acept ~= 1)
%     clc;
%     [x,y,z]=impixel(f);
%     l = length(z(:,1));
%     if(isequal(l,numM)==0)
%         fprintf('Numero de muestras incorrecto\n');
%     else
%         acept = 1;
%     end
% end
numC = input('Cuantas clases quieres?');
close all;
parar = 0;
grupos = [0];
while(length(grupos(:,1))~=numC)
    clc;
    close all;
    fprintf('umbral = %d\n',umbral);
    matriz = zeros(numM);
    contadorG  = [];
    for i=1:numM
       contadorG = [contadorG;1];
    end
    grupos = [];
    grupos = [grupos;z(1,:)];
    matriz(1,1) = 1;
    contadorG(1,:) = contadorG(1,:)+1;
    for i=2:numM
        dist=[];
        for j=1:length(grupos(:,1))
            dist = [dist;norm(grupos(j,:) - z(i,:))];%Distancia a cada grupo  
        end
        [B,I] = min(dist);
        if B < umbral
            grupos(I,:) = (grupos (I,:)+z(i,:))/2;
            matriz (I,contadorG(I,:)) = i;
            contadorG (I,:)= contadorG (I,:)+1;
            
        else
            matriz (length(grupos(:,1))+1,contadorG(length(grupos(:,1))+1,:)) = i;
            contadorG (length(grupos(:,1))+1,:)= contadorG (length(grupos(:,1))+1,:)+1;
            grupos = [grupos;z(i,:)];
            
        end
    end
    umbral = umbral + 10;
end
clc;
fprintf('Umbral = %d',umbral);
imshow(f);
hold on;
count = 1;
names = string({});
for i=1:length(matriz)
   clase = [];
   clase = crearClase(matriz(i,:),x,y);
   if isempty(clase) ==0
       clase = clase';
       names = [names strcat('clase',num2str(count))];
       plot(clase(1,:),clase(2,:),'LineStyle','none','Marker','.','MarkerSize',40);
       count = count +1;
   end
end
legend(names);
disp('Fin del programa');



