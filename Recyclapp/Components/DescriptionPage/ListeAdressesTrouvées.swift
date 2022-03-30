//
//  ListeAdressesTrouvees.swift
//  RecyclApp_fichiers_Nicolas
//
//  Created by Apprenant 97 on 23/03/2022.
//
//  Nécessite StructuresCommunes, AdresseCliquable et DetailAdresse

import SwiftUI
import CoreLocation
import MapKit


//dictionnaire associant un nom d'objet à une liste de services applicables à cet objet
private let servicesApplicables: [String:[Service]] = [
    "desktop computer" : [.reparer, .donner, .reprendre],
    "water bottle" : [.reparer, .donner, .reprendre],
    "banana" : [.composter]
]


//dictionnaire associant un élément de type Service avec un String qui permet d'afficher son nom
private let serviceLabel:[Service:String] = [.reparer:"Réparer", .donner:"Donner", .reprendre:"Reprendre", .composter:"Composter"]


//Structure servant à afficher les adresses cliquables sous forme de liste elles-mêmes incluses dans un segmented picker
struct ListeAdressesTrouvees: View {
    
    @State var serviceChoisi:Service //Variable qui contient le service sélectionné via le Picker
    private var adressesPourService: [Service:[AdresseData]] = [:] //Dictionnaire qui contient, pour chaque service, la liste des adresses proposant ce service
    private var listeServices:[Service] = [] //Liste des services adaptés au déchet scanné par l'utilisateur
    
    //Initialisation des propriétés. dechet est une chaîne de caractère correspondant à l'objet scanné par l'utilisateur
    init(dechet:String) {
        
        //Si le déchet scanné a une entrée dans le dictionnaire, on récupère la liste des services applicables à cet objet.
        if let lis = servicesApplicables[dechet] {
            listeServices = lis
            print(listeServices)
            serviceChoisi = listeServices[0]
            print(serviceChoisi)
        } else {
            serviceChoisi = .reparer
        }
        
        //Création d'une listes d'adresses pour chaque service sélectionné
        for service in listeServices {
            adressesPourService[service] = []
            for adresse in listeAdresses {
                if adresse.service == service {
                    if let a = adressesPourService[service] {
                        adressesPourService[service] = a + [adresse]
                    }
                }
            }
        }
        
        // Triage de chaque liste en foction de la distance croissante à l'utilisateur
        for service in adressesPourService.keys {
            if let elem = adressesPourService[service] {
                adressesPourService[service] = triDistanceCroissante(liste:elem)
            }
        }
    }//Fin de l'init
    
    var body: some View {
        VStack {
            
            //Picker permettant de choisir le service qu'on souhaite chercher
            Picker(selection: $serviceChoisi, label: Text("Service")) {
                ForEach(listeServices) {elem in
                    if let serv = serviceLabel[elem] {
                        Text(serv).tag(elem)}
                }
            }.pickerStyle(.segmented)
                .padding()
            
            //Liste des adresses disponibles pour le service sélectionné
            if let lisAdress = adressesPourService[serviceChoisi] {
                List(lisAdress) {elem in
                    AdresseCliquable(adresse: elem)
                }
            }

        }//Fin VStack
    }//Fin body
}


//Code servant à la prévisualisation
struct ListeAdressesTrouvees_Previews: PreviewProvider {
    static var previews: some View {
        ListeAdressesTrouvees(dechet:"Banane")
    }
}
