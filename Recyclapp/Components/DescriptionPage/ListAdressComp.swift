
//  Nécessite StructuresCommunes

import SwiftUI
import CoreLocation
import MapKit

//dictionnaire associant un nom d'objet à une liste de services applicables à cet objet
private let servicesApplicables: [String:[Service]] = [
    "mouse, computer mouse" : [.reparer, .donner, .reprendre],
    "Banane" : [.composter]
]

//dictionnaire associant un élément de type Service avec un String qui permet d'afficher son nom
private let serviceLabel:[Service:String] = [.reparer:"Réparer", .donner:"Donner", .reprendre:"Reprendre", .composter:"Composter"]

//Structure servant à afficher les adresses cliquables sous forme de liste elles-mêmes incluses dans un segmented picker
struct ListeAdressesTrouvees: View {
    
    //Définition des propriétés
    @State var serviceChoisi:Service = .reparer //Variable qui contient le service sélectionné via le Picker
    
    private var adressesPourService: [Service:[AdresseData]] = [:] //Dictionnaire qui contient, pour chaque service, la liste des adresses proposant ce service
    
    private var listeServices:[Service] = [] //Liste des services adaptés au déchet scanné par l'utilisateur
    
    //Initialisation des propriétés. dechet est une chaîne de caractère correspondant à l'objet scanné par l'utilisateur
    init(dechet:String) {
        
        //Si le déchet scanné a une entrée dans le dictionnaire, on récupère la liste des services applicables à cet objet.
        if let lis = servicesApplicables["mouse, computer mouse"] {
            print("clé dans le dictionnaire")//OK
            listeServices = lis
            serviceChoisi = listeServices[0]
        }
        
        //Création d'une listes d'adresses pour chaque service sélectionné
        for service in listeServices {
            adressesPourService[service] = []
            for adresse in listeAdresses {
                if adresse.service == service {
                    if let a = adressesPourService[service] {
                        adressesPourService[service] = a + [adresse]
                        print("adresse ajoutée ?") // ok
                    }
                }
            }
        }
        
        // Triage de chaque liste en foction de la distance croissante à l'utilisateur
        for service in adressesPourService.keys {
            if let elem = adressesPourService[service] {
                adressesPourService[service] = triDistanceCroissante(liste:elem)
                    print("service ajouté ?") // ok
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
            }
            .pickerStyle(.segmented)
                .padding()
            
            //Liste des adresses disponibles pour le service sélectionné
            if let lisAdress = adressesPourService[serviceChoisi] {
                List(lisAdress) {elem in
                    AdresseCliquable(adresse: elem)
                    
                }
                
            }
            
        }
    }
}

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
                    distance: donneesPartagees.positionUtilisateur.distance( //2: Calcul de la distance en mètres entre la position de l'utilisateur (définie en dur dans donneesPartagees, et la position de l'adresse
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

//Structure permettant d'afficher le détail d'une adresse
struct DetailAdresse: View {
    
    let adresseInstance:AdresseData //constante qui contient l'adresse à afficher
    @Binding var coordinate:MKCoordinateRegion //variable biding qui correspond aux coordonnées géographiques que Map doit afficher. Sa valeur sera affectée lors de son affichange dans AdresseCliquable.
    
    
    var body: some View {
        VStack {
            
            HStack {
                Text(adresseInstance.adresse)
                Spacer()
                
                Button(action:{
                    //Ajout de l'adresse sélectionnée à la liste des adresses favorites
                    donneesPartagees.adressesFavorites = ajouterSiAbsent(tableau: donneesPartagees.adressesFavorites, valeur: adresseInstance)
                    print("bouton activé")
                }, label :{ //Apparence du bouton : un coeur bleu
                    Image(systemName: "heart.fill")
                        .formatageBouton()
                }).buttonStyle(.plain)
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
func ajouterSiAbsent(tableau: [AdresseData], valeur: AdresseData) -> [AdresseData] {
    
    //Vérifier que l'adresse n'a pas déjà été ajoutée
    var dejaAjoute = false
    for fav in tableau {
        if fav.id == valeur.id {
            dejaAjoute = true
        }
    }
    
    //Si l'adresse n'a pas déjà été ajouter, l'ajouter au tableau
    if !dejaAjoute {
        return tableau + [valeur]
    } else {
        return tableau
    }
}



//Code servant à la prévisualisation
struct ListeAdressesTrouvees_Previews: PreviewProvider {
    static var previews: some View {
        ListeAdressesTrouvees(dechet:"Enceinte")
    }
}
