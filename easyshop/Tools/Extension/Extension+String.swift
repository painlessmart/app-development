//
//  Extension_String.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/23/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation
import Alamofire

extension String  {
    
    public func encode(_ urlRequest: String , with parameters: [String : Any ]) throws -> URLRequest {
        let paramsString = (("\(parameters)" as NSString).replacingOccurrences(of: "[", with: "{")).replacingOccurrences(of: "]", with: "}")
        
        var request = URLRequest(url: URL(string: urlRequest)!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = TimeOut_WebService
        request.allHTTPHeaderFields = DefaultHeader.Header()
        let data = (paramsString.data(using: .utf8))! as Data
        
        request.httpBody = data
        return request
    }
    
    
    public func encodeWithoutToken(_ urlRequest: String , with parameters: [String : Any ]) throws -> URLRequest {
        let paramsString = (("\(parameters)" as NSString).replacingOccurrences(of: "[", with: "{")).replacingOccurrences(of: "]", with: "}")
        
        var request = URLRequest(url: URL(string: urlRequest)!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = TimeOut_WebService        
        let data = (paramsString.data(using: .utf8))! as Data
        
        request.httpBody = data
        return request
    }
    
    
    public func encodeGet(_ urlRequest: String , with parameters: [String : Any ]?) throws -> URLRequest {
        let paramsString = (("\(String(describing: parameters))" as NSString).replacingOccurrences(of: "[", with: "{")).replacingOccurrences(of: "]", with: "}")
        
        var request = URLRequest(url: URL(string: urlRequest)!)
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = TimeOut_WebService
        request.allHTTPHeaderFields = DefaultHeader.Header()
        let data = (paramsString.data(using: .utf8))! as Data
        
        request.httpBody = data
        return request
    }
}
