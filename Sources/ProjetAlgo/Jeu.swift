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

struct Jeu : ProtocolJeu {
    private var plateauDeJeu : Plateau
    private var reserve : [Piece?] 
    private var pieceEnTransit : Piece? 
    private var joueurCourant : Joueur 
    private var statut : EtatPartie

    init() {
        self.plateauDeJeu = Plateau()
        self.reserve = Array(repeating: nil, count: 16)
        self.pieceEnTransit = nil
        self.joueurCourant = .Joueur1
        self.statut = .Encours
        self.initialiserPartie()
    }

    func getJoueurCourant() -> Joueur{ 
      return self.joueurCourant 
    }
    
    func getPieceEnTransit() -> Piece? { 
      return self.pieceEnTransit 
    }
    
    func getStatut() -> EtatPartie { 
      return self.statut 
    }
    
    // À revoir ? 
    func getReserve() -> [Piece] {
        return self.reserve.compactMap { $0 }
    }

    mutating func initialiserPartie() {
        self.plateauDeJeu = Plateau()
        self.pieceEnTransit = nil
        self.statut = .Encours
        self.joueurCourant = .Joueur1
        
        var nouvelleReserve: [Piece?] = Array(repeating: nil, count: 16)
        
        var index: Int = 0
        let tailles: [Attribut] = [.GRAND, .PETIT]
        let couleurs: [Attribut] = [.CLAIR, .FONCE]
        let formes: [Attribut] = [.ROND, .CARRE]
        let remplissages: [Attribut] = [.PLEIN, .CREUX]

        for t in tailles {
            for c in couleurs {
                for f in formes {
                    for r in remplissages {
                        nouvelleReserve[index] = Piece(t, c, f, r)
                        index += 1
                    }
                }
            }
        }
        self.reserve = nouvelleReserve
    }

    mutating func choisirPiecePourAdversaire(_ pieceChoisie: Piece) {
       
        // La partie doit être en cours
        guard self.statut == .Encours else {
            fatalError("Erreur : Impossible de choisir une pièce, la partie est déjà terminée.")
        }

        // Il ne doit pas y avoir de pièce déjà en transit
        guard self.pieceEnTransit == nil else {
            fatalError("Erreur : Une pièce est déjà en transit. L'adversaire doit d'abord la poser.")
        }

        var indexCourant = 0
        var estTrouvee = false
        
        while indexCourant < self.reserve.count && !estTrouvee {
            if let pieceCandidate = self.reserve[indexCourant] {
                // Comparaison  des attributs
                if pieceCandidate.taille == pieceChoisie.taille && 
                   pieceCandidate.couleur == pieceChoisie.couleur && 
                   pieceCandidate.forme == pieceChoisie.forme && 
                   pieceCandidate.remplissage == pieceChoisie.remplissage {
                                        
                    self.pieceEnTransit = pieceCandidate
                    self.reserve[indexCourant] = nil // On vide la case 
                    estTrouvee = true
                }
            }
            indexCourant += 1
        }
        
        // --- Vérification finale : p ∈ getReserve(Partie) ---
        guard estTrouvee else {
            fatalError("Erreur : La pièce choisie n'est pas (ou plus) présente dans la réserve.")
        }
        
        // --- Postcondition : Changement de joueur ---
        self.joueurCourant = (self.joueurCourant == .Joueur1) ? .Joueur2 : .Joueur1
    }


    mutating func poserPieceSurPlateau(_ c: Coordonnee) {
      // À faire (problème rencontré, il faut rajouter une fonction dans le type plateau
      // Pour poser une pièce )
    }

}