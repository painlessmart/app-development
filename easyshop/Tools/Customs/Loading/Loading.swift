//
//  Loading.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/23/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

class Loading {
    
    
    
    static func Start(){

        let activityData = ActivityData( message: "Please_Wait".localize() , type: NVActivityIndicatorType.orbit , color: UIColor.white  , textColor: UIColor.white)
        UIAccessibility.post(notification: UIAccessibility.Notification.screenChanged,  argument: "Please_Wait".localize())
        
        
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData) { (_) in
            
        }
        
    }
    static func Stop(){
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
    }
}
