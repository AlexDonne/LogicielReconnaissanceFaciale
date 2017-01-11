function  comparaisonVisagePropre ()
  global M; 
  global AComp;  
  global panelResultats; 
  global nbResults; 
  global f;
  global niveauDetails; 
  global VecProp; 
  global u;
 
  if (AComp ==0) # Si aucune image n'a été choisie, il faut la choisir
    choisirImage();
  endif
  
  
  #On transforme le vecteur colonne de l'image choisie en vecteur "propre",  
  # l'utilisateur choisit le niveau de détails, qui correspond au nombre de caractéristiques du visage choisi 
  ACompVecProp=((I2Vector(double(AComp))'*u(:,1:niveauDetails))*u(:,1:niveauDetails)')'; 
  # Pour ce calcul, le premier produit scalaire donne une matrice de taille 1*niveauDetails, la 2ème partie du calcul est une matrice 16384*niveauDetails
  # pour pouvoir réaliser le calcul souhaité (chaque élément du vecteur ligne multiplie la colonne associée), il faut transposer la deuxième matrice
  # pour obtenir une matrice niveauDetails*16384, le produit scalaire est désormais possible entre les 2 matrices, le résultat est une matrice de 1*16384
  #, il ne reste plus qu'à transposer ce résultat pour obtenir le résultat souhaité 
  
  # Maintenant on calcule la norme mais sur les vecteurs propres,
  # on les met dans un matrice D qui contient la norme et l'indice de l'image comparée dans la matrice M
  # on calcule une norme par colonne de VecProp

  D=norm(VecProp-ACompVecProp,"cols");
  [D,C]=sort(D); 
  # Affichage dans la panel, on décale la position à gauche à chaque image
  panelResultats= uipanel("Parent", f, "Title", "Images les plus proches", "position", [0.0,.0,1,.45],"backgroundcolor","red","fontweight","bold","fontangle","oblique","titleposition","centertop"); 
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
