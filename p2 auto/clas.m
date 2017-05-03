function [medias] = clas(clases, numc,nume)
    media = [];
    for i = 1 : numc
          c = [];
        for j=1: nume
            c=[c;clases((j+(nume*(i-1))),:)];
        end
        r = c(:,1)'
        g = c(:,2)'
        b = c(:,3)'
       nueva_clase = [r;g;b]
       media = [media;nueva_clase]
    end
    medias = media;
end