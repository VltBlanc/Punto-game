// https://docs.swift.org/swift-book

protocol ProtocolJeu {
    /*
    Invariants :
    - Toute pièce est soit :
      • dans la réserve
      • sur le plateau
      • en transit
    - Une pièce ne peut appartenir qu’à un seul de ces ensembles
    - pieceEnTransit ≠ Vide ⇒ elle n’est ni sur le plateau ni dans la réserve
    -L'ensemble de toutes les pièces du jeu (Réserve ∪ Plateau ∪ {PièceEnTransit}) contient 16 pièces toutes distinctes (combinaisons uniques d'attributs).

    getJoueurCourant : Jeu → Joueur
    //Indique quel Joueur est en train de Jouer

    getReserve : Jeu → Ensemble de Pièces
     // Liste des pièces qui n'ont pas encore été Jouées

    getPieceEnTransit : Jeu → Pièce ∪ {Vide}
    // La pièce choisie par l'adversaire que le joueur courant DOIT poser.
    // Retourne Vide si on est dans la phase de choix (aucune pièce imposée).

    getStatut : Jeu → StatutPartie
    //Retourne l’état de la partie : en cours, victoire ou match nul

    initialiserPartie : () → Jeu
    // Initialise la Partie
    // postcond: plateau vide, réserve pleine (16), pieceEnTransit = Vide, statut = enCours
    - pieceEnTransit = Vide
    - statut = EnCours

    choisirPiecePourAdversaire : Jeu × Pièce → Jeu
    //Choisit la pièce que le joueur va donner à l’adversaire
    //precond : - p ∈ getReserve(Partie)
    - getPieceEnTransit(Partie) = Vide
    - getStatut(Partie) = EnCours
    //postcond : - p retirée de la réserve
    - pieceEnTransit = p
    - Joueur courant changé

    poserPieceSurPlateau : Jeu × Coordonnée → Jeu
    //pose la pièce spécifiée par la fonction choisirPiecePourAdversaire aux coordonnées spécifiées
    //precond : - getPieceEnTransit(Partie) ≠ Vide
    - estLibre(plateau(Partie), c)
    - getStatut(Partie) = EnCours
    //postcond : - la pièce est placée sur la coordonnée c
    - pieceEnTransit = Vide
    - si aUnAlignement(plateau, c) alors statut = Victoire
    - sinon si plateau plein alors statut = MatchNul

    */
}