function transformImagesEn1Vec ()
  global nbImages; 
  global M;
  global histM; 
  global VecProp; 
  global niveauDetails; 
  global u; 
  #On va dans le dossier Visages2 où il y a toutes les images grisées
  cd("Visages2"); 
  #On liste les fichiers gif du répertoire
  dgif = dir("*.gif");
  #On liste les fichiers jpg du répertoire 
  djpg=dir ("*.jpg"); 
  #On déclare la matrice M, qui doit contenir tous les vecteurs colonnes, donc autant de colonnes
  # que de fichiers gif et jpg dans le répertoire
  M = zeros(128^2, length(dgif)+length(djpg));
  nbImages=length(dgif)+length(djpg);
  i=0;
  for i=1:length(dgif)
    #Appelle de la fonction I2Vector, qui retourne le vecteur colonne pour l'image passée en paramètre 
    M(:,i)=I2Vector(imread(dgif(i).name));
  endfor
  
  for i=1:length(djpg)
    M(:,i+length(dgif))=I2Vector(imread(djpg(i).name));
  endfor
  #On revient dans le répertoire principal
  cd("..");
  
  [H,L]=size(M);
  [u,s,v]=svd(M,"econ");
   # Les vecteurs de la matrice u ont la particularité d’être ordonnés dans un ordre d’importance décroissante
  # pour les caractéristiques des visages 
  #On met dans une nouvelle matrice tous les vecteurs colonnes de M en les "purifiant", 
  #avec la même technique que pour AComp dans fonction ComparaisonVisagePropre
  VecProp=((M'*u(:,1:niveauDetails))*u(:,1:niveauDetails)')'; 
  
  #On remplit histM, qui contient les histogrammes de chaque vecteur-colonne de M
  histM=zeros(length(djpg)+length(dgif),255); 
  for i=1:length(djpg)+length(dgif)
    histM(i,:)=hist(M(:,i),255);
  endfor
  
endfunction
