% function [ a ] = getXY( x,y ,rep,e)
% equis = (randn(1,rep) + x );
% ye = (randn(1,rep) + y );
% a = [equis; ye];
% end
% 
function [ a ] = getXY( x,y ,rep,e)
equis = (randn(1,rep)*e + x );
ye = (randn(1,rep)*e + y );
a = [equis; ye];
end

