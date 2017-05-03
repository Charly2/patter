warning('off','all')
warning
clc;
close all;
f = imread('img2.jpg'); %lee una imgen

%f = imread('peppers.png');
%z = getElems(f);
clases=[];
close all;
numC = input ('Ingresa el num de clases \n-> ');
numE = input ('Ingresa el num de representantes por clases \n-> ');
[x,y,z]=getClasesInicio(f, numC );
cor = [];
for i = 1 : numC
    %z = getElems(f,i);
    %clases = [clases;z];
    ax=[];
    fprintf('De la clase %d \n',i);
 e=input('\nEscoge la expansion: ');
 ax=getXY(x(i),y(i),numE,e);
 auxRgb = getRGB( ax, numE ,f);
 ax = [ax, [x(i);y(i)]];
 plot(ax(1,:),ax(2,:),'LineStyle','none','Marker','*');
 clases = [clases;auxRgb];
end
legend('Clase 1','Clase 2','Clase 3','Clase 4','Clase 5','Clase 6','Clase 7','Clase 8');

medias = sacar_medias(clases,numC,numE);
opcion=1;
while(opcion ~= 0)
    opcion = input('Ingresa la opcion:\n ');
    switch opcion
        case 1
            clc;
            porcentaje = [];
            Matriz = zeros(numC);
            contador = 1;
            disp('Distancia minima');
            for i=1:numC %------Resustitucion---------
                for j=1:numE
                    vector = double(clases (contador,:));
                    distancia = dist_xc(vector,z,numC);
                    [B,I] = min(distancia);
                    Matriz(i,I) = Matriz(i,I) + 1;
                    contador = contador +1;
                end
                porcentaje = [porcentaje;Matriz(i,i)/numE];
            end
            suma = 0;
            tam =length(porcentaje(:,1));
            for i = 1:tam
               suma =  suma + porcentaje(i,:);
            end
            suma = suma / tam;
            fprintf('Metodo "Resusticion"\nMatriz:\n');
            disp(Matriz);
            fprintf('Porcentaje obtenido = %.02f \n',suma*100);
            contador = 1;
            porcentaje = [];
            Matriz = zeros(numC);
            for i=1:numC %------Cross Validation---------
                for j=1:numE/2
                    vector = double(clases (contador,:));
                    distancia = dist_xc(vector,z,numC);
                    [B,I] = min(distancia);
                    Matriz(i,I) = Matriz(i,I) + 1;
                    contador = contador +1;
                end
                contador = contador + numE/2;
                porcentaje = [porcentaje;Matriz(i,i)/(numE/2)];
            end
            suma = 0;
            tam =length(porcentaje(:,1));
            for i = 1:tam
               suma =  suma + porcentaje(i,:);
            end
            suma = suma / tam;
            fprintf('Metodo "Cross Validation"\nMatriz:\n');
            disp('Numero de iteraciones: 20');
            disp(Matriz);
            fprintf('Porcentaje obtenido = %.02f \n',suma*100);
            contador = 1;
            porcentaje = [];
            Matriz = zeros(numC);
            for i=1:numC %------Leave one out---------
                for j=1:numE
                    vector = double(clases (contador,:));
                    distancia = dist_xc(vector,z,numC);
                    [B,I] = min(distancia);
                    Matriz(i,I) = Matriz(i,I) + 1;
                    contador = contador +1;
                end
            porcentaje = [porcentaje;Matriz(i,i)/numE];
            end
            suma = 0;
            tam =length(porcentaje(:,1));
            for i = 1:tam
               suma =  suma + porcentaje(i,:);
            end
            suma = suma / tam;
            fprintf('Metodo "Leave one out"\nMatriz:\n');
            disp(Matriz);
            fprintf('Porcentaje obtenido = %.02f \n',suma*100);
        case 2
            clc;
            porcentaje = [];
            Matriz = zeros(numC);
            contador = 1;
            disp('Mahalanobis');
            medias = z;
            for i=1:numC %------Resustitucion---------
                for j=1:numE
                    vector = double(clases (contador,:));
                    distancia = dist_xc(vector,z,numC);
                    [B,I] = min(distancia);
                    Matriz(i,I) = Matriz(i,I) + 1;
                    contador = contador +1;
                end
                porcentaje = [porcentaje;Matriz(i,i)/numE];
            end
            suma = 0;
            tam =length(porcentaje(:,1));
            for i = 1:tam
               suma =  suma + porcentaje(i,:);
            end
            suma = suma / tam;
            fprintf('Metodo "Resusticion"\nMatriz:\n');
            disp(Matriz);
            fprintf('Porcentaje obtenido = %.02f \n',suma*100);
            contador = 1;
            porcentaje = [];
            Matriz = zeros(numC);
            for i=1:numC %------Cross Validation---------
                for j=1:numE/2
                    vector = double(clases (contador,:));
                    distancia = dist_xc(vector,z,numC);
                    [B,I] = min(distancia);
                    Matriz(i,I) = Matriz(i,I) + 1;
                    contador = contador +1;
                end
                contador = contador + numE/2;
                porcentaje = [porcentaje;Matriz(i,i)/(numE/2)];
            end
            suma = 0;
            tam =length(porcentaje(:,1));
            for i = 1:tam
               suma =  suma + porcentaje(i,:);
            end
            suma = suma / tam;
            fprintf('Metodo "Cross Validation"\nMatriz:\n');
            disp('Numero de iteraciones: 20');
            disp(Matriz);
            fprintf('Porcentaje obtenido = %.02f \n',suma*100);
            contador = 1;
            porcentaje = [];
            Matriz = zeros(numC);
            for i=1:numC %------Leave one out---------
                for j=1:numE
                    vector = double(clases (contador,:));
                    distancia = dist_xc(vector,z,numC);
                    [B,I] = min(distancia);
                    Matriz(i,I) = Matriz(i,I) + 1;
                    contador = contador +1;
                end
            porcentaje = [porcentaje;Matriz(i,i)/numE];
            end
            suma = 0;
            tam =length(porcentaje(:,1));
            for i = 1:tam
               suma =  suma + porcentaje(i,:);
            end
            suma = suma / tam;
            fprintf('Metodo "Leave one out"\nMatriz:\n');
            disp(Matriz);
            fprintf('Porcentaje obtenido = %.02f \n',suma*100);
        case 3
            medias = z;
            clc;
            porcentaje = [];
            Matriz = zeros(numC);
            contador = 1;
            disp('Maxima Probabilidad');
            for i=1:numC %------Resustitucion---------
                for j=1:numE
                    vector = double(clases (contador,:));
                    distancia = dist_xc(vector,z,numC);
                    [B,I] = min(distancia);
                    Matriz(i,I) = Matriz(i,I) + 1;
                    contador = contador +1;
                end
                porcentaje = [porcentaje;Matriz(i,i)/numE];
            end
            suma = 0;
            tam =length(porcentaje(:,1));
            for i = 1:tam
               suma =  suma + porcentaje(i,:);
            end
            suma = suma / tam;
            fprintf('Metodo "Resusticion"\nMatriz:\n');
            disp(Matriz);
            fprintf('Porcentaje obtenido = %.02f \n',suma*100);
            contador = 1;
            porcentaje = [];
            Matriz = zeros(numC);
            for i=1:numC %------Cross Validation---------
                for j=1:numE/2
                    vector = double(clases (contador,:));
                    distancia = dist_xc(vector,z,numC);
                    [B,I] = min(distancia);
                    Matriz(i,I) = Matriz(i,I) + 1;
                    contador = contador +1;
                end
                contador = contador + numE/2;
                porcentaje = [porcentaje;Matriz(i,i)/(numE/2)];
            end
            suma = 0;
            tam =length(porcentaje(:,1));
            for i = 1:tam
               suma =  suma + porcentaje(i,:);
            end
            suma = suma / tam;
            fprintf('Metodo "Cross Validation"\nMatriz:\n');
            disp('Numero de iteraciones: 20');
            disp(Matriz);
            fprintf('Porcentaje obtenido = %.02f \n',suma*100);
            contador = 1;
            porcentaje = [];
            Matriz = zeros(numC);
            for i=1:numC %------Leave one out---------
                for j=1:numE
                    vector = double(clases (contador,:));
                    distancia = dist_xc(vector,z,numC);
                    [B,I] = min(distancia);
                    Matriz(i,I) = Matriz(i,I) + 1;
                    contador = contador +1;
                end
            porcentaje = [porcentaje;Matriz(i,i)/numE];
            end
            suma = 0;
            tam =length(porcentaje(:,1));
            for i = 1:tam
               suma =  suma + porcentaje(i,:);
            end
            suma = suma / tam;
            fprintf('Metodo "Leave one out"\nMatriz:\n');
            disp(Matriz);
            fprintf('Porcentaje obtenido = %.02f \n',suma*100);
        case 4
            medias = sacar_medias(clases,numC,numE);
            clc
            k = input('introduce k\n-> ');
            valido = 0;
            while valido ~= 1
                if k <= 20
                    if mod(k,2)== 0 %verifica que k sea impar
                        disp('k no es impar. Intenta de nuevo');
                        k = input('introduce k\n-> ');
                    else %si es impar y menor a 20, valido = 1 y rompe el while
                        valido = 1;
                    end
                end
            end
            clc;
            porcentaje = [];
            Matriz = zeros(numC);
            contador = 1;
            disp('Distancia minima');
            for i=1:numC %------Resustitucion---------
                for j=1:numE
                    vector = double(clases (contador,:));
                    distancia = dist_xc(vector,z,numC);
                    [B,I] = min(distancia);
                    Matriz(i,I) = Matriz(i,I) + 1;
                    contador = contador +1;
                end
                porcentaje = [porcentaje;Matriz(i,i)/numE];
            end
            suma = 0;
            tam =length(porcentaje(:,1));
            for i = 1:tam
               suma =  suma + porcentaje(i,:);
            end
            suma = suma / tam;
            fprintf('Metodo "Resusticion"\nMatriz:\n');
            disp(Matriz);
            fprintf('Porcentaje obtenido = %.02f \n',suma*100);
            contador = 1;
            porcentaje = [];
            Matriz = zeros(numC);
            for i=1:numC %------Cross Validation---------
                for j=1:numE/2
                    vector = double(clases (contador,:));
                    distancia = dist_xc(vector,z,numC);
                    [B,I] = min(distancia);
                    Matriz(i,I) = Matriz(i,I) + 1;
                    contador = contador +1;
                end
                contador = contador + numE/2;
                porcentaje = [porcentaje;Matriz(i,i)/(numE/2)];
            end
            suma = 0;
            tam =length(porcentaje(:,1));
            for i = 1:tam
               suma =  suma + porcentaje(i,:);
            end
            suma = suma / tam;
            fprintf('Metodo "Cross Validation"\nMatriz:\n');
            disp('Numero de iteraciones: 20');
            disp(Matriz);
            fprintf('Porcentaje obtenido = %.02f \n',suma*100);
            contador = 1;
            porcentaje = [];
            Matriz = zeros(numC);
            for i=1:numC %------Leave one out---------
                for j=1:numE
                    vector = double(clases (contador,:));
                    distancia = dist_xc(vector,z,numC);
                    [B,I] = min(distancia);
                    Matriz(i,I) = Matriz(i,I) + 1;
                    contador = contador +1;
                end
            porcentaje = [porcentaje;Matriz(i,i)/numE];
            end
            suma = 0;
            tam =length(porcentaje(:,1));
            for i = 1:tam
               suma =  suma + porcentaje(i,:);
            end
            suma = suma / tam;
            fprintf('Metodo "Leave one out"\nMatriz:\n');
            disp(Matriz);
            fprintf('Porcentaje obtenido = %.02f \n',suma*100);
        case 9
            vector = getVector(f);
    end
end    



    