//
//  DataServiceInventory.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/27/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataServiceInventory: ConnectToServer {
    
    // MARK: - Singleton
    static let shared = DataServiceInventory()
    
    
    // MARK: Service inventory Items Get
    func inventoryItemsGet( completion : @escaping ( (model : [InventoryItemsGetModelCodeble]?  , error: Error?) )->()) {
        
        do{
            let request = try "".encodeGet("\(Server_Url)\(Inventory_Items_Api_Address)", with: nil)
            super.connect(request: request) { (model , err ) in
                if err != nil{
                    completion((model: nil , error: err))
                }else{
                    completion((model: InventoryItemModels().array(objects: model as! [Any]), error: err))
                }
            }
        }catch (let err){
            completion((nil , err))
            return
        }
    }
    
    
}
