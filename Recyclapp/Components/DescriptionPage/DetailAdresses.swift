//
//  DetailAdresse.swift
//  RecyclApp_fichiers_Nicolas
//
//  Created by Apprenant 97 on 29/03/2022.
//
//  Nécessite StructuresCommunes

import SwiftUI
import CoreLocation
import MapKit

//Structure permettant d'afficher le détail d'une adresse
struct DetailAdresse: View {
    
    let adresseInstance:AdresseData //constante qui contient l'adresse à afficher
    @Binding var coordinate:MKCoordinateRegion //variable biding qui correspond aux coordonnées géographiques que Map doit afficher. Sa valeur sera affectée lors de son affichange dans AdresseCliquable.
    
    @State private var isShowingAlert = false
    @State var messageAlerte:String = "Placeholder"
    
    var body: some View {
        VStack {
            
            HStack {
                Text(adresseInstance.adresse)
                Spacer()
                
                Button(action:{
                    let ajout = ajouterSiAbsent(tableau: donneesPartagees.adressesFavorites, valeur: adresseInstance)
                    
                    //Ajout de l'adresse sélectionnée à la liste des adresses favorites
                    donneesPartagees.adressesFavorites = ajout.resultat
                    messageAlerte = ajout.dejaAjoute
                    
                    isShowingAlert = true
                    
                }, label :{ //Apparence du bouton : un coeur bleu
                    Image(systemName: "heart.fill")
                        .formatageBouton()
                })
                .alert(isPresented: $isShowingAlert){
                    Alert(title: Text(messageAlerte), dismissButton: .default(Text("OK")))
                }
                .buttonStyle(.plain)
                .foregroundColor(.blue)
            }//Fin HStack
            
            HStack {
                Text(adresseInstance.telephone)
                Spacer()
                
                Button(action:{
                    //Bouton qui sert à téléphoner à l'adresse choisie.
                    if let numero = URL(string: "tel://" + formatNum(numero: adresseInstance.telephone)){
                        print("appel passé")
                        UIApplication.shared.open(numero)
                    }
                    
                }, label :{ //Apparence du bouton : un téléphone bleu
                    Image(systemName: "phone.fill")
                        .formatageBouton()
                }).buttonStyle(.plain)
                    .foregroundColor(.blue)
            }//Fin HStack
            
            //Affice une carte centrée sur les coordonnées définies dans coordinates
            Map(coordinateRegion: $coordinate, annotationItems: [adresseInstance]) { elem in
                //Affiche un marqueur à la position de l'enseigne
                MapMarker(coordinate: elem.position, tint: .red)
            }.frame(height:200)
            
        }.padding() //Fin VStack
    }//Fin du body
}

//Fonction permettant d'ajouter une valeur de type AdresseData (dotée d'un UUID)  à une liste de favoris uniquement si elle n'y est pas déjà présente
func ajouterSiAbsent(tableau:[AdresseData], valeur:AdresseData) -> (resultat:[AdresseData], dejaAjoute:String) {
    
    //Vérifier que l'adresse n'a pas déjà été ajoutée
    var dejaAjoute = false
    for fav in tableau {
        if fav.id == valeur.id {
            dejaAjoute = true
        }
    }
    
    //Si l'adresse n'a pas déjà été ajouter, l'ajouter au tableau
    if !dejaAjoute {
        return (tableau + [valeur], "Ajouté aux favoris !")
    } else {
        return (tableau, "Déjà dans vos favoris.")
    }
}

//Prévisualisation
struct DetailAdresse_Previews: PreviewProvider {
    static var previews: some View {
        DetailAdresse(
            adresseInstance:AdresseData(
                adresse:"42 rue de la Réponse\r90000 Montreuil",
                position:(CLLocationCoordinate2D(latitude:48.86, longitude: 2.36)),
                service: .reparer,
                nom:"Roger Réparation",
                telephone: "10 09 09 09 09"),
            coordinate: .constant(
                MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: 48.85, longitude: 2.35),
                    latitudinalMeters: 10_000,
                    longitudinalMeters: 10_000)))
    }
}
