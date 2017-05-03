function [a  ] = mc( clase,media,nume )
aux = [];
for i = 1 : nume
    aux = [aux;clase(i,:)-media];
end
r = (1/nume)*(aux*aux');
a = det(r);
end
