//
//  DataServiceAddListingItem.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/30/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataServiceAddListingItem: ConnectToServer {
    
    // MARK: - Singleton
    static let shared = DataServiceAddListingItem()
    
    
    // MARK: Service
    func add( request : ListingAddItemRequest , completion : @escaping ( (model : ListingAddItemModel?  , error: Error?) )->()) {
        let params = request.getParameters()
        do{
            let request = try "".encode("\(Server_Url)\(Inventory_Items_Api_Address)" , with: params)
            super.connect(request: request) { (model , err ) in
                if err != nil{
                    completion((model: nil , error: err))
                }else{
                    completion((model: ListingAddItemModel(object: model) , error: err))
                }
            }
        }catch (let err){
            completion((nil , err))
            return
        }
    }
    
    
}
