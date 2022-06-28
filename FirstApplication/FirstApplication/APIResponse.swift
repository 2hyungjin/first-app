//
//  APIResponse.swift
//  FirstApplication
//
//  Created by 이형진 on 2022/06/28.
//

import Foundation
struct APIResponse:Codable{
    let results:[Friend]
}

struct Friend:Codable{
    struct Name:Codable{
        let title:String
        let first:String
        let last:String
    }

    struct Picture:Codable{
        let large:String
        let medium:String
        let thumbnail:String
    }
    
    let name : Name
    let email : String
    let picture : Picture
}

