## Author: alexd <alexd@ALEX>
## Created: 2016-12-28

function callFileChooser ()
  global AComp; 
  global panelImageChoisie; 
  # On fait le dialogue pour choisir l'image
  [fname, fpath, fltidx] = uigetfile ({"*.gif;*.png;*.jpg;.jpeg;"},"Image a comparer");
  #ACompInit sert à afficher l'image de base dans l'interface, pas celle qui a été grisée 
  ACompInit=strcat(fpath,fname);
  ACompInit=double(imread(ACompInit));
  AComp=ACompInit; 
  [h,l,m]=size(AComp);
  if(h!=128 || l != 128)
    AComp=0;
    ACompInit=255; 
    msgbox("La taille de l'image doit etre de 128x128", "Erreur");
    
  endif
    
  #Si l'image est en couleur, on la grise
  if(m==3) 
    AComp=RGB2Gray(ACompInit);
  endif 
  # On affiche l'image choisie dans le panel dédié
  axes("Parent", panelImageChoisie , "position", [.0 .0 1 1]);
  imshow(uint8(ACompInit));
endfunction
