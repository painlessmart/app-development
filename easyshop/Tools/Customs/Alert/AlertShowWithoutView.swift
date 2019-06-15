//
//  AlertShowWithoutView.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/21/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation
import UIKit


class AlertShowWithoutView : NSObject {
    
    
    var XibFile : AlertXib?
    let window = UIApplication.shared.keyWindow!
    let v = UIView(frame: (UIApplication.shared.keyWindow?.bounds)!)
    func showAlert(title : String , message : String   , buttonOk : (() -> ())? = nil  , buttonCancel : Bool = false  , buttonOkName : String? = "Ok" , buttonCancelName : String? = "لغو" , image : UIImage? = nil , buttonColorOk : UIColor? = nil , buttonCancelColor : UIColor? = nil , buttonCancelSelector : (() -> ())? = nil){
        //        guard let controller = UIApplication.topViewController() else{
        //            Toast.show(message: message)
        //            return
        //        }
        AlertShowWithoutView.sharedInstance.dismissAlert()
        self.XibFile?.setNeedsLayout()
        self.XibFile?.layoutIfNeeded()
        
        self.XibFile = AlertXib.fromNib()
        
        self.XibFile?.frame = CGRect(x: 0 , y: 0 , width: UIScreen.main.bounds.size.width , height: UIScreen.main.bounds.size.height)
        
        if buttonColorOk != nil {
            self.XibFile?.btnOk.backgroundColor = buttonColorOk
        }
        if buttonCancelColor != nil {
            self.XibFile?.btnCancel.backgroundColor = buttonCancelColor
        }
        
        self.XibFile?.btnExit.addTarget(self , action: #selector(self.dismissAlert(_:)) , for: UIControl.Event.touchUpInside)
        
        
        self.XibFile?.txtTitle.text = title
        self.XibFile?.txtMessage.text = message
        self.XibFile?.btnOk.setTitle(buttonOkName, for: UIControl.State.normal)
        
        self.XibFile?.btnCancel.setTitle(buttonCancelName, for: UIControl.State.normal)
        if (buttonOk != nil && buttonCancel == false) {
            self.XibFile?.btnOk.isHidden = false
            self.XibFile?.btnCancel.isHidden = true
          if buttonOkName != "Ok"{
                self.XibFile?.btnOk.setTitle(buttonOkName, for: .normal)
            }else{
                self.XibFile?.btnOk.setTitle("Ok", for: .normal)
            }
            self.XibFile?.btnOk.add(for: .touchUpInside , buttonOk!)
        }else if (buttonCancel != nil && buttonOk == nil) {
            self.XibFile?.btnOk.isHidden = false
            self.XibFile?.btnCancel.isHidden = true
            self.XibFile?.btnOk.setTitle("Cancel", for: .normal)
            self.XibFile?.btnOk.addTarget(self , action: #selector(self.dismissAlert(_:)) , for: UIControl.Event.touchUpInside)
        }else{
            self.XibFile?.btnOk.add(for: .touchUpInside , buttonOk!)
            if buttonCancelSelector == nil{
                self.XibFile?.btnCancel.addTarget(self , action: #selector(self.dismissAlert(_:)) , for: UIControl.Event.touchUpInside)
            }else{
                self.XibFile?.btnCancel.add(for: .touchUpInside , buttonCancelSelector!)
            }
            
            
        }
        
        
        window.addSubview(v)

        self.XibFile?.frame = UIScreen.main.bounds
        self.XibFile?.center = v.center
        v.addSubview(self.XibFile!)
        

        
        
    }
    
    
    
    @objc func dismissAlert(_ sender : UIButton) {
        self.XibFile?.removeFromSuperview()
        window.removeFromSuperview()
        v.removeFromSuperview()
        print("close")
    }
    
    
    func dismissAlert() {
        window.removeFromSuperview()
        v.removeFromSuperview()
    }
    
    
    
    static let sharedInstance: AlertShowWithoutView = {
        let instance = AlertShowWithoutView()
        
        return instance
    }()
    
    
    override init() {
        super.init()
        
    }
    
}


