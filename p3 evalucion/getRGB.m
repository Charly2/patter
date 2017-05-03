% function [ a ] = getRGB( XY, numE ,f)
% v = [];
% for i = 1 : numE
%     x=int64( XY(1,i));
%     y=int64( XY(2,i));
%     vrgb = [f(x,y,1),f(x,y,2),f(x,y,3)];
%     v = [v;vrgb];
% end
% a = v;
% end
% 
function [ a ] = getRGB( a, rep ,f)
v = [];
tamx = length(f(:,1,1));
tamy = length(f(1,:,1));
for i = 1 : rep
    xrgb=int64(a(1,i));
    yrgb=int64(a(2,i));
    if(xrgb < tamx)&&(yrgb < tamy)
        vrgb = [f(yrgb,xrgb,1),f(yrgb,xrgb,2),f(yrgb,xrgb,3)];
        v = [v;vrgb];
    else
        yrgb = yrgb/2;
        xrgb = xrgb/2;
        vrgb = [f(yrgb,xrgb,1),f(yrgb,xrgb,2),f(yrgb,xrgb,3)];
        v = [v;vrgb];
    end  
end
a = v;
end

