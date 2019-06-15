//
//  Tools.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/21/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import UIKit
class Tools {
    static func animateView(view : UIView , duration : TimeInterval? = 0.3 , origin : CGFloat? = 50  ) {
        view.alpha = 0;
        view.frame.origin.y = view.frame.origin.y - origin!
        UIView.animate(withDuration: duration! , animations: { () -> Void in
            view.alpha = 1.0;
            view.frame.origin.y = view.frame.origin.y + origin!
        })
    }
}
