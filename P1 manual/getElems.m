function [z,vec]= getElems( f,i )
s1 = 'Mensaje de la clase - ';
s2 = num2str(i);
s = strcat(s1,s2);
figure('Name',s,'NumberTitle','off');
[x,y,z]=impixel(f);
vec = [x,y];
close all;
end

