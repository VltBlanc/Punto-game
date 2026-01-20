// https://docs.swift.org/swift-book

protocol ProtocoleStatutPartie {
    // Type StatutPartie = { EnCours, Victoire, MatchNul }
}

enum EtatPartie : ProtocoleStatutPartie {
    case Encours
    case Victoire
    case MatchNUl
}