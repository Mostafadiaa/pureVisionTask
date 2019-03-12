//
//  personlVC.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 2/17/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit
struct religionData: Codable {
    let religion_id, religion_name,arabic_name: String
    
}


class personlVC: UIViewController {
    let bb = "https://amrwaheeed.000webhostapp.com/wazzaf-app/apis/religiondata.php"
    @IBOutlet var tapToChosePhoto: UITapGestureRecognizer!
    @IBOutlet weak var userImage: UIImageView!
   // @IBOutlet weak var contAcc: UIButton!
   // @IBOutlet weak var choseBut: UIButton!
    var imgPicker = UIImagePickerController()
    @IBOutlet weak var birthDatePicker: UIDatePicker!
    
   // @IBOutlet weak var appliNO: UILabel!
    @IBOutlet weak var persLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var adressField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var mobileField: UITextField!
    @IBOutlet weak var idNumField: UITextField!
    @IBOutlet weak var mailField: UITextField!
    @IBOutlet weak var mariStatLabel: UILabel!
    @IBOutlet weak var typelabel: UILabel!
    @IBOutlet weak var mariStatSegm: UISegmentedControl!
    @IBOutlet weak var typeSegm: UISegmentedControl!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var birthDateLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var natLabel: UILabel!
    @IBOutlet weak var religLabel: UILabel!
    @IBOutlet weak var tapTwice: UITextView!
    @IBOutlet weak var cityPicker: UIPickerView!
    @IBOutlet weak var natPicker: UIPickerView!
    @IBOutlet weak var religionPicker: UIPickerView!
    @IBOutlet weak var navTitel: UINavigationItem!
    @IBOutlet weak var countryPicer: UIPickerView!
    
    
    var countryNames = ["Egypt","KSA","London"]
    var cityNames = ["Giza","Cairo","Maadi"]
    var natNames = ["Egyptian","Saudi","American","Canadian"]
    var religionNames = ["Christian","Muslim","Other"]
    var strDate: String?
    let dateFormatter = DateFormatter()
    var relegList: [religionData] = []
    let arabicNumbers = [
        "٠": "0",
        "١": "1",
        "٢": "2",
        "٣": "3",
        "٤": "4",
        "٥": "5",
        "٦": "6",
        "٧": "7",
        "٨": "8",
        "٩": "9"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRelegion()
        
        //Formatter.locale = NSLocale(localeIdentifier: "EN") as Locale

       // MM/dd/yyyy
        //let loc = Locale(identifier: "en")
        //birthDatePicker.locale = loc
         dateFormatter.dateFormat = "dd/MM/yyyy"
         //strDate = dateFormatter.string(from: birthDatePicker.date)
        //let currentDate = NSDate()
        //let usDateFormat = DateFormatter()
        //usDateFormat.dateFormat = "d MMMM y"
       // usDateFormat.locale = NSLocale(localeIdentifier: "en_US") as Locale
       // cmt.date = usDateFormat.stringFromDate(currentDate)
        imgPicker.delegate = self
        navTitel.title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "personal", comment: "")
       // self.title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "personal", comment: "")
        tapToChosePhoto.delegate = self as? UIGestureRecognizerDelegate
        tapToChosePhoto.numberOfTapsRequired = 2
     //   contAcc.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "continueKey", comment: ""), for: .normal)
      //  choseBut.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "choseBut", comment: ""), for: .normal)
       // appliNO.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ApplicationNo", comment: "")
        tapTwice.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "tapTwice", comment: "")
        persLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "personal", comment: "")
        nameField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "name", comment: "")
        adressField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "address", comment: "")
        phoneField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "phone", comment: "")
        mobileField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "mobile", comment: "")
        idNumField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "idNo", comment: "")
        mailField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "email", comment: "")
        mariStatLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "marital", comment: "")
        typelabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "type", comment: "")
        mariStatSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "married", comment: ""), forSegmentAt: 0)
        mariStatSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "single", comment: ""), forSegmentAt: 1)
        typeSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "femaile", comment: ""), forSegmentAt: 0)
        typeSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "male", comment: ""), forSegmentAt: 1)
         cityLabel.text  = LocalizationSystem.sharedInstance.localizedStringForKey(key: "city", comment: "")
         countryName.text  = LocalizationSystem.sharedInstance.localizedStringForKey(key: "countryName", comment: "")
         religLabel.text  = LocalizationSystem.sharedInstance.localizedStringForKey(key: "religion", comment: "")
         natLabel.text  = LocalizationSystem.sharedInstance.localizedStringForKey(key: "nationality", comment: "")
        birthDateLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "dateBirth", comment: "")
        hideKeyboardWhenTappedAround()
        
        
    }
    

    @IBAction func tapTochoseImageAc(_ sender: Any) {
       
        UIView.animate(withDuration: 0.5) {
            self.tapTwice.alpha = 0.0
        }
        self.imgPicker.sourceType = .photoLibrary
        self.imgPicker.allowsEditing = true
        present(self.imgPicker, animated: true, completion: nil)
        
       
        
    }
    @IBAction func dateBirthAct(_ sender: Any) {
        strDate = dateFormatter.string(from: birthDatePicker.date)
        for (key,value) in arabicNumbers {
            strDate = strDate!.replacingOccurrences(of: key, with: value)
        }
       // print(strDate)
    }
    
    @IBAction func testJsonAction(_ sender: Any) {
        print(relegList)
        
    }
    func getRelegion(){
        guard let relData = URL(string: bb) else {
            return
        }
        var urlRequest = URLRequest(url: relData)
        urlRequest.httpMethod = "GET"
        let session = URLSession.shared
        let task =  session.dataTask(with: urlRequest) { (data, res, err) in
            guard let data = data else {
                return
            }
            do {
                let relJson = try JSONDecoder().decode([religionData].self, from: data)
                print(relJson)
                self.relegList = relJson
                DispatchQueue.main.async {
                    self.religionPicker.reloadAllComponents()
                }
               
                
            }
            catch let error as NSError{
                print(error)
            }
        }
        
        task.resume()
    }
    
    
    
    
}
extension personlVC:UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {

        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == cityPicker{
             return cityNames.count
        }
        else if pickerView == natPicker {
            return natNames.count
        }
        else if pickerView == religionPicker {
            return relegList.count
        }
        else if pickerView == countryPicer {
            return countryNames.count
        }
       return 1
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == cityPicker{
            print(cityNames[row])
        }
        else if pickerView == natPicker {
            print(natNames[row])
        }
        else if pickerView == religionPicker {
            if LocalizationSystem.sharedInstance.getLanguage() == "ar"{
                 print(relegList[row].religion_id)
            }
            else{
                 print(relegList[row].religion_id)
            }
           
        }
        else if pickerView == countryPicer{
             print(countryNames[row])
        }
       
       
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if pickerView == cityPicker{
            return cityNames[row]
        }
        else if pickerView == natPicker {
            return natNames[row]
        }
        else if pickerView == religionPicker {
            if LocalizationSystem.sharedInstance.getLanguage() == "ar"{
                 return relegList[row].arabic_name
            }
            else{
                return relegList[row].religion_name
            }
        }
        else if pickerView == countryPicer{
            return countryNames[row]
        }
        return ""
    }
    
    
}

extension personlVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let imageData = info[.originalImage] as? UIImage {
            userImage.image = imageData
            
        }
        dismiss(animated: true, completion: nil)
    }
}

