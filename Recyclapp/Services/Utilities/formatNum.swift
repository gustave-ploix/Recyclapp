//
//  formatNum.swift
//  RecyclApp_fichiers_Nicolas
//
//  Created by Apprenant 97 on 29/03/2022.
//

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
