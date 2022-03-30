import CoreLocation

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
