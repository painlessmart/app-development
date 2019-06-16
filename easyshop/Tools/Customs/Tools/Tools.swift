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
    
    static func colorWithHexString (hex:String) -> UIColor {
        var cString = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substring(from: 1)
        }
        
        if (cString.count != 6) {
            return UIColor.gray
        }
        
        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
}
