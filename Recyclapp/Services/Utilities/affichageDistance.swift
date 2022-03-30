//
//  affichageDistance.swift
//  RecyclApp_fichiers_Nicolas
//
//  Created by Apprenant 97 on 29/03/2022.
//

//Fonction servant à afficher une distance en mètres sous forme de m ou km, sans virgule
func affichageDistance(distance:Double) -> String {
    
    if distance < 1000 {
        return "\(Int(distance)) m"
    } else {
        return "\(Int(distance/1000)) km"
    }
}
