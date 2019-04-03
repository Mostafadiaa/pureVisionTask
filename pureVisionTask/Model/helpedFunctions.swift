//
//  helpedFunctions.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 3/18/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import Foundation
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


}
