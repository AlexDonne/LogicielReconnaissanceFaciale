## Author: alexd <alexd@ALEX>
## Created: 2016-12-28

function convertirBaseEnGray ()
  #On va dans le répertoire contenant toutes les images de la base de données
  cd("./Visages"); 
  dgif = dir("*.gif"); 
  djpg=dir ("*.jpg"); 
  M = zeros(128^2, length(dgif)+length(djpg));
  # On lit chaque image, si elle est en couleur on la grise, puis on l'écrit dans un nouveau dossier
  for i=1:length(dgif)
    I=double(imread(dgif(i).name));
    [H,L,M]=size(I);
    #Si besoin, on grise l'image
    if(M==3)
      I=RGB2Gray(I)
    endif
    #On écrit dans un nouveau dossier l'image 
    imwrite(uint8(I),strcat("../Visages2/", dgif(i).name));

  endfor
  
  for i=1:length(djpg)
    I=double(imread(djpg(i).name));
    [H,L,M]=size(I);
    #Si besoin, on grise l'image
    if(M==3)
      I=RGB2Gray(I);
      disp(i);
    endif
    #On écrit dans un nouveau dossier l'image 
    imwrite(uint8(I),strcat("../Visages2/", djpg(i).name));

  endfor
  # On revient au répertoire père
  cd("..");
endfunction
