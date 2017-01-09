#On déclare des variables globales pour y accéder dans les autres fonctions
global panelImageChoisie; 
global panelResultats; 
global AComp; 
global M;
# Le nombre de résultats finaux, initialisé à 5 au cas où l'utilisateur n'en choisit pas
global nbResults=5;
# Le niveau de détail appliqué à la technique du visage propre, initialisé à 5 si l'utilisateur n'en choisit pas
global niveauDetails=5;
global nbImages;   


#convertirBaseEnGray(); # Convertit les images de la base en gris si besoin
transformImagesEn1Vec(); #Transforme toutes les images en 1 vecteur colonne, qui est ajouté à M, matrice contenant tous ces vecteurs colonnes
#Fonctions faites dès le début pour ne pas avoir à les refaire si l'utilisateur change de méthode

#Fenêtre principale
f= figure("Name", "Systeme de reconnaissance faciale", "Menubar", "none", "Position", [300,0,1300,800], "Color","blue");

#Bouton pour choisir l'image, qui appelle la fonction "CallFileChooser"
choix= uicontrol(f, "style", "push", "position", [900,750,270,35],"string", "Choisir votre image :","callback",@callFileChooser,"fontsize", 10);

#Panel dans lequel sera affichée l'image choisie, global pour qu'on puisse y accéder dans la fonction "callFileChooser"
panelImageChoisie= uipanel("Parent", f, "Title", "Image choisie", "position", [.5,.47,.4,.4],"backgroundcolor","white","foregroundcolor","blue"); 

#Texte 
choixTechnique = uicontrol(f,"style","text","string","Technique de comparaison :","position",[100,700,270,35],"fontsize",12,"fontweight","bold","foregroundcolor","blue");

#Bouton pour appeler la technique de visage moyen
choixVisageMoyen= uicontrol(f, "style", "push","string", "Visage moyen", "position", [200,650,250,35],"callback",@comparaisonVisageMoyen,"fontsize", 10,"foregroundcolor","red");

#Bouton pour appeler la technique de visage propre
choixVisagePropre= uicontrol(f, "style", "push","string", "Visage Propre", "position", [200,600,250,35],"callback",@comparaisonVisagePropre,"fontsize", 10,"foregroundcolor","red");

#Bouton pour appeler la technique qui compare la distance entre 2 histogrammes
choixHistogramme= uicontrol(f, "style", "push","string", "Histogramme", "position", [200,550,250,35],"callback",@comparaisonHistogrammes,"fontsize", 10,"foregroundcolor","red");


#Panel où seront affichées les images les plus proches selon la technique, global pour qu'on puisse y accéder dans les 2 fonctions de comparaison, pour qu'elles puissent ajouter les image à afficher dans le panel
panelResultats= uipanel("Parent", f, "Title", "Images les plus proches", "position", [0.0,.0,1,.45],"backgroundcolor","red","fontweight","bold","fontangle","oblique","titleposition","centertop","foregroundcolor","white"); 

#Bouton pour choisir le nombre de résultats finaux
choixNbResult=uicontrol(f,"style","push","position",[ 200,450,250,35],"string","Choisir nombre de resultats","callback",@choixNombreResults);

#Bouton pour choisir le niveau de détail
choixNiveauDetail=uicontrol(f,"style","push","position",[ 85,600,110,35],"string","Niveau Detail","callback",@choixNiveauDetails); 