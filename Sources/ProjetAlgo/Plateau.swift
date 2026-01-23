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
    func getPieceAuxCoordonnees( _ c : Coordonnee) -> Piece?
    
    //postcond : estPlein(p) ⇔ ∀ c, ¬ estLibre(p, c)
    // Vérifie si les 16 cases sont occupées
    func estPlein( ) -> Bool
  
    // Vérifie si la pose en 'coord' complète une ligne/colonne/diagonale gagnante
    //postcond : Résultat vrai s’il existe une ligne, colonne ou diagonale passant par la coordonnée c,
    //contenant exactement 4 pièces, partageant au moins un attribut A commun.
    func aUnAlignement( _ c : Coordonnee) -> Bool

}


struct Plateau : ProtocolPlateau {
    //Une matrice 4*4 d'optionnels, pour représenter le plateau de jeu 
    private var grille: [[Piece?]] = Array(repeating :Array(repeating : nil  , count : 4), count : 4) 

    func estLibre( _ c : Coordonnee) -> Bool {
        return self.grille[c.ligne - 1][c.colonne - 1] == nil 
    }

    func getPieceAuxCoordonnees(_ c: Coordonnee) -> Piece? {
        guard !self.estLibre(c) else {
        // Si estLibre est vrai, alors la précondition (¬ estLibre) n'est pas vérifiée
        print("Erreur : La case est vide en (\(c.ligne), \(c.colonne))")
        return nil
    }
    
    return self.grille[c.ligne - 1][c.colonne - 1]
    }

    func estPlein() -> Bool {
        var plein: Bool = true // On suppose que la grille est pleine
        var i: Int = 0

        while i < 4 && plein { // Condition d'arrêt :  i >= 4 || !plein  
            var j: Int = 0
            while j < 4 && plein { // Condition d'arrêt : j >= 4 || !plein 
                if self.grille[i][j] == nil {
                    plein = false // On a trouvé une case vide
                }
                 j += 1
            }
            i += 1
        }
    return plein
    }

    func aUnAlignement(_ c: Coordonnee) -> Bool {
    // À faire :
    return false 
    }
}
