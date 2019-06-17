//
//  DataServiceCategories.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/28/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataServiceCategories: ConnectToServer {
    
    // MARK: - Singleton
    static let shared = DataServiceCategories()
    
    
    // MARK: Service
    func categoriesGet( completion : @escaping ( (model : CategoriesGetModel?  , error: Error?) )->()) {
        
        do{
            let request = try "".encodeGet("\(Server_Url)\(Categories_Api_Address)", with: nil)
            super.connect(request: request) { (model , err ) in
                if err != nil{
                    completion((model: nil , error: err))
                }else{
                    completion((model: CategoriesGetModel(object: model) , error: err))
                }
            }
        }catch (let err){
            completion((nil , err))
            return
        }
    }
    
    
}
