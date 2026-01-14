// https://docs.swift.org/swift-book

protocol ProtocolPiece {
    /*
    Invariant : Pour toute Pièce p :
    ∀ c ∈ Catégorie,
    il existe exactement un Attribut a, tel que categorieDe(a) = c, et a caractérise p


    getAttribut : Pièce x Categorie -> Attribut
    // Récupère la valeur de la pièce pour une catégorie donnée
    //postcond : categorieDe(getAttribut(p, c)) = c



    partagentAttribut : Pièce x Pièce x Categorie -> Bool
    // Vérifie si deux pièces ont la même valeur pour une catégorie
    //postcond: partagentAttribut(p1, p2, c) = sontEgaux(getAttribut(p1, c), getAttribut(p2, c))

    ontAttributCommun : Pièce × Pièce → Bool
    //vérifie si deux pièces ont au moins un attribut en commun, sans distinction
    //postcond : ontAttributCommun(p1, p2) = ∃ c ∈ Catégorie, partagentAttribut(p1, p2, c)
    */
}