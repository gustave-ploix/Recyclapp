import SwiftUI
import CoreLocation
import MapKit


//dictionnaire associant un élément de type Service avec un String qui permet d'afficher son nom
private let serviceLabel:[Service:String] = [.reparer:"Réparer", .donner:"Donner", .reprendre:"Reprendre", .composter:"Composter"]

//Structure servant à afficher les adresses cliquables sous forme de liste elles-mêmes incluses dans un segmented picker
struct ListeFavorisTrouvees: View {
    
    //Définition des propriétés
    @State var serviceChoisi:Service = .reparer //Variable qui contient le service sélectionné via le Picker
    @State private var adressesPourService: [Service:[AdresseData]] = DetailAdresseSupprimable.constructionSousListes() //Dictionnaire qui contient, pour chaque service, la liste des adresses proposant ce service
    
    //Initialisation des propriétés. dechet est une chaîne de caractère correspondant à l'objet scanné par l'utilisateur
    init(dechet:String) {
        //        adressesPourService =
        //        print(adressesPourService)//Création d'une listes d'adresses pour chaque service sélectionné
        
    }//Fin de l'init
    
    var body: some View {
        VStack {
            
            //Picker permettant de choisir le service qu'on souhaite chercher
            Picker(selection: $serviceChoisi, label: Text("Service")) {
                ForEach([Service.reparer, Service.donner, Service.reprendre, Service.composter]) {elem in
                    if let serv = serviceLabel[elem] {
                        Text(serv).tag(elem)}
                }
            }.pickerStyle(.segmented)
                .padding()
            
            //Liste des adresses disponibles pour le service selectionné
            if let lisAdress = adressesPourService[serviceChoisi] {
                List(lisAdress) {elem in
                    FavoriCliquable(adresse: elem, adressesServices: $adressesPourService)
                }.onAppear{
                    print("blablablax")
                }
                //Rajouter une func pour recalculer les 4 sous-listes à partir de la liste des Favoris.
            }
        }
    }
}
//Structure qui affiche un bouton cliquable montrant la distance jusqu'à l'adresse et le nom de l'adresse
struct FavoriCliquable: View {
    let adresse:AdresseData //constante qui contient l'adresse à afficher
    @State private var supprimerHistorique = false
    @State private var montrerDetail = false //booléen qui détermine si le détail de l'adresse sera affiché ou non
    @State var adresseCoordinate = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.856614, longitude: 2.3522219), latitudinalMeters: 5000, longitudinalMeters: 5000) //variable qui permet de stocker le MKCoordinateRegion de l'adresse, pour pouvoir d'affecter en binding à DetailAdresse. Faire comme ça me semble être le seul moyen de centrer la carte sur l'adresse.
    @Binding var adressesServices : [Service:[AdresseData]]
    
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
                        Image(systemName: "chevron.up").buttonStyle(.plain)
                    } else {
                        Image(systemName: "chevron.down").buttonStyle(.plain)
                    }
                }).padding()
                    .frame(width:50, height: 50)//Fin bouton chevron
                
            }//Fin du HStack
            
            //Affiche le détail de l'adresse si l'utilisateur l'a choisi. C'est à ce moment que le détail de l'adresse reçoit la valeur correcte de coordinate.
            if montrerDetail {
                DetailAdresseSupprimable(adresseInstance:adresse, coordinate: $adresseCoordinate, adressesServices: $adressesServices)
            }
            
        }//Fin du VStack AdresseCliquable
    }//Fin du body AdresseCliquable
    
}//Fin struc AdresseCliquable

//Structure permettant d'afficher le détail d'une adresse
struct DetailAdresseSupprimable: View {
    
    let adresseInstance:AdresseData //constante qui contient l'adresse à afficher
    @State private var isShowingAlert = false //Montre l'alerte si j'appuie sur la croix.
    @Binding var coordinate:MKCoordinateRegion //variable biding qui correspond aux coordonnées géographiques que Map doit afficher. Sa valeur sera affectée lors de son affichange dans AdresseCliquable.
    @State var favoris = []
    @Binding var adressesServices:[Service:[AdresseData]]
    
    var body: some View {
        VStack {
            
            HStack {
                Text(adresseInstance.adresse)
                Spacer()
                
                Button(action:{
                    //Ajout de l'adresse sélectionnée à la liste des adresses favorites
                    //                    donneesPartagees.adressesFavorites = ajouterSiAbsent(tableau: donneesPartagees.adressesFavorites, valeur: adresseInstance)
                    isShowingAlert.toggle()
                    
                }, label :{ //Apparence du bouton : une croix bleue
                    Image(systemName: "xmark")
                        .formatageBouton()
                })
                .buttonStyle(.plain)
                .foregroundColor(.blue)
                .alert("Are you sure to delete the address ?", isPresented: $isShowingAlert) {
                    Button("Delete", role: .destructive){
                        //                        print(adresseInstance)
                        donneesPartagees.adressesFavorites = aSupprimer(tableau:donneesPartagees.adressesFavorites,valeur:adresseInstance)
                        adressesServices = DetailAdresseSupprimable.constructionSousListes()
                    }
                    
                    //////                            // indexSet OnDelete qui marche avec un swipe
                }
            }//Fin HStack
            
            HStack {
                Text(adresseInstance.telephone)
                Spacer()
                
                Button(action:{
                    //Bouton qui servira à téléphoner à l'adresse choisie. Pas de fonctionnalité pour l'instant
                    //                    print("placeholder d'appel de téléphone")
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
        //Fin du body
    }
    
    
    func aSupprimer(tableau: [AdresseData], valeur:AdresseData) -> [AdresseData] {
        var resultat = tableau
        //    print("id à supprimer :",valeur.id)
        for index in 0...tableau.count - 1 {
            //        print("id de liste favori :", tableau[index].id)
            if tableau[index].id == valeur.id {
                resultat.remove(at:index)
                
            }
        }
        return resultat
    }
    
    static func constructionSousListes() -> [Service:[AdresseData]]{
        
        var resultat : [Service:[AdresseData]] = [:]
        print("construction sous-listes exécutée")
        for service in [Service.reparer, Service.donner, Service.reprendre, Service.composter] {
            resultat[service] = []
            for adresse in donneesPartagees.adressesFavorites {
                if adresse.service == service {
                    if let a = resultat[service] {
                        resultat[service] = a + [adresse]
                    }
                }
            }
        }
        print(resultat)
        return resultat
    }
}




//Code servant à la prévisualisation
struct ListeFav_Previews: PreviewProvider {
    static var previews: some View {
        ListeFavorisTrouvees(dechet:"Déchet")
    }
}
