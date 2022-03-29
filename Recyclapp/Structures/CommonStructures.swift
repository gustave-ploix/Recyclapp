//
//Page regroupant les données et types de données communs à plusieurs interfaces
//
//Nécessaire au fonctionnement de la page de description et de la page de profil

import SwiftUI
import CoreLocation
import MapKit

//Enumération représentant les types de services pouvant être proposés par les adresses
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

//Fonction servant à afficher une distance en mètres sous forme de m ou km, sans virgule
func affichageDistance(distance:Double) -> String {
    
    if distance < 1000 {
        return "\(Int(distance)) m"
    } else {
        return "\(Int(distance/1000)) km"
    }
}

//Fonction servant à modifier un string de numéro de téléphone pour le rendre utilisable par la machine
func formatNum(numero:String) -> String {
    var res = "" //Création d'un string vide qui contiendra le résultat de la fonction
    for lettre in numero {
        if lettre.isNumber { //Tous les caractères qui sont numériques sont ajoutés au résultat
            res.append(lettre)
        }
    }
    return res
}

//Fonction servant à trier une liste d'adresses en fonction de leur distance à l'utilisateur.
func triDistanceCroissante(liste:[AdresseData]) -> [AdresseData] {
    
    if liste.isEmpty { //S'il n'y a aucune adresse dans la liste entrante, rendre une liste vide
        return []
    } else {
        var res:[AdresseData] = [] //Création de la liste qui contiendra le résultat
        var inseree = false //Booléen qui sert à identifier l'élément actuel a déjà été inséré dans le résultat ou pas.
        
        for elem in liste { //elem représente l'élment à trier.
            if res.count == 0 { //Quand le résultat est vide (première itération), on y ajoute le premier élément à trier
                res.append(elem)
            } else { //Lors des itérations suivantes, on parcoure le tableau résultat. Si l'on trouve un index où la distance à l'utilisateur est plus grande que la distance de l'élément à l'utilisateur, on insère l'élément à cet index.
                for i in 0...res.count-1 {
                    let distanceAElement = donneesPartagees.positionUtilisateur.distance(from: CLLocation(latitude: elem.position.latitude, longitude: elem.position.longitude))
                    let distanceAComp = donneesPartagees.positionUtilisateur.distance(from: CLLocation(latitude: res[i].position.latitude, longitude: res[i].position.longitude))
                    if distanceAElement < distanceAComp {
                        res.insert(elem, at:i)
                        inseree = true //Si l'élément est inséré, on met à jour le booléen pour en tenir compte
                        break //On sort de la boucle pour éviter que l'élément ne soit ajouté plusieurs fois
                    }
                }
                if !inseree { //Si l'élément n'a pas été inséré dans résultat, ça signifie qu'il est plus grand que tous les autres.
                    res.append(elem) //Dans ce cas on l'ajoute à la fin de la liste.
                }
                inseree = false //On réinitialise insérée à false pour la prochaine intération.
            }
        }
        return res
    }
}


//Ajout d'une fonction à View pour formatter les boutons, de sorte qu'ils soient assez grands pour être cliqués (44x44) sans que l'icône soit trop grande
extension View {
    func formatageBouton() -> some View {
        self.font(.title2) //sert à augmenter la taille de l'icône
            .fixedSize() //sert à s'assurer que l'icône ne change plus de taille
            .frame(width: 44, height: 44) //sert à agrandir la zone cliquable
    }
}


//Liste d'addresses à afficher dans l'application
let listeAdresses = [
    AdresseData(adresse:"42 rue de la Réponse\r90000 Montreuil",
                position:(CLLocationCoordinate2D(latitude:48.86, longitude: 2.36)),
                service: .reparer,
                nom:"Roger Réparation",
                telephone: "10 09 09 09 09"),
    AdresseData(adresse:"42 rue de la Boustifaille\r90000 Paris",
                position:(CLLocationCoordinate2D(latitude:48.86, longitude: 2.35)),
                service: .reparer,
                nom:"Reparo Maxima",
                telephone: "10 08 08 08 08"),
    AdresseData(adresse:"1 rue Lorem Ipsum\r90000 Pontoise",
                position:(CLLocationCoordinate2D(latitude:48.86, longitude: 2.34)),
                service: .reparer,
                nom:"Bob le Bricoleur",
                telephone: "10 07 07 07 07"),
    AdresseData(adresse:"6 rue de Paris\r90000 SaintOuen",
                position:(CLLocationCoordinate2D(latitude:48.85, longitude: 2.36)),
                service: .donner,
                nom:"Emmaüs Saint-Ouen",
                telephone: "10 08 08 08 08"),
    AdresseData(adresse:"666 rue du Diable\r90000 Brest",
                position:(CLLocationCoordinate2D(latitude:48.84, longitude: 2.35)),
                service: .donner,
                nom:"Ensemble, donnons !",
                telephone: "10 06 06 06 06"),
    AdresseData(adresse:"123 rue du Placeholder\r90000 Placeholder",
                position:(CLLocationCoordinate2D(latitude:48.84, longitude: 2.34)),
                service: .reprendre,
                nom:"Super Placeholder Store",
                telephone: "10 04 04 04 04"),
    AdresseData(adresse:"123 rue du Placeholder\r90000 Placeholder",
                position:(CLLocationCoordinate2D(latitude:48.84, longitude: 2.34)),
                service: .reparer,
                nom:"Super Placeholder Store",
                telephone: "10 04 04 04 04"),
    AdresseData(adresse:"2 rue Lorem Ipsum\r90000 Dolor Sit Amet",
                position:(CLLocationCoordinate2D(latitude:48.85, longitude: 2.36)),
                service: .reprendre,
                nom:"L'électroménager selon Philipe",
                telephone: "10 05 05 05 05"),
    AdresseData(adresse:"Lieu-dit les Pets de Grolles\r90000 Issy-les-moulins",
                position:(CLLocationCoordinate2D(latitude:48.85, longitude: 2.34)),
                service: .composter,
                nom:"La ferme Jean-Pierre",
                telephone: "10 03 03 03 03"),
    AdresseData(adresse:"58 chemin du Moulin Rond\r90000 Niort",
                position:(CLLocationCoordinate2D(latitude:48.85, longitude: 2.35)),
                service: .reprendre,
                nom:"Déchetterie de Niort",
                telephone: "10 02 02 02 02"),
    AdresseData(adresse:"58 chemin du Moulin Rond\r90000 Niort",
                position:(CLLocationCoordinate2D(latitude:48.85, longitude: 2.35)),
                service: .composter,
                nom:"Déchetterie de Niort",
                telephone: "10 02 02 02 02")
]

struct Donnees {
    var adressesFavorites:[AdresseData] = []
    var positionUtilisateur = CLLocation(latitude: 48.856, longitude: 2.352)
}
var donneesPartagees = Donnees()
