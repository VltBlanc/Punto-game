// https://docs.swift.org/swift-book

protocol protocolAttribut {
    /*
    Type Attribut = { GRAND, PETIT, CLAIR, FONCE, ROND, CARRE, PLEIN, CREUX }
    
    categorieDe : Attribut → Catégorie
    //postcond :
    -categorieDe(GRAND) = TAILLE
    -categorieDe(PETIT) = TAILLE
    -categorieDe(CLAIR) = COULEUR
    -categorieDe(FONCE) = COULEUR
    -categorieDe(ROND) = FORME
    -categorieDe(CARRE) = FORME
    -categorieDe(PLEIN) = REMPLISSAGE
    -categorieDe(CREUX) = REMPLISSAGE

    func CategorieDe(Attribut) -> Categorie{}


    //postcond: sontEgaux(a1, a2) = Vrai ⇔ a1 = a2
    sontEgaux : Attribut × Attribut → Bool
    func sontEgaux(Attribut1 × Attribut2) → Bool{}
     */
}


enum Attribut {
    //Catégorie TAILLE
    case GRAND 
    case PETIT 
    
    //Catégorie COULEUR 
    case CLAIR
    case FONCE

    //Catégorie FORME
    case ROND
    case CARRE
    
    //Catégorie REMPLISSAGE  
    case PLEIN
    case CREUX

    func categorieDe() -> Categorie {
        if self == .GRAND || self == .PETIT {
            return .TAILLE
        } else if self == .CLAIR || self == .FONCE {
            return .COULEUR
        } else if self == .ROND || self == .CARRE {
            return .FORME
        } else { // .PLEIN || .CREUX
            return .REMPLISSAGE
        } 
    }

    // Vérifie si deux Attributs sont égaux
    static func sontEgaux(_ a1: Attribut, _ a2: Attribut) -> Bool {
        return a1 == a2
    }
    
}
