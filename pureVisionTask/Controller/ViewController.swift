//
//  ViewController.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 2/16/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var cv: UICollectionView!
    @IBOutlet weak var conButt: UIButton!
    
    var pages : [pageModel]?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Locale.current.languageCode == "en"{
           // LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }
        else if Locale.current.languageCode == "ar"{
            //LocalizationSystem.sharedInstance.setLanguage(languageCode: "ar")
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        }
         pages = {
            let firstPage = pageModel(imageName:"Purevisionlogo0", titel: LocalizationSystem.sharedInstance.localizedStringForKey(key: "Purevision", comment: ""), textData:LocalizationSystem.sharedInstance.localizedStringForKey(key: "Purevisionlogo", comment: ""))
            let secondPage = pageModel(imageName:"whoRwe", titel: LocalizationSystem.sharedInstance.localizedStringForKey(key: "whoRweTitel", comment: "") , textData:  LocalizationSystem.sharedInstance.localizedStringForKey(key: "whoRwe", comment: ""))
            
            let thirdPage = pageModel(imageName:"Mob", titel:LocalizationSystem.sharedInstance.localizedStringForKey(key: "mobTitel", comment: "") , textData:  LocalizationSystem.sharedInstance.localizedStringForKey(key: "mobText", comment: ""))
            
            let forthPage = pageModel(imageName:"web", titel: LocalizationSystem.sharedInstance.localizedStringForKey(key: "webTitel", comment: ""), textData:  LocalizationSystem.sharedInstance.localizedStringForKey(key: "webText", comment: ""))
            
            let fifthPage = pageModel(imageName:"iot", titel: LocalizationSystem.sharedInstance.localizedStringForKey(key: "iotTitel", comment: ""), textData:  LocalizationSystem.sharedInstance.localizedStringForKey(key: "iotText", comment: ""))
            
            let sixPage = pageModel(imageName:"cloud", titel: LocalizationSystem.sharedInstance.localizedStringForKey(key: "cloudTitel", comment: ""), textData:  LocalizationSystem.sharedInstance.localizedStringForKey(key: "cloudText", comment: ""))
            return [firstPage,secondPage,thirdPage,forthPage,fifthPage,sixPage]
        }()
        pageController.numberOfPages = pages!.count
        conButt.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "continueKey", comment: ""), for: .normal)
    }
    
    @IBAction func conAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        let loginV = self.storyboard?.instantiateViewController(withIdentifier: "loginVc") as! loginVc
        present(loginV,animated: true)
        
        
        
    }
    
   
    
    
}
extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cv.dequeueReusableCell(withReuseIdentifier: "welcomeCell", for: indexPath) as! welcomeViewCell
        let page = pages![indexPath.item]
        cell.page = page
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        pageController.currentPage = pageNumber
        if LocalizationSystem.sharedInstance.getLanguage() == "ar"{
            
            pageController.transform = CGAffineTransform(scaleX: -1, y: 1) // to make pageController go from right to left
            if pageNumber == 0 {
                UIView.animate(withDuration: 0.5) {
                    self.conButt.alpha = 1.0
                }
                
            }
            else{
                UIView.animate(withDuration: 0.5) {
                    self.conButt.alpha = 0.0
                }
                
            }
            
        }
        else{
            if pageNumber == pages!.count - 1  {
                UIView.animate(withDuration: 0.5) {
                    self.conButt.alpha = 1.0
                }
            }
            else{
                UIView.animate(withDuration: 0.5) {
                    self.conButt.alpha = 0.0
                }
                
            }
        }
        


    }
  
    
    
}

