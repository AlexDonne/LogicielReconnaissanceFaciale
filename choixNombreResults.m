
function choixNombreResults ()
  global nbResults; 
  global nbImages; 
  #Affiche dialogue pour entrer un nombre
  a=inputdlg("Tapez nombre de résultats désirés"); 
  a=str2num(char(a));
  # Si c'et bien un nombre entre 1 et 50, le nombre entré par l'utilisateur est affecté à nbResults 
  if (isnumeric(a) && a<=nbImages && a>0)
    nbResults=a;
  else 
    errordlg("Tapez un nombre compris entre 1 et le nombre d'images");
  endif
endfunction
