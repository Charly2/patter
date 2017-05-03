function [medias] = sacar_medias(clases, numc,nume)
    media = [];
    for i = 1 : numc
          c = [];
        for j=1: nume
            c=[c;clases((j+(nume*(i-1))),:)];
        end
        media = [media;mean(c)];
    end
    medias = media;
end