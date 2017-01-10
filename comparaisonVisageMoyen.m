function  comparaisonVisageMoyen ()
  global M; 
  global AComp; 
  global panelResultats;
  global nbResults;
  global f; 
  if (AComp ==0) # Si aucune image n'a été choisie, il faut la choisir
    choisirImage();
  endif
  [H,L]=size(M);
  #On calcule la norme entre chaque visage de la base et le visage choisi, on met les résultats dans une matrice D
  D=norm(double(M)-double((I2Vector(AComp))),"cols"); 
  [D,C]=sort(D); 
  
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
    #C(i) contient l'indice de la colonne de la matrice M , D a été trié par ordre croissant,
    # donc le 1er de D sera la norme la plus petite =>L'image la plus ressemblante 
    # i allant de 1 au nombre choisi, on prend les "nbResults" les plus ressemblants   
  endfor
 

endfunction
