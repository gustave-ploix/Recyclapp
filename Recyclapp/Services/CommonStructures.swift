
//
//Page regroupant les données et types de données communs à plusieurs interfaces
//
//Nécessaire au fonctionnement de la page de description et de la page de profil

import SwiftUI
import CoreLocation

//Enumération représentant les types de services pouvant être proposés par les adresses
enum Service {
    case reparer //Pour une adresse proposant de réparer un produit électronique
    case reprendre //Pour une adresse proposant de reprendre un produit électronique (ex : magasin d'électronique)
    case donner //Pour une adresse qui accepte les dons (ex: association Emmeaus)
    case composter //Pour une adresse permettant de composter des déchets biologiques
}

//Structure regroupant toutes les informations d'une adresse.
struct AdresseData:Identifiable {
    let id = UUID() //ID unique de la structure. Permet d'utiliser une boucle sur une liste d'adresse
    
    let adresse:String //Adresse
    let position:CLLocation //Position géographique de l'adresse
    let service:Service //Service proposé par l'adresse
    let nom:String //Nom de l'entreprise
    let telephone:String //Numéro de téléphone
    
    var favori:Bool = false //Indique si l'adresse a été marquée comme favori ou non. A supprimer si elle ne sert à rien.
}

//Fonction servant à afficher une distance en mètres sous forme de m ou km, sans virgule
func affichageDistance(distance:Double) -> String {
    
    if distance < 1000 {
        return "\(Int(distance)) m"
    } else {
        return "\(Int(distance/1000)) km"
    }
}

extension View {
    
    func formatageBouton() -> some View {
        self.font(.title2)
            .fixedSize()
            .frame(width: 44, height: 44)
    }
    
}


//Liste d'addresses à afficher dans l'application
let listeAdresses = [
    AdresseData(adresse:"42 rue de la Réponse\r90000 Montreuil",
                position:(CLLocation(latitude:13, longitude: 29)),
                service: .reparer,
                nom:"Roger Réparation",
                telephone: "10 09 09 09 09"),
    AdresseData(adresse:"42 rue de la Boustifaille\r90000 Paris",
                position:(CLLocation(latitude:23, longitude: 28)),
                service: .reparer,
                nom:"Reparo Maxima",
                telephone: "10 08 08 08 08"),
    AdresseData(adresse:"1 rue Lorem Ipsum\r90000 Pontoise",
                position:(CLLocation(latitude:17, longitude: 12)),
                service: .reparer,
                nom:"Bob le Bricoleur",
                telephone: "10 07 07 07 07"),
    AdresseData(adresse:"6 rue de Paris\r90000 SaintOuen",
                position:(CLLocation(latitude:13, longitude: 25)),
                service: .donner,
                nom:"Emmaüs Saint-Ouen",
                telephone: "10 08 08 08 08"),
    AdresseData(adresse:"666 rue du Diable\r90000 Brest",
                position:(CLLocation(latitude:10, longitude: 30)),
                service: .donner,
                nom:"Ensemble, donnons !",
                telephone: "10 06 06 06 06"),
    AdresseData(adresse:"123 rue du Placeholder\r90000 Placeholder",
                position:(CLLocation(latitude:23, longitude: 28)),
                service: .reprendre,
                nom:"Super Placeholder Store",
                telephone: "10 04 04 04 04"),
    AdresseData(adresse:"123 rue du Placeholder\r90000 Placeholder",
                position:(CLLocation(latitude:23, longitude: 28)),
                service: .reparer,
                nom:"Super Placeholder Store",
                telephone: "10 04 04 04 04"),
    AdresseData(adresse:"2 rue Lorem Ipsum\r90000 Dolor Sit Amet",
                position:(CLLocation(latitude:15, longitude: 12)),
                service: .reprendre,
                nom:"L'électroménager selon Philipe",
                telephone: "10 05 05 05 05"),
    AdresseData(adresse:"Lieu-dit les Pets de Grolles\r90000 Issy-les-moulins",
                position:(CLLocation(latitude:17, longitude: 12)),
                service: .composter,
                nom:"La ferme Jean-Pierre",
                telephone: "10 03 03 03 03"),
    AdresseData(adresse:"58 chemin du Moulin Rond\r90000 Niort",
                position:(CLLocation(latitude:22, longitude: 23)),
                service: .reprendre,
                nom:"Déchetterie de Niort",
                telephone: "10 02 02 02 02"),
    AdresseData(adresse:"58 chemin du Moulin Rond\r90000 Niort",
                position:(CLLocation(latitude:22, longitude: 23)),
                service: .composter,
                nom:"Déchetterie de Niort",
                telephone: "10 02 02 02 02")
]
