function [dist] = dist_xc(x,medias,numc)
dists=[];
    for i = 1 : numc
        dists = [dists; norm(x-medias(i,:))];
    end
    dist = dists;
end