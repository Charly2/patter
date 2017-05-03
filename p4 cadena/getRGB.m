function [ a ] = getRGB( x,y,rep,f)
v = [];
tamx = length(f(:,1,1));
tamy = length(f(1,:,1));
for i = 1 : rep
    xrgb=int64(x(i,:));
    yrgb=int64(y(i,:));
    if(xrgb <= tamx)&&(yrgb <= tamy)
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