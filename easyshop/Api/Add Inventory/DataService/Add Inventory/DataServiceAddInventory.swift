//
//  DataServiceAddInventory.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/28/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataServiceAddInventory: ConnectToServer {
    
    // MARK: - Singleton
    static let shared = DataServiceAddInventory()
    
    
    // MARK: Service
    func add(  , completion : @escaping ( (model : AddInventoryModel?  , error: Error?) )->()) {
        
        do{
            let request = try "".encodeGet("\(Server_Url)\(Categories_Api_Address)", with: nil)
            super.connect(request: request) { (model , err ) in
                if err != nil{
                    completion((model: nil , error: err))
                }else{
                    completion((model: AddInventoryModel(object: model) , error: err))
                }
            }
        }catch (let err){
            completion((nil , err))
            return
        }
    }
    
    
}