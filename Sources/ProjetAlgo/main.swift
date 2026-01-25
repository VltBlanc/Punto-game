// https://docs.swift.org/swift-book

import Foundation

func printPiece(_ p: Piece) -> String {
    let t = (p.getAttribut(.TAILLE) == .GRAND) ? "G": "P"
    let c = (p.getAttribut(.COULEUR) == .CLAIR) ? "C": "F"
    let f = (p.getAttribut(.FORME) == .ROND) ? "R": "K"
    let r = (p.getAttribut(.REMPLISSAGE) == .PLEIN) ? "+": "O"
    return "\(t)\(c)\(f)\(r)"
}

func printPlateau(_ jeu: Jeu) {
    print("=== PLATEAU ===\n")
    print("    1    2    3    4")
    print("  +----+----+----+----+")

    for ligne in 1 ... 4 {
        var ligneStr = "\(ligne) |"
        for colonne in 1 ... 4 {
            let coord = Coordonnee(ligne: ligne, colonne: colonne)
            let plateau = jeu.getPlateau()
            if !plateau.estLibre(coord) {
                if let piece = plateau.getPieceAuxCoordonnees(coord) {
                    ligneStr += printPiece(piece) + "|"
                } else {
                    ligneStr += "    |"
                }
            } else {
                ligneStr += "    |"
            }
        }
        print(ligneStr)
        print("  +----+----+----+----+")
    }
}

func printReserve(_ jeu: Jeu) {
    let reserve = jeu.getReserve()
    print("=== RÉSERVE (\(reserve.count) pièces) ===\n")

    for (index, piece) in reserve.enumerated() {
        print("\(index + 1). \(printPiece(piece))", terminator: "  ")
        if (index + 1) % 4 == 0 {
            print()
        }
    }
    print("\n")
}

func printLegende() {
    print("=== LÉGENDE ===")
    print("G = Grand  |   P = Petit")
    print("C = Clair  |   F = Foncé")
    print("R = Rond   |   Q = Carré")
    print("+ = Plein  |   O = Creux")
    print("Exemple: GCR+ = Grand, Clair, Rond, Plein\n")
}

func lireEntier(_ message: String, min: Int, max: Int) -> Int {
    while true {
        print(message, terminator: "")
        fflush(stdout)
        if let input = readLine(), let nombre = Int(input), nombre >= min && nombre <= max {
            return nombre
        }
        print("Erreur, Entrez un nombre entre \(min) et \(max).")
    }
}

func clearTerminal(){   //Ne fonctionne pas
    print("\u{1B}[2J\u{1B}[H")
}

func jouerPartie() {
    var jeu = Jeu()
    jeu.initialiserPartie()

    print("BIENVENUE AU QUARTO !")
    printLegende()

    print("Joueur 1 : Choisissez une pièce pour Joueur 2\n")
    printReserve(jeu)

    let premierChoix = lireEntier("Numéro de la pièce (1-\(jeu.getReserve().count)): ", min: 1, max: jeu.getReserve().count)
    let pieceChoisie = jeu.getReserve()[premierChoix - 1]
    jeu.choisirPiecePourAdversaire(pieceChoisie)

    while jeu.getStatut() == .Encours {
        let joueur = jeu.getJoueurCourant()
        let nomJoueur = (joueur == .Joueur1) ? "Joueur 1": "Joueur 2"

        print(" Au tour de \(nomJoueur) \n")

        if let piece = jeu.getPieceEnTransit() {
            print("Piece a poser : \(printPiece(piece))")
        }

        printPlateau(jeu)

        var coordValide = false
        while !coordValide {
            let ligne = lireEntier("Ligne (1-4): ", min: 1, max: 4)
            let colonne = lireEntier("Colonne (1-4): ", min: 1, max: 4)
            let coord = Coordonnee(ligne: ligne, colonne: colonne)

            if jeu.getPlateau().estLibre(coord) {
                jeu.poserPieceSurPlateau(coord)
                coordValide = true

                if jeu.getStatut() == .Victoire {
                    printPlateau(jeu)
                    print("\(nomJoueur) A GAGNÉ !\n")
                    return
                } else if jeu.getStatut() == .MatchNUl {
                    printPlateau(jeu)
                    print("MATCH NUL ! Le plateau est plein sans vainqueur.\n")
                    return
                }
            } else {
                print("Cette case est déjà occupée !")
            }
        }

        if jeu.getStatut() == .Encours && !jeu.getReserve().isEmpty {
            //clearTerminal() Ne fonctionne pas
            printLegende()

            print("\(nomJoueur) : Choisissez une pièce pour l'adversaire\n")
            printReserve(jeu)
            printPlateau(jeu)

            let choix = lireEntier("Numéro de la pièce (1-\(jeu.getReserve().count)): ", min: 1, max: jeu.getReserve().count)
            let piece = jeu.getReserve()[choix - 1]
            jeu.choisirPiecePourAdversaire(piece)
        }
    }
}

jouerPartie()

print("Fin de Partie")