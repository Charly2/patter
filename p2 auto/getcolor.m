function [ I ] = getcolor(vector)
colores=[225,229,0;76,0,153;0, 176,246;255,0,0;0,188,44;0,0,255;0,0,0];

distancia = dist_xc(vector,colores,7);
[B,I] = min(distancia);
end

