//
//  DataServiceLogin.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/23/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation
import Alamofire

class DataServiceLogin: ConnectToServer {
    
    // MARK: - Singleton
    static let shared = DataServiceLogin()
    

    // MARK: Service Login
    func loginPost(work_email : String , password : String  , completion : @escaping ( (model : LoginResponseModel?  , error: Error?) )->()) {
        
        let params = LoginRequestModel.init(work_email: work_email , password: password).getParameters()
        do{
            let request = try "".encode("\(Server_Url)\(Login_Api_Address)" , with: params)
            super.connect(request: request) { (model , err ) in
                if err != nil{
                    completion((model: nil , error: err))
                }else{
                    completion((model: LoginResponseModel(object: model) , error: err))
                }
            }
        }catch (let err){
            completion((nil , err))
            return
        }
    }
    
    
}

