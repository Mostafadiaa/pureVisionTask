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
}

extension userIdViewVc: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }
        return 3
    }

    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = userTabelData.dequeueReusableCell(withIdentifier: "cellNumOne")
            cell?.textLabel?.text = "hfhfhfh"
            return cell!
        } else {
            let cell = userTabelData.dequeueReusableCell(withIdentifier: "cellNumTwo")
            cell?.textLabel?.text = "uuuu"
            return cell!
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let title: UILabel = UILabel()
        if section == 0 {
            title.text = "General Info"
        } else if section == 1 {
            title.text = "Contact Info"
        }
        else if section == 2 {
            title.text = "Education"
        } else if section == 3 {
            title.text = "Work Experience"
        } else if section == 4 {
            title.text = "Languages"
        } else if section == 5 {
            title.text = "Skills"
        }else if section == 6 {
            title.text = "Trainings & Courses"
        }
        
        title.textColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.0)
        title.backgroundColor = UIColor(red: 0.01, green: 0.82, blue: 0.66, alpha: 1.0)
        title.font = UIFont.boldSystemFont(ofSize: 15)
        title.textAlignment = NSTextAlignment.center

        return title
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return  229
        }
        
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
