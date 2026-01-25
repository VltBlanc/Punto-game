// https://docs.swift.org/swift-book

protocol ProtocolCoordonnee {
    /*
    Type Coordonnée = (ligne, colonne)
        ||ligne ∈ {1, 2, 3, 4}
        ||colonne ∈ {1, 2, 3, 4}
    */
    var ligne : Int { get }
    var colonne : Int { get }
     
}

struct Coordonnee : ProtocolCoordonnee {
    let ligne : Int
    let colonne : Int 

 init(ligne: Int, colonne: Int) {
        // Vérification des conditions nécessaires    
        guard (ligne >= 1 && ligne <= 4) && (colonne >= 1 && colonne <= 4) else {
            fatalError("Erreur : les coordonnées sont hors limites (1-4) ")
        }
    self.ligne = ligne
    self.colonne = colonne 
 }
}
