
function comparaisonHistogrammes ()
  global panelResultats; 
  global AComp;
  global M; 
  global nbResults;
  global f;
  global histM;
  [H,L]=size(M);   
 
  # On récupère l'histogramme du vecteur colonne de l'image à comparer, avec 255 colonnes car il y a 255 nuances de gris
  histAComp=hist(I2Vector((AComp)),255); 

  # On récupère une matrice de 255*nombreImages, qui contient les histogrammes de toutes les images de la base

  
  
  %histM=hist(M,255);
  
  # On calcule la norme de la différence entre chaque ligne de histM et histAComp, un par ligne
  %D=norm(histM-histAComp,"rows")'; 
  D=distChiSqu(histM,histAComp); 

  # On trie D, et on récupère les indices associés aux normes dans C
  [D,C]=sort(D);

  panelResultats= uipanel("Parent", f, "Title", "Images les plus proches", "position", [0.0,.0,1,.45],"backgroundcolor","red","fontweight","bold","fontangle","oblique","titleposition","centertop","foregroundcolor","white"); 
  for i=1:nbResults
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
