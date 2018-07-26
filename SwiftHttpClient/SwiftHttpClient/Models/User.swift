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
}

struct Company:Codable {
    var name:String?
}
struct Address:Codable {
    
    var street:String?
    var suite:String?
    var city:String?
    var zip:String?
    
    enum CodingKeys:String,CodingKey {
        case street,suite,city
        case zip = "zipcode"
    }
    
}


/*
 SAMPLE JSON FOR SINGLE USER
 
 {
 "id": 1,
 "name": "Leanne Graham",
 "username": "Bret",
 "email": "Sincere@april.biz",
 "address": {
 "street": "Kulas Light",
 "suite": "Apt. 556",
 "city": "Gwenborough",
 "zipcode": "92998-3874",
 "geo": {
 "lat": "-37.3159",
 "lng": "81.1496"
 }
 },
 "phone": "1-770-736-8031 x56442",
 "website": "hildegard.org",
 "company": {
 "name": "Romaguera-Crona",
 "catchPhrase": "Multi-layered client-server neural-net",
 "bs": "harness real-time e-markets"
 }
 }
 
 */
