//
//  pageModel.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 2/16/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import Foundation
struct pageModel {
    let imageName: String
    let titel    : String
    let textData : String
}
struct religionData:Codable {
    let data: [relData]
}

struct relData:Codable {
    let religion_id, religion_name, arabic_name: String
}

struct UserElement {
    let countryID, nicename: String
}
