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


vector = getVector(f);
vector = double(vector);
medias = sacar_medias(clases,numC,numE);
medias = z;
opcion=1;
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
                    c=[c;double(clases((j+(numE*(i-1))),:))];
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
            
            for i = 1 : numC
                  c = [];
                for j=1: numE
                    c=[c;double(clases((j+(numE*(i-1))),:))];
                end
               m = mahal(vector,c);
               mh = m*m;
               a = -mh/2;
               e = mc(c,medias(i,:),numE);
               d = exp(a)/(sqrt(e)*(2*pi));
               pr = [pr;m];
            end
            disM = [];
            for i = 1 : numC
                  c = [];
                for j=1: numE
                    c=[c;double(clases((j+(numE*(i-1))),:))];
                end
                disM = [disM;mahal(vector,c)];
            end
            t=0;
            nam = isnan(disM);
            for r = 1: numC
                if(nam(r)~=1)
                    t =  t + disM(r); 
                end
            end
            MaP = [];
            for r = 1: numC
                if(nam(r)~=1)
                MaP = [MaP, (disM(r)/t)*100 ];
                end
            end
            y = max(MaP);
            disp('Metodo: Maxima Probabilidad ');
            fprintf('X esta mas cerca de la clase %d: ',I);

            fprintf('con una probabilidad de %.5f \n',y*.98);
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

    