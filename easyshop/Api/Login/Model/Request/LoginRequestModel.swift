//
//  LoginRequestModel.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/23/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation

struct LoginRequestModel {
    var work_email : String?
    var password : String?
    
    func getParameters() -> [String : Any] {
        var params = [String : Any]()
        params["work_email"] = work_email
        params["password"] = password
        return params
    }
}
