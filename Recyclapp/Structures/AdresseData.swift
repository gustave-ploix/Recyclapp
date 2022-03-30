//
//  AdresseData.swift
//  RecyclApp_fichiers_Nicolas
//
//  Created by Apprenant 97 on 29/03/2022.
//
// Code servant à définir les types de données AdresseData et Service

import SwiftUI
import CoreLocation
import MapKit

//Enumération représentant les différents services pouvant être proposés par les adresses
enum Service:Identifiable{
    case reparer //Pour une adresse proposant de réparer un produit électronique
    case reprendre //Pour une adresse proposant de reprendre un produit électronique (ex : magasin d'électronique)
    case donner //Pour une adresse qui accepte les dons (ex: association Emmeaus)
    case composter //Pour une adresse permettant de composter des déchets biologiques
    
    var id : Self {self} //ID servant à rendre l'enumération identifiable. Rendre l'enum indentifable permettra d'itérer sur une liste contenant des éléments de cette enum
}

//Structure regroupant toutes les informations d'une adresse.
struct AdresseData:Identifiable {
    let id = UUID() //ID unique de la structure. Permet d'utiliser une boucle sur une liste d'adresse
    
    let adresse:String //Adresse
    let position:CLLocationCoordinate2D //Position géographique de l'adresse
    let service:Service //Service proposé par l'adresse
    let nom:String //Nom de l'entreprise
    let telephone:String //Numéro de téléphone
    
    //Fonction permettant de créer une MKCoordinateRegion correspondant aux coordonnées de l'adresse (permet d'afficher l'adresse avec Map())
    func creerCoordinateLocation(hauteur:Double, largeur:Double) -> MKCoordinateRegion {
        return MKCoordinateRegion(center: position, latitudinalMeters: hauteur, longitudinalMeters: largeur)
    }
}
