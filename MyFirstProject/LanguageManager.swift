//
//  LanguageManager.swift
//  MyFirstProject
//
//  Created by Radoslaw Sobczak on 16/07/2020.
//  Copyright © 2020 Radoslaw Sobczak. All rights reserved.
//

import Foundation

class languageMenager {
    
    static func pobierzJezyk(_ jezyk:String) -> [String:String] {
        
        switch jezyk {
        
        case "DE":
            return languageMenager.german
        
        case "PL":
            return languageMenager.polish
        
        default: return languageMenager.english // statyczne muszą byc poprzedzone nazwa klasy
        }
    }
    
    static let english: [String:String] = ["Label_DarkMode":"Dark mode" , "Label_CisnienieSkurczowe":"Systolic Pressure" , "Label_CiesnienieRozkurczowe":"Diastolic pressue" , "Label_tetno":"Heart rate" , "Label_cukier":"Glycemia" , "Label_SaturacjaKrwi":"Blood saturation" , "Button_Zatwierdz":"Confirm", "Button_Zapisz":"Save" , "Buton_Zaladuj":"Load"]
    
    static let polish: [String:String] = ["Label_DarkMode":"Tryb ciemny" , "Label_CisnienieSkurczowe":"Ciś. skurczowe" , "Label_CiesnienieRozkurczowe":"Ciś. rozkurcz." , "Label_tetno":"Tętno" , "Label_cukier":"Cukier" , "Label_SaturacjaKrwi":"Saturacja" , "Button_Zatwierdz":"Zatwierdź", "Button_Zapisz":"Zapisz" , "Buton_Zaladuj":"Załaduj"]
    
    static let german: [String:String] = ["Label_DarkMode":"Dunkel Mode" , "Label_CisnienieSkurczowe":"systolischer Druck" , "Label_CiesnienieRozkurczowe":"diastolischer Druck" , "Label_tetno":"Puls" , "Label_cukier":"Glykämie" , "Label_SaturacjaKrwi":"Blutsättigung" , "Button_Zatwierdz":"Bestätig", "Button_Zapisz":"Speichen" , "Buton_Zaladuj":"Load"]
}

 

