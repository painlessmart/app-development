//
//  DataServiceTradingSites.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/28/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataServiceTradingSites: ConnectToServer {
    
    // MARK: - Singleton
    static let shared = DataServiceTradingSites()
    
    
    // MARK: Service 
    func tradingSitesGet( completion : @escaping ( (model : [TradingSitesGetModelCodable]?  , error: Error?) )->()) {
        
        do{
            let request = try "".encodeGet("\(Server_Url)\(Trading_Sites_Api_Address)", with: nil)
            super.connect(request: request) { (model , err ) in
                if err != nil{
                    completion((model: nil , error: err))
                }else{
                    completion((model: TradingSitesGetModel().array(objects: model as! [Any]), error: err))
                }
            }
        }catch (let err){
            completion((nil , err))
            return
        }
    }
    
    
}
