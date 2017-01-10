
function  choixNiveauDetails ()
  global niveauDetails; 
  global nbImages; 
  a=inputdlg("Niveau de détail choisi :"); 
  a=str2num(char(a));
  if (isnumeric(a) && a<=nbImages && a>0)
    niveauDetails=a; 
  else 
    errordlg("Tapez un nombre compris entre 1 et le nombre d'images");
  endif
endfunction

