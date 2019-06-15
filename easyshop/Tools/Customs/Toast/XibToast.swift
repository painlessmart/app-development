//
//  XibToast.swift
//  Tejarat Mobile Bank
//
//  Created by Macintosh on 10/2/1396 AP.
//  Copyright © 1396 ali. All rights reserved.
//

import UIKit

class XibToast: UIView {

    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtMessage: UILabel!
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "XibToast", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

}
