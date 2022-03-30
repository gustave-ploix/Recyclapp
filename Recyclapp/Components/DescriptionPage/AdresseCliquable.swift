//
//  AdresseCliquable.swift
//  RecyclApp_fichiers_Nicolas
//
//  Created by Apprenant 97 on 29/03/2022.
//
//  Nécessite StructuresCommunes et DetailAdresse

import SwiftUI
import CoreLocation
import MapKit

//Structure qui affiche un bouton cliquable montrant la distance jusqu'à l'adresse et le nom de l'adresse
struct AdresseCliquable: View {
    
    let adresse:AdresseData //constante qui contient l'adresse à afficher
    @State private var montrerDetail = false //booléen qui détermine si le détail de l'adresse sera affiché ou non
    @State var adresseCoordinate = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.856614, longitude: 2.3522219), latitudinalMeters: 5000, longitudinalMeters: 5000) //variable qui permet de stocker le MKCoordinateRegion de l'adresse, pour pouvoir d'affecter en binding à DetailAdresse. Faire comme ça me semble être le seul moyen de centrer la carte sur l'adresse.
    
    var body: some View {
        VStack {
            
            HStack {
                
                //Affichage de la distance entre l'adresse et l'utilisateur (lire les commentaires du 1 au 3)
                Text(affichageDistance( //3: affichage de la distance calculée sous forme de mètres ou kilomètres
                    distance: geolocalisation.coordonnees().distance( //2: Calcul de la distance en mètres entre la position de l'utilisateur et celle de l'adresse
                        from:CLLocation( //1: Convertion de la position de l'adresse (type CLLocationCoordinate2D) en un type CLLocation (nécessaire pour le calcul de la distance)
                            latitude: adresse.position.latitude, longitude: adresse.position.longitude))))
                    .fontWeight(.bold)
                
                Text(adresse.nom) //Affiche le nom de l'adresse
                
                Spacer()
                
                //Bouton servant à afficher ou cacher le détail de l'adresse
                Button(action: {//Lorsque le bouton est pressé...
                    montrerDetail.toggle() //on inverse la visibilité du détail.
                    adresseCoordinate = adresse.creerCoordinateLocation(hauteur: 500, largeur: 500) //on calcule le  MKCoordinateRegion centré sur l'adresse, et on l'affecte à la variable biding.
                }, label: { //L'apparence du bouton est différente selon que le détail est affiché ou non
                    if montrerDetail {
                        Image(systemName: "chevron.up")
                    } else {
                        Image(systemName: "chevron.down")
                    }
                }).buttonStyle(.plain)
                
            }//Fin du HStack
            
            //Affiche le détail de l'adresse si l'utilisateur l'a choisi. C'est à ce moment que le détail de l'adresse reçoit la valeur correcte de coordinate.
            if montrerDetail {
                DetailAdresse(adresseInstance:adresse, coordinate: $adresseCoordinate)
            }
            
        }//Fin du VStack
    }//Fin du body
    
}

// Prévisualisation
struct AdresseCliquable_Previews: PreviewProvider {
    static var previews: some View {
        AdresseCliquable(adresse:AdresseData(
            adresse:"42 rue de la Réponse\r90000 Montreuil",
            position:(CLLocationCoordinate2D(latitude:48.86, longitude: 2.36)),
            service: .reparer,
            nom:"Roger Réparation",
            telephone: "10 09 09 09 09"))
    }
}
