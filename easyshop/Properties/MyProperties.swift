//
//  MyProperties.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/26/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation
class MyProperties: NSObject {
    
    private var token : String = ""
    private var refreshToken : String = ""
    private var userId : Int = 0
    
    func setUserId(userId : Int)  {
        self.userId = userId
    }
    
    func getUserId() -> Int {
        return self.userId
    }
    
    func setToken(token : String)  {
        self.token = "Bearer " + token
    }
    
    func getToken() -> String {
        if self.token == "Bearer "{
            self.token = ""
        }
        return self.token
    }
    func setRefreshToken(refreshToken : String)  {
        self.refreshToken = "Bearer " + refreshToken
    }
    
    func getRefreshToken() -> String {
        if self.refreshToken == "Bearer "{
            self.refreshToken = ""
        }
        return self.refreshToken
    }
    
    private override init() { }
    static let sharedInstance = MyProperties()
}
