//
//  EasyShopError.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/23/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation

//class EasyShopError: Error {
//    <#code#>
//}


enum erorrStatus : Error {
    case ok
    case nokWithMessage
    case nok
    case nokExpire
    case errorWithMessage(String)
}


struct errorWithMessage : Error {
    let messageModel : EasyShopErrorModel
    init(_ messageModel : EasyShopErrorModel) {
        self.messageModel = messageModel
    }
    
    public var localizedDescription: String {
        return messageModel.message ?? "Error".localize()
    }
}
