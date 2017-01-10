function  comparaisonVisagePropre ()
  global M; 
  global AComp;  
  global panelResultats; 
  global nbResults; 
  global f;
  global niveauDetails; 
 
  if (AComp ==0) # Si aucune image n'a été choisie, il faut la choisir
    choisirImage();
  endif
  [H,L]=size(M);
  VecProp=zeros(16384,L); 
  [u,s,v]=svd(M,"econ");
  # Les vecteurs de la matrice u ont la particularité d’être ordonnés dans un ordre d’importance décroissante
  # pour les caractéristiques des visages 
  ACompVec=I2Vector(double(AComp));
  ACompVecProp=zeros(128^2,1);
  
  #On transforme le vecteur colonne de l'image choisie en vecteur "propre",  
  # l'utilisateur choisit le niveau de détails, qui correspond au nombre de caractéristiques du visage choisi 
  ACompVecProp=((ACompVec'*u(:,1:niveauDetails))*u(:,1:niveauDetails)')'; 
  # Pour ce calcul, le premier produit scalaire donne une matrice de taille 1*niveauDetails, la 2ème partie du calcul est une matrice 16384*niveauDetails
  # pour pouvoir réaliser le calcul souhaité (chaque élément du vecteur ligne multiplie la colonne associée), il faut transposer la deuxième matrice
  # pour obtenir une matrice niveauDetails*16384, le produit scalaire est désormais possible entre les 2 matrices, le résultat est une matrice de 1*16384
  #, il ne reste plus qu'à transposer ce résultat pour obtenir le résultat souhaité 
  # On met dans une nouvelle matrice tous les vecteurs colonnes de M en les "purifiant", avec la même technique

  VecProp=((M'*u(:,1:niveauDetails))*u(:,1:niveauDetails)')'; 

  # Maintenant on calcule la norme mais sur les vecteurs propres,
  # on les met dans un matrice D qui contient la norme et l'indice de l'image comparée dans la matrice M
  # on calcule une norme par colonne de VecProp

  D=norm(VecProp-ACompVecProp,"cols");
  [D,C]=sort(D); 
  disp(D);
  # Affichage dans la panel, on décale la position à gauche à chaque image
  panelResultats= uipanel("Parent", f, "Title", "Images les plus proches", "position", [0.0,.0,1,.45],"backgroundcolor","red","fontweight","bold","fontangle","oblique","titleposition","centertop","foregroundcolor","white"); 
  for i=1:nbResults
    #S'il n'y a qu'une image à afficher, la position est particulière, on ne peut pas grossir un peu l'image
    if (nbResults==1) 
      axes("parent", panelResultats , "position", [0, 0, 0.999, 0.999]);
    # S'il y en a plusieurs on peut grossir un peu l'image, d'où le "*1.2" dans la largeur et la hauteur
    else    
      if(i==1) axes("parent", panelResultats , "position", [0, 0.4-0.5/nbResults, 1/nbResults*1.2, 0.5]);
      else axes("parent", panelResultats , "position", [-1/nbResults+(i)*(1/nbResults), 0.4-0.5/nbResults, 1/nbResults*1.2, 0.5]);
      endif
    endif
    imshow(uint8(Vector2I(M(:,C(i)))));
  endfor
  
endfunction
