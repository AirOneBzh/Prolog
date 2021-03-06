% Les faits :

% Chaque maison à 5 paramètres qui seront dans l'ordre suivant :

% - Couleur
% - Nationalité
% - Animal domestique
% - Boisson
% - Cigare

maisons([
    maison(_,_,_,_,_) ,
    maison(_,_,_,_,_) ,
    maison(_,_,_,_,_) ,
    maison(_,_,_,_,_) ,
    maison(_,_,_,_,_)
]).

% Les règles :

afficher_liste([X|L]) :- writeln(X), afficher_liste(L).

appartient_à(X,[X|_]).
appartient_à(X,[_|L]) :- appartient_à(X,L).

est_à_gauche_de(A,B,[A,B|_]).
est_à_gauche_de(A,B,[_|Y]) :- est_à_gauche_de(A,B,Y).

est_à_côté_de(A,B,[A,B|_]).
est_à_côté_de(A,B,[B,A|_]).
est_à_côté_de(A,B,[_|Y]) :- est_à_côté_de(A,B,Y).

resoudre :-

maisons(MAISONS),

% Les indices :

% 1 - L'anglais vit dans une maison rouge
appartient_à(maison(rouge,anglais,_,_,_),MAISONS),

% 2 - Le Suédois a des chiens comme animaux domestiques.
appartient_à(maison(_,suédois,chien,_,_),MAISONS),

% 3 - Le Danois boit du thé.
appartient_à(maison(_,danois,_,thé,_),MAISONS),

% 4 - La maison verte est à gauche de la maison blanche.
est_à_gauche_de(maison(verte,_,_,_,_),maison(blanche,_,_,_,_),MAISONS),

% 5 - Le propriétaire de la maison verte boit du café.
appartient_à(maison(verte,_,_,café,_),MAISONS),

% 6 - La personne qui fume des Pall Mall a des oiseaux.
appartient_à(maison(_,_,oiseaux,_,pall_mall),MAISONS),

% 7 - Le propriétaire de la maison jaune fume des Dunhill.
appartient_à(maison(jaune,_,_,_,dunhill),MAISONS),

% 8 - La personne qui vit dans la maison du centre boit du lait.
MAISONS = [_,_,maison(_,_,_,lait,_),_,_],

% 9 - Le Norvégien habite la première maison.
MAISONS = [maison(_,norvégien,_,_,_)|_],

% 10 - L'homme qui fume les Blend vit à côté de celui qui a des chats.
est_à_côté_de(maison(_,_,_,_,blend),maison(_,_,chats,_,_),MAISONS),

% 11 - L'homme qui a un cheval est le voisin de celui qui fume des Dunhill.
est_à_côté_de(maison(_,_,cheval,_,_),maison(_,_,_,_,dunhill),MAISONS),

% 12 - Le propriétaire qui fume des Blue Master boit de la bière.
appartient_à(maison(_,_,_,biere,blue_master),MAISONS),

% 13 - L'Allemand fume des Prince.
appartient_à(maison(_,allemand,_,_,prince),MAISONS),

% 14 - Le Norvégien vit juste à côté de la maison bleue.
est_à_côté_de(maison(_,norvégien,_,_,_),maison(bleue,_,_,_,_),MAISONS),

% 15 - L'homme qui fume des Blend a un voisin qui boit de l'eau.
est_à_côté_de(maison(_,_,_,_,blend),maison(_,_,_,eau,_),MAISONS),

% Qui a le poisson ?
appartient_à(maison(_,_,poisson,_,_),MAISONS),

% on affiche le résultat
afficher_liste(MAISONS).
