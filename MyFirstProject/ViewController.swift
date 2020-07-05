//
//  ViewController.swift
//  MyFirstProject
//
//  Created by Radoslaw Sobczak on 27/06/2020.
//  Copyright © 2020 Radoslaw Sobczak. All rights reserved.
//

import UIKit

class ViewController: UIViewController  // dziedziczenie gdy po obu stronach : stoi TYP
{ // : dziedziczy
    @IBOutlet weak var textFieldCisnienie: UITextField! // : jest typu ; nazwa obiektu : nazwa klasy
    @IBOutlet weak var textFieldTetno: UITextField!
    @IBOutlet weak var textFieldSaturacja: UITextField!
    @IBOutlet weak var textFieldCukier: UITextField!
    @IBOutlet weak var TrybCiemnyLabel: UILabel!
    @IBOutlet weak var SwitchButton: UISwitch!
    @IBOutlet weak var TextViewProbny2: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textFieldCisnienie.delegate = self
        //self jest biezaco aktywnym obiektem w ktorym self sie znajduje. ViewController jest delegatem akcji wywoływanych na rzecz textFieldCiesnienie. Wiadomosci beda przesyłane z textFieldCisnienie do VieControlera prrzy pomoc delegate
        
        textFieldTetno.delegate = self
        textFieldSaturacja.delegate = self
        textFieldCukier.delegate = self

    }
    
    @IBAction func ZatwierdzButton(_ sender: UIButton) // przycisk jest obiektem tylko przez XX coda zostala przypisana funckcja. I
        
    {
    // pobierz text z texf Field
    //let cisnienie = textFieldCisnienie.text
    // zaktualizuj poprzedni tekst z text view
    //    TextView.text = cisnienie
        
        // przycisk odpowada za jakąś akcje. Za taką jaką sobi eprzypniemy. Ja zadecydowalem,
        
        TextViewProbny2.text = "Ciśnienie: \(textFieldCisnienie.text!)\n Tętno: \(textFieldTetno.text!) uderzeń na minutę\n Saturacja: \(textFieldSaturacja.text!) %\n Cukier: \(textFieldCukier.text!) mg/dL"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    // funcka przyjmuje 2 parametry TOUCHES: SET- zbôr obiektów UITouch z ewentem (zdarzeniem) - uzytkownik dokonał inteakcji z widokiem. Event jes ttypu UIEVENT, touches jest typu SET<>
        // ? oznacza ze UIEVENT jest nilem i czasami moze nie mic przypisanej wartosci lub akcji
    
    
        textFieldCisnienie.resignFirstResponder()
        textFieldCukier.resignFirstResponder()
        textFieldTetno.resignFirstResponder()
        textFieldSaturacja.resignFirstResponder()
    }
    
    // tryb ciemny
    @IBAction func TrybCiemnyAkcja(_ sender: Any) {
       // print ("ABC")
        
        if SwitchButton.isOn {
              view.backgroundColor = UIColor.black
              TrybCiemnyLabel.textColor = UIColor.white
           //TextViewProbny2.textColor = UIColor. // czy to odpowiada za zmiane koloru liter w Text View ?

          } else {
              view.backgroundColor = UIColor.white
              TrybCiemnyLabel.textColor = UIColor.black
            //TextViewProbny2.textColor = UIColor.black   // czy to odpowiada za zmiane koloru liter w Text View ?
          }
    
    }
/*
      if outletSwitch.isOn == true {
            view.backgroundColor = UIColor.black
            labelTrybCiemny.textColor = UIColor.white
         TextViewProbny2.textColor = UIColor.white // czy to odpowiada za zmiane koloru liter w Text View ?

        } else {
            view.backgroundColor = UIColor.white
            labelTrybCiemny.textColor = UIColor.black
          TextViewProbny2.textColor = UIColor.black   // czy to odpowiada za zmiane koloru liter w Text View ?
        }
     }
 */

}// nawias zamykający klase

extension ViewController: UITextFieldDelegate { // tu tamy dzieczcenie klas. Superklasa: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { // metoda
        textField.resignFirstResponder()
        return true
    }
}
