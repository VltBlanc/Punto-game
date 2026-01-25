// https://docs.swift.org/swift-book

protocol ProtocolPiece {
    /*
    Invariant : Pour toute Pièce p :
    ∀ c ∈ Catégorie,
    il existe exactement un Attribut a, tel que categorieDe(a) = c, et a caractérise p
    */

    // Récupère la valeur de la pièce pour une catégorie donnée
    //postcond : categorieDe(getAttribut(p, c)) = c
    func getAttribut( _ cat : Categorie ) -> Attribut

    // Vérifie si deux pièces ont la même valeur pour une catégorie
    //postcond: partagentAttribut(p1, p2, c) = sontEgaux(getAttribut(p1, c), getAttribut(p2, c))
    func partagentAttribut( _ p1 : Piece, _ p2 : Piece, _ Cat : Categorie ) -> Bool

    //vérifie si deux pièces ont au moins un attribut en commun, sans distinction
    //postcond : ontAttributCommun(p1, p2) = ∃ c ∈ Catégorie, partagentAttribut(p1, p2, c)
    func ontAttributCommun( _ p1 : Piece, _ p2 : Piece) -> Bool

}

struct Piece{
    let taille: Attribut
    let couleur: Attribut
    let forme: Attribut
    let remplissage: Attribut

    init(_ t : Attribut,_ c : Attribut,_ f : Attribut,_ r : Attribut) {
        self.taille = t
        self.couleur = c
        self.forme = f
        self.remplissage = r
    }

    func getAttribut(_ c : Categorie) -> Attribut{
        switch c {
            case .TAILLE:
                return self.taille
            case .COULEUR:
                return self.couleur
            case .FORME:
                return self.forme
            case .REMPLISSAGE:
                return self.remplissage
        }
    }

    func partagentAttribut(_ p : Piece,_ c : Categorie) -> Bool{
        return self.getAttribut(c)==p.getAttribut(c)
    }

    func ontAttributCommun(_ p: Piece) -> Bool {
        var r : Bool = false
        for c in Categorie.allCases{
            if self.partagentAttribut(p, c) {
                r = true;
            }
        }
        return r
    }
}