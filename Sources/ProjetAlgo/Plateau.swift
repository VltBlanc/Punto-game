// https://docs.swift.org/swift-book

protocol ProtocolPlateau {
    /*
    invariants : - Chaque coordonnée contient au plus une pièce
    - Toutes les coordonnées utilisées sont valides
    */

    //Vérifie si une case est vide
    func estLibre( _ c : Coordonnee )  -> Bool
    
    //precond : ¬ estLibre(p, c)
    //donne la pièce aux coordonnées spécifiées
    func getPieceAuxCoordonnees( _ c : Coordonnee) -> Piece
    
    //postcond : estPlein(p) ⇔ ∀ c, ¬ estLibre(p, c)
    // Vérifie si les 16 cases sont occupées
    func estPlein( ) -> Bool
  
    // Vérifie si la pose en 'coord' complète une ligne/colonne/diagonale gagnante
    //postcond : Résultat vrai s’il existe une ligne, colonne ou diagonale passant par la coordonnée c,
    //contenant exactement 4 pièces, partageant au moins un attribut A commun.
    func aUnAlignement( _ c : Coordonnee) -> Bool

}