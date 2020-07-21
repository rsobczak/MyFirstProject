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
    
    static let english: [String:String] = ["Label_DarkMode":"Dark mode" , "Label_CisnienieSkurczowe":"Systolic Pressure" , "Label_CiesnienieRozkurczowe":"Diastolic pressue" , "Label_tetno":"Heart rate" , "Label_cukier":"Glycemia" , "Label_SaturacjaKrwi":"Blood saturation" , "Button_Zatwierdz":"Confirm", "Button_Zapisz":"Save" , "Buton_Zaladuj":"Load" , "Button_Polski":"Polish" , "Button_Niemiecki":"German", "Button_Angielski":"English" , "TextViewProbny_wyswietlanie_wskazowka":"This should be pressure, heart rate, sugar and saturation." , "TextViewProbny_wyswietlanie":"%@  \n These are your parameters: \n Your blood pressure: %@ / %@ mmHg \n Pulse: %@ per minute \n Blood sugar level: %@ mg/dL \n Blood saturation: %@ %%" , "AlertNaglowek": "Please enter blood pressures" , "AlertBody":" systolic pressure / diastolic pressure " ]
    
    static let polish: [String:String] = ["Label_DarkMode":"Tryb ciemny" , "Label_CisnienieSkurczowe":"Ciś. skurczowe" , "Label_CiesnienieRozkurczowe":"Ciś. rozkurcz." , "Label_tetno":"Tętno" , "Label_cukier":"Cukier" , "Label_SaturacjaKrwi":"Saturacja" , "Button_Zatwierdz":"Zatwierdź", "Button_Zapisz":"Zapisz" , "Buton_Zaladuj":"Załaduj" , "Button_Polski":"Polski" , "Button_Niemiecki":"Niemiecki", "Button_Angielski":"Angielski", "TextViewProbny_wyswietlanie_wskazowka":"Tu powinno być ciśnienie, tętno, cukier i saturacja." , "TextViewProbny_wyswietlanie": "%@ \n Twoje ciśnienie wynosi: %@ / %@  mmHg \n Tętno: %@ na minute \n Poziom cukru: %@ mg/dL \n Saturacja: %@ %%" , "AlertNaglowek": "Proszę wprowadzic wartości ciśnienia" , "AlertBody":" ciś. skurczowe / ciś. rozkurczowe" ]
    
    static let german: [String:String] = ["Label_DarkMode":"Dunkel Mode" , "Label_CisnienieSkurczowe":"sys. Druck" , "Label_CiesnienieRozkurczowe":"dia. Druck" , "Label_tetno":"Puls" , "Label_cukier":"Glykämie" , "Label_SaturacjaKrwi":"Blutsättigung" , "Button_Zatwierdz":"Bestätig", "Button_Zapisz":"Speichen" , "Buton_Zaladuj":"Load" , "Button_Polski":"Polnisch" , "Button_Niemiecki":"Deutsch", "Button_Angielski":"English" , "TextViewProbny_wyswietlanie_wskazowka":"Dies sollten Druck, Herzfrequenz, Zucker und Sättigung sein." , "TextViewProbny_wyswietlanie":"%@ \nDies sind Ihre Parameter: \n Ihr Blutdruck: %@ / %@ mmHg \n Puls: %@ per Minute \n Blutzuckerspiegel: %@ mg/dL \n Blutsättigung: %@ %%" , "AlertNaglowek": "Bitte geben Sie den Blutdruck ein" , "AlertBody": "systolischer Druck / diastolischer Druck" ]
}

 
/*
 "\(data)\n Ciśnienie: \(textFieldCisnienie.text!) /  \(TextFieldCisnienieRozkurczowe.text!)\n Tętno: \(textFieldTetno.text!) uderzeń na minutę\n Saturacja: \(textFieldSaturacja.text!) %\n Cukier: \(textFieldCukier.text!) mg/dL"
 */
