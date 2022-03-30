//
//  Geolocalisation.swift
//  RecyclApp_fichiers_Nicolas
//
//  Created by Apprenant 97 on 28/03/2022.
//
//  Page contenant toute les structures liées à la géolocalisation

import SwiftUI
import CoreLocation

class Geolocalisation: NSObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    var lastKnownLocation: CLLocationCoordinate2D?

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = 10.0 //On fixe la précision voulue de la géolocalisation à 10 mètres près
    }

    func start() {
        manager.requestWhenInUseAuthorization() //Demande l'autorisation d'utiliser la géolocalisation.
    }
    
    //Fonction qui renvoie les coordonnées de l'utilisateur.
    func coordonnees() -> CLLocation {
        manager.requestLocation() //lancement d'une géolocalisation ponctuelle pour actualiser la position de l'utilisateur
        if let position = manager.location { //Si la position de l'utilisateur est définie, on la renvoie
            return CLLocation(latitude: position.coordinate.latitude, longitude: position.coordinate.longitude)
        } else { //Si la position de l'utilisateur n'est pas définie, on renvoie une position par défaut.
            print("Coordonnées utilisateur non trouvées")
            return CLLocation(latitude: 0, longitude: 0)
        }
    }

    //Ces fonctions sont inutilisées, mais indispensables pour que la classe soit acceptée comme delegate de l'objet CLLocationManager
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastKnownLocation = locations.first?.coordinate
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError:Error) {
        
    }
}
var geolocalisation = Geolocalisation()
