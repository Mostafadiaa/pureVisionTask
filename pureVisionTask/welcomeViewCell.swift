//
//  welcomeViewCell.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 2/16/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class welcomeViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var textD: UITextView!
    let titelAttribute = [NSAttributedString.Key.font : UIFont(name:"Cairo-Bold", size: 25.0 )!]
    let textlAttribute = [NSAttributedString.Key.font : UIFont(name:"Cairo-Regular", size: 14.0 )!]
    let paragraphStyle = NSMutableParagraphStyle()
    

    var page : pageModel?{
        didSet{
            guard let page = page else{
                return
            }
            imageCell.image = UIImage(named: page.imageName)
            paragraphStyle.alignment = .center
            let attString = NSMutableAttributedString(string: page.titel, attributes: titelAttribute)
            attString.append(NSAttributedString(string:"\n\(page.textData)" , attributes: textlAttribute))
            let lenght = attString.string.count
            attString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: lenght))
            attString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white , range: NSRange(location: 0, length: lenght))
            textD.attributedText = attString
            
        }
    }
    
}
