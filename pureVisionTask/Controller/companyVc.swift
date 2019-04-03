//
//  companyVc.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 4/2/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class companyVc: UIViewController {
    @IBOutlet weak var compAllDataTabel: UITableView!
    let allDataUrl = "https://ahmedhariedy62848.ipage.com/wazeftak/apis/allldatausers.php"
    var allDataList: [allDatuModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helpedFunctions.sharedInstance.getData(url: allDataUrl) { (data) in
            if let dataRes = data{
                do {
                   // let allDataJson = try JSONSerialization.jsonObject(with: dataRes, options: [])
                    //print(allDataJson)
                    
                    let json  = try JSONDecoder().decode(allData.self, from: dataRes)
                    self.allDataList = json.data
                    DispatchQueue.main.async {
                        self.compAllDataTabel.reloadData()
                    }
                    
                  
//                    else{
//                        AlertController.showAlert(self, title: "Error", message: "Somthing went wrong")
//                    }
                }
                catch let err as NSError {
                    AlertController.showAlert(self, title: "Error", message: "\(err.localizedDescription)")
                }
            }
        }
        
    }
    class func convertBase64ToImage(imageString: String) -> UIImage {
        let imageData = Data(base64Encoded: imageString, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
        return UIImage(data: imageData)!
    }
    
    



}
extension companyVc:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = compAllDataTabel.dequeueReusableCell(withIdentifier: "companyCell") as! companyCell
       cell.userName.text = allDataList[indexPath.row].fullname
        cell.userImage.image = companyVc.convertBase64ToImage(imageString: allDataList[indexPath.row].image_name)
        cell.userMobile.text = allDataList[indexPath.row].mobile
        cell.userPosition.text = allDataList[indexPath.row].position_name
        cell.userEmail.text = allDataList[indexPath.row].email
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 205
    }
    
    
}
extension UIImage {
    func toBase64() -> String? {
        guard let imageData = self.pngData() else { return nil }
        return imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
    }
}
