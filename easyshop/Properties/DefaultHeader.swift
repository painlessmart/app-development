//
//  DefaultHeader.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/27/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation
class DefaultHeader {
    static func Header() -> [String : String] {
        let header = ["Authorization": MyProperties.sharedInstance.getToken()  ]
        print("************ \(header)")
        return header
    }
}
