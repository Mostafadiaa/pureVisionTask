//
//  helpedFunctions.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 3/18/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import Foundation
import UIKit
class helpedFunctions:NSObject {
    class var sharedInstance: helpedFunctions {
        struct Singleton {
            static let instance: helpedFunctions = helpedFunctions()
        }
        return Singleton.instance
    }
    override init() {
        super.init()
    }
    var container: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    func getData(url: String, dataCompletionHandler: @escaping (Data?) -> Void) {
        guard let dataUrl = URL(string: url) else {
            return
        }
        var urlRequest = URLRequest(url: dataUrl)
        urlRequest.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, _, _ in
            if  let data = data {
                dataCompletionHandler(data)
            }
            else{
                dataCompletionHandler(nil)
            }
            
            
        })
        
        task.resume()
    }
    
    func postData<postObject: Encodable,responsObject:Decodable>(postData: postObject,responseData:responsObject.Type,url: String, CompletionHandler: @escaping (Bool?) -> Void) {
         let encoder = JSONEncoder()
        guard let urlToPost = URL(string: url) else {return}
             var urlRequest = URLRequest(url: urlToPost)
            urlRequest.httpMethod = "POST"
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
            do {
                let json = try encoder.encode(postData)
                urlRequest.httpBody = json
              
            }
            catch let error as NSError{
               print(error)
                return
            }
        
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) { (data, res, err) in
            
            guard let data = data else {
                return
            }
            do {
                CompletionHandler(true)
                let responseJson = try JSONDecoder().decode(responseData, from: data)
                print(responseJson)
            }
            catch let errpe as NSError{
                print(errpe)
            }
        }
        task.resume()
        
        }
    func postDataWithOutRes<postObject: Encodable>(postData: postObject,url: String, CompletionHandler: @escaping (Data?) -> Void) {
        let encoder = JSONEncoder()
        guard let urlToPost = URL(string: url) else {return}
        var urlRequest = URLRequest(url: urlToPost)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        do {
            let json = try encoder.encode(postData)
            urlRequest.httpBody = json
            
        }
        catch let error as NSError{
            print(error)
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) { (data, res, err) in
            
            guard let data = data else {
                return
            }
        
            CompletionHandler(data)
            
            
        }
        task.resume()
        
    }
    func showActivityIndicator(uiView: UIView) {
        container.frame = uiView.frame
        container.center = uiView.center
        container.backgroundColor = UIColorFromHex(rgbValue: 0xffffff, alpha: 0.3)
        
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = uiView.center
        loadingView.backgroundColor = #colorLiteral(red: 0, green: 0.7437998652, blue: 0.6289772391, alpha: 1)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 40
        
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0);
        activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2);
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        uiView.addSubview(container)
        activityIndicator.startAnimating()
    }
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    func hideActivityIndicator(uiView: UIView) {
        activityIndicator.stopAnimating()
        container.removeFromSuperview()
    }


}
