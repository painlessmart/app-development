//
//  Localize.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/15/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation


extension String {
    func localize() -> String {
        var result = Bundle.main.localizedString(forKey: self , value: nil, table: nil)
        
        if result == self {
            result = Bundle.main.localizedString(forKey: self, value: nil, table: "EnglishString")
        }
        
        return result
    }
}
