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
    // var imageArray = [UIImage]()
    var selectedImage: String!
    @IBOutlet var uploadToServerOutlet: UIButton!
    @IBOutlet var selectedImageOitlet: UIImageView!
    @IBOutlet var certTabel: UITableView!
    @IBOutlet var finishOutLet: UIButton!
    @IBOutlet var addImage: UIButton!
    @IBOutlet weak var topSpace: NSLayoutConstraint!
    @IBOutlet weak var doubleTapHint: UITextView!
    fileprivate let keychainAccess = KeychainAccess()
    fileprivate var userId = ""
    @IBOutlet var doubleTapGesture: UITapGestureRecognizer!
    
    let insertCert = "http://ahmedhariedy62848.ipage.com/wazeftak/apis/cert.php"
    override func viewDidLoad() {
        userId = keychainAccess.getPasscode(identifier: "user_id")!
        super.viewDidLoad()
        doubleTapGesture.delegate = self as? UIGestureRecognizerDelegate
        doubleTapGesture.numberOfTapsRequired = 2
        title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "cirtInfo", comment: "")
        addImage.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "add", comment: ""), for: .normal)
        finishOutLet.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "continueKey", comment: ""), for: .normal)
        uploadToServerOutlet.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "Done", comment: ""), for: .normal)
        doubleTapHint.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "tapTwice", comment: "")

        imgPicker.delegate = self
    }

    @IBAction func finishAct(_ sender: Any) {
        
    }
    
    @IBAction func doupleTapAction(_ sender: Any) {
        imgPicker.sourceType = .photoLibrary
        imgPicker.allowsEditing = true
        self.doubleTapHint.alpha = 0
        present(imgPicker, animated: true, completion: nil)
    }
    
    @IBAction func addImageAct(_ sender: Any) {
        
    }

    @IBAction func uploadAction(_ sender: UIButton) {
        if  self.selectedImageOitlet.image != nil  && self.selectedImageOitlet.image != UIImage(named: "tap-2") {
            let activityInd = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
            activityInd.color = UIColor.darkGray
            activityInd.center = view.center
            activityInd.startAnimating()
            view.addSubview(activityInd)
            let cirtificatePostData = insertCertData.init(certification_url: selectedImage, user_id: userId)
            helpedFunctions.sharedInstance.postDataWithOutRes(postData: cirtificatePostData, url: insertCert) { data in
                if let addCertificateData = data {
                    do {
                        let addCertRespJson = try JSONDecoder().decode(personalResponse.self, from: addCertificateData)
                        if addCertRespJson.message == "Successfully" {
                            DispatchQueue.main.async {
                                activityInd.stopAnimating()
                                activityInd.removeFromSuperview()
                                self.selectedImageOitlet.image = UIImage(named: "tap-2")
                                self.uploadToServerOutlet.alpha = 0
                                 self.topSpace.constant = 44
self.uploadToServerOutlet.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "addAnother", comment: ""), for: .normal)
                                
                            }
                        }
                        print(addCertRespJson)
                    } catch let err as NSError {
                        print(err)
                    }
                }
            }
        }
        else{
AlertController.showAlert(self, title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "emptyField", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "allReq", comment: ""))        }

    }
}

extension addCertificatesVc: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
        // return imageArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cirtCell = certTabel.dequeueReusableCell(withIdentifier: "citCell") as! cirtClassCell
        // cirtCell.imageSelected.image = selectedImage
        // imageArray[indexPath.row]
        return cirtCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 205
    }
}

extension addCertificatesVc: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let imageData = info[.originalImage] as? UIImage {
            // selectedImage = imageData
            selectedImageOitlet.image = imageData
            guard let imgData = imageData.pngData() else { return }
            selectedImage = imgData.base64EncodedString(options: .lineLength64Characters)
            self.uploadToServerOutlet.alpha = 1
           

            
        }
        dismiss(animated: true, completion: nil)
    }
}
