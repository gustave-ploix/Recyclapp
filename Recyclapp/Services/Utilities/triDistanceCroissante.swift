import CoreLocation

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
                    let distanceAElement = geolocalisation.coordonnees().distance(from: CLLocation(latitude: elem.position.latitude, longitude: elem.position.longitude))
                    let distanceAComp = geolocalisation.coordonnees().distance(from: CLLocation(latitude: res[i].position.latitude, longitude: res[i].position.longitude))
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
