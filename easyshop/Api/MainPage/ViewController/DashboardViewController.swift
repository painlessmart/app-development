//
//  DashboardViewController.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/27/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnLogOut(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
 

}
