//
//  addCertificatesVc.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 2/20/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class addCertificatesVc: UIViewController {
    var imgPicker = UIImagePickerController()
    var imageArray = [UIImage]()
    @IBOutlet weak var certTabel: UITableView!
    @IBOutlet weak var finishOutLet: UIButton!
    @IBOutlet weak var addImage: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "cirtInfo", comment: "")
        addImage.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "add", comment: ""), for: .normal)
        finishOutLet.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "continueKey", comment: ""), for: .normal)
        
        
        imgPicker.delegate = self
       
    }
    @IBAction func finishAct(_ sender: Any) {
        
    }
    
    @IBAction func addImageAct(_ sender: Any) {
        imgPicker.sourceType = .photoLibrary
        imgPicker.allowsEditing = true
        present(imgPicker, animated: true, completion: nil)
    }
   
    

}
extension addCertificatesVc:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cirtCell = certTabel.dequeueReusableCell(withIdentifier: "citCell") as! cirtClassCell
        cirtCell.imageSelected.image = imageArray[indexPath.row]
        return cirtCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 205
    }
    
    
}
extension addCertificatesVc: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let imageData = info[.originalImage] as? UIImage {
            imageArray.append(imageData)
            let indexPath = IndexPath(row: imageArray.count - 1, section: 0)
            certTabel.beginUpdates()
            certTabel.insertRows(at: [indexPath], with:.automatic)
            certTabel.endUpdates()
            
            
        }
        dismiss(animated: true, completion: nil)
    }
}
