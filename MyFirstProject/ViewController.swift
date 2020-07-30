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
    
    // MARK: Outlets
    @IBOutlet weak var textFieldBloodPressure: UITextField! // : jest typu ; nazwa obiektu : nazwa klasy
    @IBOutlet weak var textFieldTetno: UITextField!
    @IBOutlet weak var textFieldBloodSaturation: UITextField!
    @IBOutlet weak var textFieldBloodSugarLevel: UITextField!
    @IBOutlet weak var labelDarkMode: UILabel!
    @IBOutlet weak var SwitchButton: UISwitch!
    @IBOutlet weak var textViewViewing: UITextView!
    @IBOutlet weak var buttonConfirm: UIButton!
    @IBOutlet weak var buttonSave: UIButton!
    @IBOutlet weak var buttonLoad: UIButton!
    @IBOutlet weak var textFieldDiastolicPressure: UITextField!
    @IBOutlet weak var buttonSetEnglischLanguage: UIButton!
    @IBOutlet weak var buttonSetPolishLanguage: UIButton!
    @IBOutlet weak var buttonSetGermanLanguage: UIButton!
    
    // MARK: - Variables
    var lingua: String = "PL"
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //view.backgroundColor = .red
        
        textFieldBloodPressure.delegate = self // cisnienie
        //self jest biezaco aktywnym obiektem w ktorym self sie znajduje. ViewController jest delegatem akcji wywoływanych na rzecz textFieldCiesnienie. Wiadomosci beda przesyłane z textFieldCisnienie do VieControlera prrzy pomoc delegate
        
        textFieldTetno.delegate = self
        textFieldBloodSaturation.delegate = self
        textFieldBloodSugarLevel.delegate = self
        textFieldDiastolicPressure.delegate = self
                
        // sprawdzanie jezyka w ustawieniach 21/07/2020
        func TakelanguageFromDevice() -> String {
            let langStr = NSLocale.current.languageCode
            
            switch langStr {
            case "deu" , "de" , "ger" : return "DE";
            case "en" : return "EN" ;
            default : return "PL"
            }
        }
        
        lingua = TakelanguageFromDevice()
        funcSetDescription()
        
    }

    override func viewDidAppear (_ animated: Bool) {
        
        let myLabel = LanguageMenager.downloadTheLanguage(lingua) // etykieta --> myLabel
        let alertNaglowek = myLabel["AlertNaglowek"]
        let alertBody = myLabel["AlertBody"]
        
        createAlert(tytul: alertNaglowek!, wiadomosc: alertBody!) // wyswietlanie alertu w roznych jezykach
        
    } // co ma sie wyswietlic w moim alercie. Jesli metoda jest nadpisywana tzn. ze ta metoda juz istnieje w klasie nazwej i istnieje z konkretna sygnatura.
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // funkcja przyjmuje 2 parametry TOUCHES: SET- zbôr obiektów UITouch z ewentem (zdarzeniem) - uzytkownik dokonał inteakcji z widokiem. Event jest typu UIEVENT, touches jest typu SET<>
        // ? oznacza ze UIEVENT jest nilem i czasami moze nie mic przypisanej wartosci lub akcji
        
        
        textFieldBloodPressure.resignFirstResponder()
        textFieldBloodSugarLevel.resignFirstResponder()
        textFieldTetno.resignFirstResponder()
        textFieldBloodSaturation.resignFirstResponder()
        //dodano 12.07.2020
        textFieldDiastolicPressure.resignFirstResponder()
    }
    
    // MARK: - Helper
    /* https://www.youtube.com/watch?v=4EAGIiu7SFU pojawianie sie okienka Pop Up */
    func createAlert(tytul: String, wiadomosc: String) {
        
        let alert = UIAlertController(title: tytul, message: wiadomosc, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default , handler: { (action) in alert.dismiss(animated: true, completion: nil)
                                        print ("OK") //jakie ma zawierac w sobie ten alert mozliwe akcje
        })) // handler to co ma sie stac w momencie gdy ta akcja zostanie wykonana. Competion - dodatkowy call back, co ma sie stać, gdy akcja sie zakończy. Comlietion = nih -> czyli ma sie nic nie dziac dodatkowego
        
        present(alert, animated: true, completion: nil) //tu wywołalismy metode o nazwie present. Self mowilo skad jest metoda. Self mozna pominac przy wywolaniu metod. Czyli self mówi nam w jakim kontekście jestem tzn :ViewController . A ViewController ma metode present.
        // Presents a view controller modally - modally czyli musisz najpierw zrobic cos bo inne opcje masz zablokowane. Czyli musiszy go zdyssmisowac.
    }
    
    func funcSetDescription(){
        let etiquette = LanguageMenager.downloadTheLanguage(lingua)
        
        //text field
        labelDarkMode.text = etiquette["Label_DarkMode"]
        textFieldBloodPressure.placeholder = etiquette["Label_CisnienieSkurczowe"]
        textFieldDiastolicPressure.placeholder = etiquette["Label_CiesnienieRozkurczowe"]
        textFieldTetno.placeholder = etiquette["Label_tetno"]
        textFieldBloodSugarLevel.placeholder = etiquette["Label_cukier"]
        textFieldBloodSaturation.placeholder = etiquette["Label_SaturacjaKrwi"]
        
        textViewViewing.text = etiquette["TextViewProbny_wyswietlanie_wskazowka"]
        
        //Buttony
        buttonConfirm.setTitle(etiquette["Button_Zatwierdz"], for: .normal)
        buttonSave.setTitle(etiquette["Button_Zapisz"], for: .normal)
        buttonLoad.setTitle(etiquette["Buton_Zaladuj"], for: .normal)
        
        buttonSetPolishLanguage.setTitle(etiquette["Button_Polski"], for: .normal) // wiele kontrole ma cos takiego, jak wyglad zelezy od swego stanu. A stan to obecna inteakcja z kontrolką. setTitel - zmienia tytl przycisku dla zadanego stanu.
        buttonSetEnglischLanguage.setTitle(etiquette["Button_Angielski"], for: .normal)
        buttonSetGermanLanguage.setTitle(etiquette["Button_Niemiecki"], for:. normal)
        
        //ustawOpis() - // spawia ze widzimy placeholder textViewProbny2 . Z wywołanym ustawOpis() widzimy cały tekst w TextViewProbny 2
        
    }
    
    func setDescription() {
        
        //text View tlumaczenie - wyświetlania - szablony
        // utworzenie nowego date formatera
        let timeFormat = DateFormatter()
        timeFormat.dateFormat = "dd/MM/yyyy HH:mm" // format czasu
        let data: String = timeFormat.string(from: Date())
        // przycisk odpowada za jakąś akcje. Za taką jaką sobie przypniemy.
        
        let etykiety = LanguageMenager.downloadTheLanguage(lingua)
        let template = etykiety["TextViewProbny_wyswietlanie"]
        let message = String(format: template!, data , textFieldBloodPressure.text! , textFieldDiastolicPressure.text! , textFieldTetno.text! , textFieldBloodSugarLevel.text!, textFieldBloodSaturation.text!) // ! ze tekst bedzie zawsze wyswietlany
        textViewViewing.text = message
        
    }
    
    // MARK: - Action
    @IBAction func actionButtonLoad (_ sender: Any) {
        let userDefault = UserDefaults.standard
        textViewViewing.text = userDefault.string(forKey: "PodpisPrzegrodki")
    }
    
    @IBAction func actionButtonConfirm (_ sender: UIButton) // przycisk jest obiektem tylko przez Xcoda zostala przypisana funckcja. // ZatwierdzButton --> actionButtonConfirm
    {
        setDescription()
    }
    
    @IBAction func actionButtonDarkMode(_ sender: Any) { // tryb ciemny

        if SwitchButton.isOn {
            overrideUserInterfaceStyle = .dark // nadpisanie stylu uzytkownika
        } else {
            overrideUserInterfaceStyle = .light
        }
    }
    
    /*
     https://www.youtube.com/watch?v=KDloMlCwJnY */
    // tu wkladamy do przegrodki
    @IBAction func actionButtonSave(_ sender: Any) {
        let userDefaults = UserDefaults.standard // standard -> Nazwa "magazynu". W takim magazynie mozna z przeprzegrodki rzegordem ma jakas nalepke. Jak chce wlozyc do magadzynu - to mozwie do jakiej przegordki to wkladam. A jak chce wyjaąć - z jakiej orzegodki chce to wyjac. Nazwa przegodki nadana jest sama. Nazwa magazynu to standard. Metoda "Set" przyjmuje 2 oarametry: 1 to wartosc ktora wkladam do przegordki , a druga wartosc - klucz - tj. nalepka tej przegordki
        userDefaults.set(textViewViewing.text, forKey: "PodpisPrzegrodki") // "podpisPrzegordki" -> nazwa etykiety. SET - to w tym przypadku USTAW -> Co / Gdzie.
    }
    
    @IBAction func actionButtonPolish(_ sender: Any) { // polskiButtonAktion --> actionButtonPolish
        lingua = "PL" //przypisalismy nowa wartosc do pola klasy o nazwie jezyk.
        funcSetDescription()
    }
    
    @IBAction func actionButtonGerman(_ sender: Any) { // niemieckiButtonAction -> actionButtonGerman
        lingua = "DE"
        funcSetDescription()
    }
    
    @IBAction func actionEnglischButton(_ sender: Any) { // angielskiButtonAction -> actionEnglischButton
        lingua = "EN"
        funcSetDescription()
    }
    
}// nawias zamykający klase

//MARK: - Delegate extension
// rozszzerzenie klasy ViewController , ktora dziedziczy po UITextFieldDelegate
extension ViewController: UITextFieldDelegate { // tu tamy dzieczcenie klas. Superklasa: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { // metoda
        textField.resignFirstResponder()
        return true
    }
    
    // delegaty sa przypiete do TextField - na rzecz text fielda wykonuje sie akcja . Moj View Controler jest delegatem dla wszystkich text Fieldow. moze ragować na zdarzenie zmiany tekstu.
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let acceptableSign = "+1234567890"
        let acceptableSignSet = CharacterSet(charactersIn: acceptableSign) // dwa teskty: 1 tekst ktos wpisa, a drugi tekst jest wzorcem. I chce sprawdzic czy tekst wpisany jest zgodny ze wzorcem
        let typicalCharacterSet = CharacterSet(charactersIn: string) // przygotowanie do tego by wywolać linijke poniżej. By uzyc metody isSuper set musze miec 2 zbiory by je porównać. Te dwie liniki są przygotowaniem do wywołania linikji poniżej, czyli te dwie linijki przygotowuja nam ZBIORY.
        return acceptableSignSet.isSuperset(of: typicalCharacterSet ) // metoda isSuperset - wbudowana metoda , ktora na dwoch zbiorach sprawdza czy jeden zbior jest supersetem drugiego. Sprwdzmy czy dany zbior jest supersetem dla wpisanych znakow
    }
    
}



