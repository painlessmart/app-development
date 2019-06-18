//
//  DataServiceItemDelete.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/28/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Alamofire
import SwiftyJSON

class DataServiceItemDelete: ConnectToServer {
    
    // MARK: - Singleton
    static let shared = DataServiceItemDelete()
    
    
    // MARK: Service
    func delete( id : Int ,completion : @escaping ( (model : String?  , error: Error?) )->()) {
        
        do{
            var request = URLRequest(url: URL(string:"\(Server_Url)\(Inventory_Items_Api_Address)\(id)" )!)
            request.httpMethod = HTTPMethod.delete.rawValue
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.timeoutInterval = TimeOut_WebService
            request.allHTTPHeaderFields = DefaultHeader.Header()
            
            super.connect(request: request) { (model , err ) in
                if err != nil{
                    completion((model: nil , error: err))
                }else{
                    completion((model: "" , error: nil))
                }
            }
        }catch (let err){
            completion((nil , err))
            return
        }
    }
    
    
}
