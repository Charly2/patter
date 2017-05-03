function [  ] = clr(  )
colorVec = hsv(5);
% Plot and change the color for each line
BLOCK = 5x1 cell array
TIME = 5x1 cell array
hold on;
for i = 1:length(BLOCK)
    plot(TIME(i),BLOCK(i),'Color',colorVec(i,:))
end
hold off;

end

