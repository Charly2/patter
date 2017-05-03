clc;
f = imread('imagen.jpg'); %lee una imgen
%z = getElems(f);
clases=[];
close all;
numC = input ('Ingresa el num de clases \n-> ');
numE = input ('Ingresa el num de representantes por clases \n-> ');
vec=[];
for i = 1 : numC
    [z,veca] = getElems(f,i);
    vec = [vec;veca];
    clases = [clases;z];
end
vector = getVector(f);
medias = sacar_medias(clases,numC,numE);
opcion=1;
figure(1);
imshow(f);
hold on;
    plo = [];
    for i = 1 : numC
          c = [];
        for j=1: numE
           c = [c;vec(j+(numE*(i-1)),:)];
        end
      
      plot(c(:,1),c(:,2),'LineStyle','none','Marker','*');
    end
  
legend('Clase 1','Clase 2','Clase 3','Clase 4','Clase 5','Clase 6','Clase 7','Clase 8');

while(opcion ~= 0)
    opcion = input('Ingresa la opcion:\n ');
    switch opcion
        case 1
            distancia = dist_xc(vector,medias,numC);
            [B,I] = min(distancia);
            disp('Metodo Distancia minima');
            fprintf('X esta mas cerca de la clase %d: ',I);
            fprintf('%.5f\n\n',B);
        case 2
            c = [];
            disM = [];
            for i = 1 : numC
                  c = [];
                for j=1: numE
                    c=[c;clases((j+(numE*(i-1))),:)];
                end
                disM = [disM;mahal(vector,c)];
            end
            [B,I] = min(disM);
            disp('Metodo Distancia Mahalanobis');
            fprintf('X esta mas cerca de la clase %d: ',I);
            fprintf('%.5f\n\n',B);
        case 3
            c = [];
            pr=[];
            disM = [];
            for i = 1 : numC
                  c = [];
                for j=1: numE
                    c=[c;clases((j+(numE*(i-1))),:)];
                end
               m = mahal(vector,c);
               mh = m*m;
               a = -mh/2;
               e = mc(c,medias(i,:),numE);
               d = exp(a)/(sqrt(e)*(2*pi));
               pr = [pr;m];
            end
            for i = 1:numC
                    B = B + pr(i);
            end
            for i=1:numC
                A = pr(i,:);
                n(i,:)= (A/B)*100;
            end
            [B,I] = max(n);
            [a,b] =min(pr);
            disp('Metodo: Maxima Probabilidad ');
            fprintf('X esta mas cerca de la clase %d: ',b);
            fprintf('%.5f\n',B);
        case 4
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
            dist = kv(clases,vector,numC,numE);
            
            valores = encontrar(dist,k,numE,numC);
        case 9
            vector = getVector(f);
    end
end    

    