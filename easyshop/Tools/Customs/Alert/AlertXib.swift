//
//  AlertXib.swift
//  Test Tejarat
//
//  Created by Macintosh on 9/5/1396 AP.
//  Copyright © 1396 ali. All rights reserved.
//

import UIKit

class AlertXib: UIView {
    

    @IBOutlet weak var txtTitle: UILabel!
   
    @IBOutlet weak var txtMessage: UILabel!
    @IBOutlet weak var btnOk: UIButton!
    @IBOutlet weak var btnCancel: UIButton!

    @IBOutlet var viewBack: UIView!
    @IBOutlet weak var btnExit: UIButton!

    override func draw(_ rect: CGRect) {
        Tools.animateView(view: viewBack)
    }
    
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "AlertXib", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

}



