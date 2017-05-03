function [z]= getElems( f,i )
s1 = 'Mensaje de la clase - ';
s2 = num2str(i);
s = strcat(s1,s2);
figure(i+1);
[x,y,z]=impixel(f);
close(i+1);
end

