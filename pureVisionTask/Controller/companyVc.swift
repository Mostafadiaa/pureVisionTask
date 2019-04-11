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
    let getData = "https://ahmedhariedy62848.ipage.com/wazeftak/apis/alldatadiaa.php"
    var allDataList: [allDatuModel] = []
    var allUserDataList : [allUserData] = []
    let  keychainAccess = KeychainAccess()
   // var tsetText :Data!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helpedFunctions.sharedInstance.showActivityIndicator(uiView: self.view)
        compAllDataTabel.isHidden = true
        helpedFunctions.sharedInstance.getData(url: allDataUrl) { (data) in
            if let dataRes = data{
                do {
                    let json  = try JSONDecoder().decode(allData.self, from: dataRes)
                    if json.status == 150{
                        self.allDataList = json.data
                        DispatchQueue.main.async {
                            self.compAllDataTabel.reloadData()
                            self.compAllDataTabel.isHidden = false
                            helpedFunctions.sharedInstance.hideActivityIndicator(uiView: self.view)
                        }
                    }
                    else{
                        AlertController.showAlert(self, title: "Error", message: "Somthing went wrong")
                    }
                }
                catch let err as NSError {
                    AlertController.showAlert(self, title: "Error", message: "\(err.localizedDescription)")
                }
            }
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        if let selectionIndexPath = self.compAllDataTabel.indexPathForSelectedRow {
            self.compAllDataTabel.deselectRow(at: selectionIndexPath, animated: false)
        }
    }
    
    
    @IBAction func signOutComp(_ sender: UIBarButtonItem) {
        UserDefaults.standard.set(false, forKey: "logedIn")
        UserDefaults.standard.set(nil, forKey: "logedInType")
        UserDefaults.standard.synchronize()
        self.keychainAccess.setPasscode(identifier: "user_id", passcode: "")
        let loginViewController = storyboard?.instantiateViewController(withIdentifier: "loginVc") as! loginVc
        present(loginViewController,animated: true)

    }
    
    class func convertBase64ToImage(imageString: String) -> UIImage {
        let imageData = Data(base64Encoded: imageString, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
        return UIImage(data: imageData)!
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc  = segue.destination as! userIdViewVc
        vc.allUserDataListSegue = self.allUserDataList
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
        cell.userPosition.text = allDataList[indexPath.row].position_name
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        compAllDataTabel.isUserInteractionEnabled = false
        helpedFunctions.sharedInstance.showActivityIndicator(uiView: self.view)
       let postUserId =  postUserIdData.init(user_id: allDataList[indexPath.row].user_id)
        helpedFunctions.sharedInstance.postDataWithOutRes(postData: postUserId, url: getData) { (data) in
            if let data  = data{
                do {
                    let selectedUserJson = try JSONDecoder().decode(selectedUserData.self, from: data)
                    DispatchQueue.main.async {
                        self.allUserDataList =  selectedUserJson.data
                        self.performSegue(withIdentifier: "getUserData", sender: self)
                        self.compAllDataTabel.isUserInteractionEnabled = true
                        helpedFunctions.sharedInstance.hideActivityIndicator(uiView: self.view)
                    }
                    
                    
                    
                    
                }
                catch let err as NSError {
                    print(err.localizedDescription)
                }
            }
        }
        
        
    }
}
extension UIImage {
    func toBase64() -> String? {
        guard let imageData = self.pngData() else { return nil }
        return imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
    }
}
