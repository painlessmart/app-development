//
//  UITextFieldEasyShop.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/26/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import UIKit
@IBDesignable class UITextFieldEasyShop: UITextField {
    
    @IBInspectable dynamic open var placeHolder: String = "PlaceHolder"
    
    let padding = UIEdgeInsets(top: 0, left: 13, bottom: 0, right: 13)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func draw(_ rect: CGRect) {
        
        update()
        
        
    }
    
    func update() {
        

        
//        self.layer.cornerRadius = self.frame.height / 2
//        self.layer.backgroundColor = Tools.colorWithHexString(hex: "EBEBEB").cgColor
        self.backgroundColor  = .clear
        self.layer.cornerRadius = self.frame.height / 2
//        self.layer.masksToBounds = true
        self.borderWidth1 = 1
        self.borderColor1 = Tools.colorWithHexString(hex: "D5DCE3")
        self.borderStyle = .none
        self.frame.size.height = 38
        self.textColor = Tools.colorWithHexString(hex: "005493")
        self.font = UIFont.boldSystemFont(ofSize: 14)
        self.textAlignment = .left
        let labelPlaceHolder = UILabel()
        labelPlaceHolder.frame = CGRect(x: 13 , y: -(self.frame.height - 10) , width: self.frame.width , height: self.frame.height)
        labelPlaceHolder.textAlignment = .left
        labelPlaceHolder.textColor = Tools.colorWithHexString(hex: "005493")
        labelPlaceHolder.font = UIFont.boldSystemFont(ofSize: 12.0)
        labelPlaceHolder.text = self.placeHolder
        self.addSubview(labelPlaceHolder)
//        labelPlaceHolder.updateConstraints()
//        self.setNeedsLayout()
//        self.layoutIfNeeded()
     
        

        
        
    }
    
   
    
}
    

    



