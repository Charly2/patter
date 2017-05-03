function [clase] = crearClase(Matriz,x,y)
    tam = length(Matriz(1,:));
    class = [];
    for j=1:tam
        coord = Matriz (1,j);
        if coord ~=0
           class = [class;x(coord,:) y(coord,:)]; 
        end
    end
    clase = class;
end

