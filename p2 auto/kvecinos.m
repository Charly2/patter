function [medias] = kvecinos(clases,vector, numc,nume)
    media = [];
    for i = 1 : numc
          c = [];
        for j=1: nume
           c = [c;norm(vector - clases((j+(nume*(i-1))),:))];
        end
        media = [media;c];
    end
    medias = media;
end
            %aux = [aux ; norma];
