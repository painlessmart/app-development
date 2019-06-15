//
//  DataServiceRegister.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/24/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation
import Alamofire

class DataServiceRegister: ConnectToServer {
    
    // MARK: - Singleton
    static let shared = DataServiceRegister()
    
    
    // MARK: Service Register
    func registerPost(registerData : RegisterData , completion : @escaping ( (model : RegisterResponseModel?  , error: Error?) )->()) {
        
        let params = registerData.getParameters()
        do{
            let request = try "".encode("\(Server_Url)\(Register_Api_Address)" , with: params)
            super.connect(request: request) { (model , err ) in
                if err != nil{
                    completion((model: nil , error: err))
                }else{
                    completion((model: RegisterResponseModel(object: model) , error: err))
                }
            }
        }catch (let err){
            completion((nil , err))
            return
        }
    }
    
    
}

