//
//  ViewController.swift
//  MyFirstProject
//
//  Created by Radoslaw Sobczak on 27/06/2020.
//  Copyright © 2020 Radoslaw Sobczak. All rights reserved.
//

import UIKit

class ViewController: UIViewController // dziedziczenie gdy po obu stronach : stoi TYP
{ // : dziedziczy
    @IBOutlet weak var textFieldCisnienie: UITextField! // : jest typu ; nazwa obiektu : nazwa klasy
    @IBOutlet weak var textFieldTetno: UITextField!
    @IBOutlet weak var textFieldSaturacja: UITextField!
    @IBOutlet weak var textFieldCukier: UITextField!
    @IBOutlet weak var TrybCiemnyLabel: UILabel!
    @IBOutlet weak var SwitchButton: UISwitch!
    @IBOutlet weak var TextViewProbny2: UITextView!
    @IBOutlet weak var ZaładujButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textFieldCisnienie.delegate = self
        //self jest biezaco aktywnym obiektem w ktorym self sie znajduje. ViewController jest delegatem akcji wywoływanych na rzecz textFieldCiesnienie. Wiadomosci beda przesyłane z textFieldCisnienie do VieControlera prrzy pomoc delegate
        
        textFieldTetno.delegate = self
        textFieldSaturacja.delegate = self
        textFieldCukier.delegate = self
        
    //dopisane 06.07.2020 do User default
    // wyciaganie z przegordki
    
    /*
    let userDefault = UserDefaults.standard
    TextViewProbny2.text = userDefault.string(forKey: "PodpisPrzegrodki")
 */
    }
    @IBAction func ZaładujButtonAkcja(_ sender: Any) {
        let userDefault = UserDefaults.standard
        TextViewProbny2.text = userDefault.string(forKey: "PodpisPrzegrodki")
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
          } else {
              view.backgroundColor = UIColor.white
              TrybCiemnyLabel.textColor = UIColor.black
          }
    }
    
    /*dopisane dn. 06.07.2020
    https://www.youtube.com/watch?v=KDloMlCwJnY */
   // tu wkladamy do przegrodki
    @IBAction func zapiszPrzycisk(_ sender: Any) {
        let userDefaults = UserDefaults.standard // standard -> Nazwa "magazynu". W takim magazynie mozna zapisprzegrodki rzegordem ma jakas nalepke. Jak chce wlozyc do magadzynu - to mozwie do jakiej przegordki to wkladam. A jak chce wyjaąć - z jakiej orzegodki chce to wyjac. Nazwa przegodki nadana jest sama. Nazwa magazynu to standard. Metoda "Set" przyjmuje 2 oarametry: 1 to wartosc ktora wkladam do przegordki , a druga wartosc - klucz - tj. nalepka tej przegordki
        userDefaults.set(TextViewProbny2.text, forKey: "PodpisPrzegrodki") // "podpisPrzegordki" -> nazwa etykiety. SET - to w tym przypadku USTAW -> Co / Gdzie.
    }
    
 // dopisane 07.07.2020 wpisywanie tylko cyfr
 // delegaty sa przypiete do TextField - na rzecz text fielda wykonuje sie akcja . Moj View Controler jest delegatem dla wszystkich text Fieldow. moze ragować na zdarzenie zmiany tekstu.
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let dopuszczalnyZnak = "+1234567890"
        let dopuszczlnyZnakZbior = CharacterSet(charactersIn: dopuszczalnyZnak) // dwa teskty: 1 tekst ktos wpisa, a drugi tekst jest wzorcem. I chce sprawdzic czy tekst wpisany jest zgodny ze wzorcem
        let typowanyZnakowZbior = CharacterSet(charactersIn: string) // [przygotowanie do tego by wywola linijke ponizej. By uzyc metody isSuper set musze miec 2 zbiory by je porownac. Te dwi liniki sa przygotowaniem do wywolania linikji ponizej. czyli te dwi linijki przygotowuja nam ZBIORY.
        return dopuszczlnyZnakZbior.isSuperset(of: typowanyZnakowZbior ) // metoda isSuperset - wbudowana metoda , ktora na dwoch zbiorach srawdza czy jeden zbior jest supersetem drugiego. Sprwdzmy czy dany zbior jest supersetem dla wpisanych znakow
    }

}// nawias zamykający klase

extension ViewController: UITextFieldDelegate { // tu tamy dzieczcenie klas. Superklasa: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { // metoda
        textField.resignFirstResponder()
        return true
    }
}
