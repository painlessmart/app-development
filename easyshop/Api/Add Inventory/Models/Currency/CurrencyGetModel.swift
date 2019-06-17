//
//  CurrencyGetModel.swift
//
//  Created by Ali Ghanavati on 3/27/1398 AP
//  Copyright (c) Ali Ghanavati. All rights reserved.
//

import Foundation
import SwiftyJSON


struct CurrencyGetModelCodable: Codable {
    var currency: String?
    var description: String?
    var id: Int?
}
class CurrencyGetModel {
    public func array(objects : [Any]) -> [CurrencyGetModelCodable]? {
        let paramsJSON = JSON(objects)
        let paramsString = paramsJSON.rawString(String.Encoding.utf8, options: JSONSerialization.WritingOptions.prettyPrinted)!
        
        let jsonData = Data(paramsString.utf8)
        let decoder = JSONDecoder()
        
        do {
            let item = try decoder.decode([CurrencyGetModelCodable].self, from: jsonData)
            return item
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
