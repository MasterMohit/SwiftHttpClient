//
//  User.swift
//  SwiftHttpClient
//
//  Created by Mohit Kumar on 7/26/18.
//  Copyright © 2018 Mohit Kumar. All rights reserved.
//

import Foundation

struct User:Codable {
    
    var id:Int?
    var name:String?
    var username:String?
    var email:String?
    var address:Address?
    var phone:String?
    var website:String?
    var company:Company?
    
    enum Keys:String,CodingKey {
        case id,name,username,email,address,phone,website,company
    }
}

struct Company:Codable {
    var name:String?
    enum keys:String,CodingKey {
        case name
    }
}
struct Address:Codable {
    
    var street:String?
    var suite:String?
    var city:String?
    var zip:String?
    
    enum Keys:String,CodingKey {
        case street,suite,city
        case zip = "zipcode"
    }
    
}
