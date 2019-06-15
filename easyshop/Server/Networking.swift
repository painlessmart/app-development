//
//  Networking.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/22/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation
import Alamofire

class Networking {
    static let manager: Alamofire.SessionManager = {
        
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            
            "139.162.39.19": .disableEvaluation
//            ,
//
//            "": .pinCertificates (
//                certificates: ServerTrustPolicy.certificates() ,
//                validateCertificateChain: true,
//                validateHost: true
//            )
//            ,
//            "10.40.194.13": .pinCertificates (
//                certificates: ServerTrustPolicy.certificates() ,
//                validateCertificateChain: true,
//                validateHost: true
//            )
        ]
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = TimeOut_WebService // seconds
        configuration.timeoutIntervalForResource = TimeOut_WebService //seconds
        
        
        return Alamofire.SessionManager(
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies))
        
    }()
}
