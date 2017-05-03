function [valores] = encontrar (distancias,k,rep,Nc)
    %len = length(distancias(:,1));    
    [B,I] = sort(distancias);
    %identificar a la clase que pertenece
    count=1;
    class = [];
    for i = 1:Nc
        num = [];
        for j = 1:rep
            num = [num,j+(rep*(i-1))];
        end
        class = [class;num];
    end
    clar = [];
    for i = 1:Nc
        clar=[clar;0];%cada fila representa una clase
    end
    while (count < k)
        aux = I(count);
        r = getCl( Nc, rep,class,aux);
        clar(r) = clar(r) +1;
        count=count+1;
    end
    %identificar qué clase tiene mas elementos cerca
    [B,I] = max(clar);
    disp('Metodo: K-vecinos ');
            fprintf('X esta mas cerca de la clase %d: ',I);
            fprintf('con %.5f vecinos \n',B);
    valores = class;
end

