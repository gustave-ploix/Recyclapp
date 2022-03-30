//
//  donneesPartagees.swift
//  RecyclApp_fichiers_Nicolas
//
//  Created by Apprenant 97 on 29/03/2022.
//

import SwiftUI
import CoreLocation

struct Donnees {
    var adressesFavorites:[AdresseData] = []
    var positionUtilisateur = CLLocation(latitude: 48.856, longitude: 2.352)
}
var donneesPartagees = Donnees()
