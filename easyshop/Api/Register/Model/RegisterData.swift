//
//  RegisterData.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/24/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation
struct RegisterData {
    var firstName : String
    var lastName : String
    var eMail : String
    var phone : String
    var password : String
    var brandName : String
    var businessName : String
    
    func getParameters() -> [String : Any] {
        var params = [String : Any]()
        params["password"] = password
        params["fn"] = firstName
        params["ln"] = lastName
        params["brand_name"] = brandName
        params["work_email"] = eMail
        params["business_name"] = businessName
        params["phone"] = phone
        return params
    }
}
