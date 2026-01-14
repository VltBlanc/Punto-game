// https://docs.swift.org/swift-book

protocol ProtocolPlateau {
    /*
    invariants : - Chaque coordonnée contient au plus une pièce
    - Toutes les coordonnées utilisées sont valides

    estLibre : Plateau × Coordonnée → Bool
    //Vérifie si une case est vide

    getPieceAuxCoordonnees : Plateau × Coordonnée → Pièce
    //precond : ¬ estLibre(p, c)
    //donne la pièce aux coordonnées spécifiées

    estPlein : Plateau → Bool
    //postcond : estPlein(p) ⇔ ∀ c, ¬ estLibre(p, c)
    // Vérifie si les 16 cases sont occupées

    aUnAlignement : Plateau × Coordonnée → Bool
    // Vérifie si la pose en 'coord' complète une ligne/colonne/diagonale gagnante
    //postcond : Résultat vrai s’il existe une ligne, colonne ou diagonale passant par la coordonnée c,
        contenant exactement 4 pièces, partageant au moins un attribut A commun.
    */
}