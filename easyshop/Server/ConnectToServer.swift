//
//  ConnectToServer.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/22/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation
import Alamofire


class ConnectToServer  {
    
    // MARK: Connect to Services
    func connect( request : URLRequest , completion : @escaping ( Any? , Error? )->() ) {
        
        AFManager.request(request).responseJSON{ response in
            print(response)
            switch (response.result) {
            case .success(let value ):
                print("\(response.response?.statusCode) + \(value)")
                switch response.response?.statusCode {
                case 200:
                    completion(value , nil)
                case 406:
                    completion(value , nil)
                case 403:
                    completion(value , nil)
                case 401:
                    completion(value , errorWithMessage(EasyShopErrorModel(object: value)) )
                default:
                    completion(value , nil)
                }
                
                return
            case .failure(let error):
                print(response.error?.localizedDescription ?? "")
                if response.response?.statusCode != nil {
                    _ = self.checkResponseStatus((response.response?.statusCode)!)
                    completion(nil , error)
                    return
                }
            }
            
        }
        
        
    }
    

    
    fileprivate func checkResponseStatus(_ statusCode: Int) -> erorrStatus {
        switch statusCode {
        case 200:
            return .ok
        case 406:
            return .nokWithMessage
        case 403:
            return .nok
        case 401:
            return .nok
        default:
            return .nok
        }
    }
    
    
    
}
