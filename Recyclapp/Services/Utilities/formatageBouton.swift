//
//  formatageBouton.swift
//  RecyclApp_fichiers_Nicolas
//
//  Created by Apprenant 97 on 29/03/2022.
//

import SwiftUI

//Ajout d'une fonction à View pour formatter les boutons, de sorte qu'ils soient assez grands pour être cliqués (44x44) sans que l'icône soit trop grande
extension View {
    func formatageBouton() -> some View {
        self.font(.title2) //sert à augmenter la taille de l'icône
            .fixedSize() //sert à s'assurer que l'icône ne change plus de taille
            .frame(width: 44, height: 44) //sert à agrandir la zone cliquable
    }
}
