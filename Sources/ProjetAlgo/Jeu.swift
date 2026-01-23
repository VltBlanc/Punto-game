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
    - L'ensemble de toutes les pièces du jeu (Réserve ∪ Plateau ∪ {PièceEnTransit}) contient 16 pièces toutes distinctes (combinaisons uniques d'attributs).
    */

    // Indique quel joueur est en train de jouer
    func getJoueurCourant() -> Joueur

    // Liste des pièces qui n'ont pas encore été jouées
    func getReserve() -> [Piece]

    // La pièce choisie par l'adversaire que le joueur courant DOIT poser.
    // Retourne Vide si on est dans la phase de choix (aucune pièce imposée).
    func getPieceEnTransit() -> Piece? 
   
    // Retourne l’état de la partie : en cours, victoire ou match nul
    func getStatut() -> EtatPartie

    // Initialise la partie
    // postcond : plateau vide, réserve pleine (16), pieceEnTransit = Vide, statut = enCours
    // || pieceEnTransit = Vide
    // ||statut = EnCours
    mutating func initialiserPartie()


    // Choisit la pièce que le joueur va donner à l’adversaire
    // precond : - p ∈ getReserve(Partie)
    // - getPieceEnTransit(Partie) = Vide
    // - getStatut(Partie) = EnCours
    // postcond : - p retirée de la réserve
    // - pieceEnTransit = p
    // - Joueur courant changé
    mutating func choisirPiecePourAdversaire(_ p: Piece)


    // Pose la pièce spécifiée par la fonction choisirPiecePourAdversaire aux coordonnées spécifiées
    // precond : - getPieceEnTransit(Partie) ≠ Vide
    // - estLibre(plateau(Partie), c)
    // - getStatut(Partie) = EnCours
    // postcond : - la pièce est placée sur la coordonnée c
    // - pieceEnTransit = Vide
    // - si aUnAlignement(plateau, c) alors statut = Victoire
    // - sinon si plateau plein alors statut = MatchNul
    mutating func poserPieceSurPlateau(_ c: Coordonnee) 
}


