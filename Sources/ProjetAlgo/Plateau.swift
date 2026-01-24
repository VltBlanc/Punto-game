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

    let i = c.ligne - 1
    let j = c.colonne - 1

    // Rôle : Vérifie si 4 pièces données ont une caractéristique commune
    func commun(_ p0: Piece?, _ p1: Piece?, _ p2: Piece?, _ p3: Piece?) -> Bool {
        // Vérifie que toutes les cases contiennent une pièce
        guard let a = p0, let b = p1, let c = p2, let d = p3 else {
            return false // précondition : il faut 4 pièces
        }

        let pieces = [a, b, c, d]
        var trouve: Bool = false // devient vrai si un attribut commun est trouvé

        // Parcours des catégories
        for cat in Categorie.allCases {
            let attr = a.getAttribut(cat)
            var ok = true

            for p in pieces {
                if p.getAttribut(cat) != attr {
                    ok = false
                }
            }

            // Si cette catégorie est commune
            if ok {
                trouve = true
            }
        }
        return trouve // postcondition : true si au moins une catégorie est commune
    }

    // Retourne vrai si **ligne, colonne ou diagonale** a un attribut commun
    return 
        commun(grille[i][0], grille[i][1], grille[i][2], grille[i][3])   // Vérifie la ligne 
        || commun(grille[0][j], grille[1][j], grille[2][j], grille[3][j]) // Vérifie la colonne 
        || (i == j && commun(grille[0][0], grille[1][1], grille[2][2], grille[3][3])) // Vérifie la diagonale : (haut-gauche → bas-droite) 
        || (i + j == 3 && commun(grille[0][3], grille[1][2], grille[2][1], grille[3][0])) // Vérifie la diagonale : (haut-droite → bas-gauche) 
    }

}
