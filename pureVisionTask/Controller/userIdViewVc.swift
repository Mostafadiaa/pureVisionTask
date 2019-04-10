//
//  userIdViewVc.swift
//  pureVisionTask
//
//  Created by Pure Vision on 4/7/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class userIdViewVc: UIViewController {
    @IBOutlet var userTabelData: UITableView!
    
    
    
    var allUserDataListSegue: [allUserData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    class func convertBase64ToImage(imageString: String) -> UIImage {
        let imageData = Data(base64Encoded: imageString, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
        return UIImage(data: imageData)!
    }
}

extension userIdViewVc: UITableViewDelegate, UITableViewDataSource ,UICollectionViewDelegate,UICollectionViewDataSource{
    
 
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
       else  if section == 1 {
            return 1
        }
        else  if section == 2 {
            return 1
        }
        else if section == 3 {
            return allUserDataListSegue[0].experiences.count
        }
        else  if section == 4 {
            return allUserDataListSegue[0].language_listRow.count
        }
        else if section == 5 {
            return allUserDataListSegue[0].skills.count
        }
        else if section == 6 {
            return allUserDataListSegue[0].courses.count
            
        }
        else if section == 7 {
            return 1
        }

        return 0
    }

    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = userTabelData.dequeueReusableCell(withIdentifier: "cellNumOne") as! generalInfoCell
            
            cell.birthDate.text = allUserDataListSegue[0].birthday
            cell.countryData.text = "\(allUserDataListSegue[0].city_name),\(allUserDataListSegue[0].nicename)"
            cell.exData.text = allUserDataListSegue[0].career_name
            cell.expSalaryData.text = allUserDataListSegue[0].salary
            cell.genderData.text = allUserDataListSegue[0].gender
            cell.relegionData.text = allUserDataListSegue[0].religion_name
            cell.natData.text = allUserDataListSegue[0].nationality_enNationality
            cell.milData.text = allUserDataListSegue[0].martial_status
            cell.nameData.text = allUserDataListSegue[0].fullname
            cell.titelData.text = allUserDataListSegue[0].position_name
            cell.selectionStyle = .none
            cell.isUserInteractionEnabled = false
            return cell
        } else if indexPath.section == 1 {
            let cell = userTabelData.dequeueReusableCell(withIdentifier: "cellNumTwo") as! contactInfoCell
            cell.mailLAn.text = allUserDataListSegue[0].email
            cell.mobLa.text = allUserDataListSegue[0].mobile
            cell.selectionStyle = .none
            cell.isUserInteractionEnabled = false
            
            return cell
        }
        else if indexPath.section == 2 {
            let cell = userTabelData.dequeueReusableCell(withIdentifier: "cellOfedu") as! eduCell
            cell.highScLabel.text = allUserDataListSegue[0].college_name
            cell.universtyLabel.text = allUserDataListSegue[0].university_name
            cell.gradYearScholLabel.text = allUserDataListSegue[0].graduationyear
            cell.uniVerstyLabelOfGrad.text = allUserDataListSegue[0].endyear
            cell.studyField.text = allUserDataListSegue[0].fields_study
            cell.degreeLabel.text = allUserDataListSegue[0].degree_name
            cell.gradeUNI.text = allUserDataListSegue[0].grade_name
            cell.selectionStyle = .none
            cell.isUserInteractionEnabled = false
            
            return cell
        }
        else if indexPath.section == 3{
            let cell = userTabelData.dequeueReusableCell(withIdentifier: "expCell") as! exoerCell
            cell.jobAtComp.text = "\(allUserDataListSegue[0].experiences[indexPath.row].job_title) To \(allUserDataListSegue[0].experiences[indexPath.row].company_name)"
            cell.dateStartToEnd.text = "\(allUserDataListSegue[0].experiences[indexPath.row].date_start) To \(allUserDataListSegue[0].experiences[indexPath.row].date_end)"
            cell.workedTime.text = allUserDataListSegue[0].experiences[indexPath.row].Worked_Time
            cell.selectionStyle = .none
            cell.isUserInteractionEnabled = false
            
            return cell
            
        }
        else if indexPath.section == 4{
            let cell = userTabelData.dequeueReusableCell(withIdentifier: "langCell") as! langCell
            cell.langLabel.text = "\(allUserDataListSegue[0].language_listRow[indexPath.row].language_name) - \(allUserDataListSegue[0].language_listRow[indexPath.row].level_lang_name)"
            cell.isUserInteractionEnabled = false
            cell.selectionStyle = .none
            return cell
            
        }
        else if indexPath.section == 5{
            let cell = userTabelData.dequeueReusableCell(withIdentifier: "skillCell") as! skillCell
            cell.skillLabel.text = allUserDataListSegue[0].skills[indexPath.row].skill_name
            cell.isUserInteractionEnabled = false
            cell.selectionStyle = .none
            return cell
            
        }
        else if indexPath.section == 6{
            let cell = userTabelData.dequeueReusableCell(withIdentifier: "courseCell") as! courseCell
            cell.nameAtOrga.text = "\(allUserDataListSegue[0].courses[indexPath.row].course_name) At \(allUserDataListSegue[0].courses[indexPath.row].organization_name)"
            cell.fromTo.text = "\(allUserDataListSegue[0].courses[indexPath.row].start_date) To \(allUserDataListSegue[0].courses[indexPath.row].end_date)"
            cell.isUserInteractionEnabled = false
            cell.selectionStyle = .none
            return cell
            
        }
        else if indexPath.section == 7{
            let cell = userTabelData.dequeueReusableCell(withIdentifier: "cirtCell") as! cirtCell
           // cell.isUserInteractionEnabled = false
            
            cell.cirtCollectionView.reloadData()
            cell.selectionStyle = .none
            return cell
            
        }
        else{
            let cell = userTabelData.dequeueReusableCell(withIdentifier: "skillCell") as! skillCell
            cell.isUserInteractionEnabled = false
            cell.selectionStyle = .none
            return cell
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let title: UILabel = UILabel()
        if section == 0 {
            title.text = ""
        } else if section == 1 {
            title.text = "Contact Info"
            title.textColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.0)
            title.backgroundColor = UIColor(red: 0.01, green: 0.82, blue: 0.66, alpha: 1.0)
            title.font = UIFont.boldSystemFont(ofSize: 15)
            title.textAlignment = NSTextAlignment.center
        }
        else if section == 2 {
            title.text = "Education"
            title.textColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.0)
            title.backgroundColor = UIColor(red: 0.01, green: 0.82, blue: 0.66, alpha: 1.0)
            title.font = UIFont.boldSystemFont(ofSize: 15)
            title.textAlignment = NSTextAlignment.center
        } else if section == 3 {
            title.text = "Work Experience"
            title.textColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.0)
            title.backgroundColor = UIColor(red: 0.01, green: 0.82, blue: 0.66, alpha: 1.0)
            title.font = UIFont.boldSystemFont(ofSize: 15)
            title.textAlignment = NSTextAlignment.center
        } else if section == 4 {
            title.text = "Languages"
            title.textColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.0)
            title.backgroundColor = UIColor(red: 0.01, green: 0.82, blue: 0.66, alpha: 1.0)
            title.font = UIFont.boldSystemFont(ofSize: 15)
            title.textAlignment = NSTextAlignment.center
        } else if section == 5 {
            title.text = "Skills"
            title.textColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.0)
            title.backgroundColor = UIColor(red: 0.01, green: 0.82, blue: 0.66, alpha: 1.0)
            title.font = UIFont.boldSystemFont(ofSize: 15)
            title.textAlignment = NSTextAlignment.center
        }else if section == 6 {
            title.text = "Trainings & Courses"
            title.textColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.0)
            title.backgroundColor = UIColor(red: 0.01, green: 0.82, blue: 0.66, alpha: 1.0)
            title.font = UIFont.boldSystemFont(ofSize: 15)
            title.textAlignment = NSTextAlignment.center
        }
        else if section == 7 {
            title.text = "Certificates"
            title.textColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.0)
            title.backgroundColor = UIColor(red: 0.01, green: 0.82, blue: 0.66, alpha: 1.0)
            title.font = UIFont.boldSystemFont(ofSize: 15)
            title.textAlignment = NSTextAlignment.center
        }
        
        

        return title
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return  425
        }
        else if indexPath.section == 1{
            return  71
        }
        else if indexPath.section == 2{
            return  200
        }
        else if indexPath.section == 3{
            return  100
        }
        else if indexPath.section == 6{
            return  65
        }
        else if indexPath.section == 7{
            return  200
        }
        
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 7
        {
            return 200
        }
        return UITableView.automaticDimension
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allUserDataListSegue[0].certification.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "certCollecCell", for: indexPath) as! certCollecCell
        //cell.cirtCellImage.image = userIdViewVc.convertBase64ToImage(imageString: allUserDataListSegue[0].certification[indexPath.item].certification_url)
        //cell.cirtCellImage.image = userIdViewVc.convertBase64ToImage(imageString: allUserDataListSegue[0].certification[indexPath.row].certification_url)
        
        return cell
    }
}
