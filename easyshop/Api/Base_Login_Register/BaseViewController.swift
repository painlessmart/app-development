//
//  BaseViewController.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/23/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    @IBOutlet weak var pagerView: PagerViewCustom!
    @IBOutlet weak var segmentView: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        pagerView.dataSource = self
    }
    

    @IBAction func segmentView(_ sender: UISegmentedControl) {
        pagerView.selectItemAtIndex(index: sender.selectedSegmentIndex)
    }
    
}




extension BaseViewController : PagerViewCustomDataSource{
    fileprivate func getViewController(withIdentifier identifier: String) -> UIViewController
    {
        return UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    func setViewsPagerViewCustom(pagerView: PagerViewCustom) -> [UIViewController] {
        let register = UIStoryboard(name: "Register", bundle: nil).instantiateViewController(withIdentifier: "RegisterView") as! RegisterViewController
        register.delegateChangeSegment = self
        return [self.getViewController(withIdentifier: "LoginView") , register ]
    }
    
    func didChangePage(index: Int) {
        segmentView.selectedSegmentIndex = index
    }
    
}


extension BaseViewController : ChangeSegmentIndexProtocol {
    func changeSegmentIndex(_ index: Int) {
        segmentView.selectedSegmentIndex = index
        segmentView(segmentView)
    }
    
    
}
