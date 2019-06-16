//
//  Extension+UIView.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/26/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
//    @IBInspectable
//    var backImage : UIImage{
//        get{
//            return UIImage()
//        }
//        set{
//            self.backgroundColor = Tools.colorWithHexString(hex: "#034EA2")
//            let backgroundImageView = UIImageView(image: newValue)
//            backgroundImageView.frame = self.frame
//            backgroundImageView.contentMode = .scaleAspectFit
//            self.addSubview(backgroundImageView)
//            self.sendSubview(toBack: backgroundImageView)
//        }
//    }
    
    @IBInspectable
    var cornerRadius1: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth1: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor1: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius1: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity1: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset1: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor1: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
    
}
