//
//  DataServiceCurrency.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/28/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataServiceCurrency: ConnectToServer {
    
    // MARK: - Singleton
    static let shared = DataServiceCurrency()
    
    
    // MARK: Service 
    func currencyGet( completion : @escaping ( (model : [CurrencyGetModelCodable]?  , error: Error?) )->()) {
        
        do{
            let request = try "".encodeGet("\(Server_Url)\(Currency_Api_Address)", with: nil)
            super.connect(request: request) { (model , err ) in
                if err != nil{
                    completion((model: nil , error: err))
                }else{
                    completion((model: CurrencyGetModel().array(objects: model as! [Any]), error: err))
                }
            }
        }catch (let err){
            completion((nil , err))
            return
        }
    }
    
    
}
