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
}


//implémentation enum pour le type attribut est-elle bien choisi est bien faite, suit elle la spécif 