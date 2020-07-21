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
    @IBOutlet weak var ZatwierdzButton: UIButton!
    @IBOutlet weak var ZapiszButton: UIButton!
    @IBOutlet weak var ZaładujButton: UIButton!
    @IBOutlet weak var TextFieldCisnienieRozkurczowe: UITextField!
    @IBOutlet weak var angielskiButton: UIButton!
    @IBOutlet weak var polskiButton: UIButton!
    @IBOutlet weak var niemieckiButton: UIButton!
    
    var jezyk: String = "PL"
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //view.backgroundColor = .red
        
        textFieldCisnienie.delegate = self
    //self jest biezaco aktywnym obiektem w ktorym self sie znajduje. ViewController jest delegatem akcji wywoływanych na rzecz textFieldCiesnienie. Wiadomosci beda przesyłane z textFieldCisnienie do VieControlera prrzy pomoc delegate
        
        textFieldTetno.delegate = self
        textFieldSaturacja.delegate = self
        textFieldCukier.delegate = self
        //dopisano 12.07.2020
        TextFieldCisnienieRozkurczowe.delegate = self
        
    // dopisane 20.07.2020
        /*   //let langStr = Locale.current.languageCode
        let langStr = NSLocale.current.languageCode
    
        // cody ISO 639.2
        if langStr == "eng" {
            return ustawEtykiety("EN")
        } else if langStr == "ger" {
            return ustawEtykiety("DE")
        } else if langStr == "pol" {
            return ustawEtykiety("PL")
        }
 */
        
        // sprawdzanie jezyka w ustawieniach 21/07/2020
        func pobierzJezykZUstawien() -> String {
            
            let langStr = NSLocale.current.languageCode
            
        
            switch langStr {
            case "deu" , "de" , "ger" : return "DE";
            case "en" : return "EN" ;
            default : return "PL"
            }
        }
        
      jezyk = pobierzJezykZUstawien()
      
        ustawEtykiety()
        
    //dopisane 06.07.2020 do User default
    // wyciaganie z przegordki
        /*
    let userDefault = UserDefaults.standard
    TextViewProbny2.text = userDefault.string(forKey: "PodpisPrzegrodki")
 */
        //ustawEtykiety() // uruchamia etykiete
    }
    
    // dopisane 08.07.2020
    override func viewDidAppear (_ animated: Bool) {
        // dopisono 21/07/2020
        
        let etykiety = languageMenager.pobierzJezyk(jezyk)
        let alertNaglowek = etykiety["AlertNaglowek"]
        let alertBody = etykiety["AlertBody"]
        
        stworzAlert(tytul: alertNaglowek!, wiadomosc: alertBody!)
        
    } // co ma sie wyswietlic w moim alercie. Jesli metoda jest nadpisywana tzn. ze ta metoda juz istnieje w klasie nazwej i istnieje z konkretna sygnatura.
    
    @IBAction func ZaładujButtonAkcja(_ sender: Any) {
        let userDefault = UserDefaults.standard
        TextViewProbny2.text = userDefault.string(forKey: "PodpisPrzegrodki")
    }
    
    @IBAction func ZatwierdzButton(_ sender: UIButton) // przycisk jest obiektem tylko przez Xcoda zostala przypisana funckcja.
        
    {

        // placeholder daty
       // let jakisTekst: String = "\(data)\n Ciśnienie: \(textFieldCisnienie.text!) /  \(TextFieldCisnienieRozkurczowe.text!)\n Tętno: \(textFieldTetno.text!) uderzeń na minutę\n Saturacja: \(textFieldSaturacja.text!) %\n Cukier: \(textFieldCukier.text!) mg/dL"
       // TextViewProbny2.text = jakisTekst
        
        ustawOpis()

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    // funkcja przyjmuje 2 parametry TOUCHES: SET- zbôr obiektów UITouch z ewentem (zdarzeniem) - uzytkownik dokonał inteakcji z widokiem. Event jest typu UIEVENT, touches jest typu SET<>
    // ? oznacza ze UIEVENT jest nilem i czasami moze nie mic przypisanej wartosci lub akcji
    
    
        textFieldCisnienie.resignFirstResponder()
        textFieldCukier.resignFirstResponder()
        textFieldTetno.resignFirstResponder()
        textFieldSaturacja.resignFirstResponder()
        //dodano 12.07.2020
        TextFieldCisnienieRozkurczowe.resignFirstResponder()
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
        let userDefaults = UserDefaults.standard // standard -> Nazwa "magazynu". W takim magazynie mozna z przeprzegrodki rzegordem ma jakas nalepke. Jak chce wlozyc do magadzynu - to mozwie do jakiej przegordki to wkladam. A jak chce wyjaąć - z jakiej orzegodki chce to wyjac. Nazwa przegodki nadana jest sama. Nazwa magazynu to standard. Metoda "Set" przyjmuje 2 oarametry: 1 to wartosc ktora wkladam do przegordki , a druga wartosc - klucz - tj. nalepka tej przegordki
        userDefaults.set(TextViewProbny2.text, forKey: "PodpisPrzegrodki") // "podpisPrzegordki" -> nazwa etykiety. SET - to w tym przypadku USTAW -> Co / Gdzie.
    }
    
 // dopisane 07.07.2020 wpisywanie tylko cyfr
 // delegaty sa przypiete do TextField - na rzecz text fielda wykonuje sie akcja . Moj View Controler jest delegatem dla wszystkich text Fieldow. moze ragować na zdarzenie zmiany tekstu.
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let dopuszczalnyZnak = "+1234567890 /" // dodano znak / i spacja
        let dopuszczlnyZnakZbior = CharacterSet(charactersIn: dopuszczalnyZnak) // dwa teskty: 1 tekst ktos wpisa, a drugi tekst jest wzorcem. I chce sprawdzic czy tekst wpisany jest zgodny ze wzorcem
        let typowanyZnakowZbior = CharacterSet(charactersIn: string) // przygotowanie do tego by wywolać linijke poniżej. By uzyc metody isSuper set musze miec 2 zbiory by je porównać. Te dwie liniki są przygotowaniem do wywołania linikji poniżej, czyli te dwie linijki przygotowuja nam ZBIORY.
        return dopuszczlnyZnakZbior.isSuperset(of: typowanyZnakowZbior ) // metoda isSuperset - wbudowana metoda , ktora na dwoch zbiorach sprawdza czy jeden zbior jest supersetem drugiego. Sprwdzmy czy dany zbior jest supersetem dla wpisanych znakow
    }
    
    /*dopisane 08.07.2020
     https://www.youtube.com/watch?v=4EAGIiu7SFU pojawianie sie okienka Pop Up
     */
    func stworzAlert(tytul: String, wiadomosc: String) {
        
        let alert = UIAlertController(title: tytul, message: wiadomosc, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default ,
                                      handler: { (action) in alert.dismiss(animated: true, completion: nil)
            print ("OK") //jakie ma zawierac w sobie ten alert mozliwe akcje
        })) // handler to co ma sie stac w momencie gdy ta akcja zostanie wykonana. Competion - dodatkowy call back, co ma sie stać, gdy akcja sie zakończy. Comlietion = nih -> czyli ma sie nic nie dziac dodatkowego
        
        present(alert, animated: true, completion: nil) //tu wywołalismy metode o nazwie present. Self mowilo skad jest metoda. Self mozna pominac przy wywolaniu metod. Czyli self mówi nam w jakim kontekście jestem tzn :ViewController . A ViewController ma metode present.
       // Presents a view controller modally - modally czyli musisz najpierw zrobic cos bo inne opcje masz zablokowane. Czyli musiszy go zdyssmisowac.
    }
    
    func ustawEtykiety(){
    
        let etykiety = languageMenager.pobierzJezyk(jezyk)
        
        //text field
        TrybCiemnyLabel.text = etykiety["Label_DarkMode"]
        textFieldCisnienie.placeholder = etykiety["Label_CisnienieSkurczowe"]
        TextFieldCisnienieRozkurczowe.placeholder = etykiety["Label_CiesnienieRozkurczowe"]
        textFieldTetno.placeholder = etykiety["Label_tetno"]
        textFieldCukier.placeholder = etykiety["Label_cukier"]
        textFieldSaturacja.placeholder = etykiety["Label_SaturacjaKrwi"]
        
        // dopisano 21.07.2020
        TextViewProbny2.text = etykiety["TextViewProbny_wyswietlanie_wskazowka"]
        
        //Buttony
        ZatwierdzButton.setTitle(etykiety["Button_Zatwierdz"], for: .normal)
        ZapiszButton.setTitle(etykiety["Button_Zapisz"], for: .normal)
        ZaładujButton.setTitle(etykiety["Buton_Zaladuj"], for: .normal)
        
        polskiButton.setTitle(etykiety["Button_Polski"], for: .normal) // wiele kontrole ma cos takiego, jak wyglad zelezy od swego stanu. A stan to obecna inteakcja z kontrolką. setTitel - zmienia tytl przycisku dla zadanego stanu.
        angielskiButton.setTitle(etykiety["Button_Angielski"], for: .normal)
        niemieckiButton.setTitle(etykiety["Button_Niemiecki"], for:. normal)
       
        //dopisano 21.07.2020
      //ustawOpis() - // spawia ze widzimy placeholder textViewProbny2 . Z wywołanym ustawOpis() widzimy cały tekst w TextViewProbny 2
        
 }
    
    @IBAction func polskiButtonAktion(_ sender: Any) {
        jezyk = "PL" //przypisalismy nowa wartosc do pola klasy o nazwie jezyk.
        ustawEtykiety()
    }
   
    @IBAction func niemieckiButtonAction(_ sender: Any) {
        jezyk = "DE"
        ustawEtykiety()
    }
    
    @IBAction func angielskiButtonAction(_ sender: Any) {
        jezyk = "EN"
        ustawEtykiety()
    }
    
    func ustawOpis() {
             
    //text View tlumaczenie - wyświetlania - szablony
    // utworzenie nowego date formatera
    let formaterCzasu = DateFormatter()
    formaterCzasu.dateFormat = "dd/MM/yyyy HH:mm" // format czasu
    let data: String = formaterCzasu.string(from: Date())
    // przycisk odpowada za jakąś akcje. Za taką jaką sobie przypniemy.
        
    let etykiety = languageMenager.pobierzJezyk(jezyk)
    let szablon = etykiety["TextViewProbny_wyswietlanie"]
    let wiadomosc = String(format: szablon!, data , textFieldCisnienie.text! , TextFieldCisnienieRozkurczowe.text! , textFieldTetno.text! , textFieldCukier.text!, textFieldSaturacja.text!) // ! ze tekst bedzie zawsze wyswietlany
        TextViewProbny2.text = wiadomosc
        
    }

}// nawias zamykający klase
// rozszzerzenie klasy ViewController , ktora dziedziczy po UITextFieldDelegate
extension ViewController: UITextFieldDelegate { // tu tamy dzieczcenie klas. Superklasa: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { // metoda
        textField.resignFirstResponder()
        return true
    }
}



