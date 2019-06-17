//
//  InventoryViewController.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/27/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import UIKit
import Alamofire

class InventoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var model : [InventoryItemsGetModelCodeble]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getInventoryItems()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    @IBAction func btnLogOut(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Networking In View Model
    private func getInventoryItems() {
        // MARK: - Injection
        let viewModel = InventoryViewModel(dataService: DataServiceInventory())
        
        viewModel.getInventory()
        viewModel.updateLoadingStatus = {
            let _ = viewModel.isLoading ? Loading.Start() : Loading.Stop()
        }
        viewModel.showAlertClosure = {
            if viewModel.error != nil{
                guard let errorMessage = viewModel.error as? errorWithMessage else {
                    guard let errorAf = viewModel.error as? Alamofire.AFError else {
                        AlertShowWithoutView.sharedInstance.showAlert(title: "Error".localize() , message: "Error".localize() )
                        return
                    }
                    AlertShowWithoutView.sharedInstance.showAlert(title: "Error".localize() , message: errorAf.localizedDescription )
                    return
                }
                AlertShowWithoutView.sharedInstance.showAlert(title: "Error".localize() , message: errorMessage.localizedDescription )
            }
        }
        
        viewModel.didFinishFetch = {
            if viewModel.error == nil{
                self.model = viewModel.model
                print(self.model?.count)
                self.tableView.reloadData()
               print(viewModel.model?.count)
            }
        }
    }

}







extension InventoryViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! InventoryCell
        
        cell.imgProduct.image = UIImage(named: "PlaceHolder_Products")
        cell.txtTitle.text = self.model?[indexPath.row].title
        cell.txtSerial.text = self.model?[indexPath.row].manufacturer_part_numbers ?? "0"
        cell.txtPrice.text =  "\(Double(round(100*(self.model?[indexPath.row].price ?? 0))/100))"
        cell.txtCount.text = "\(self.model?[indexPath.row].quantity ?? 0)"
        cell.txtInStock.text = "\(self.model?[indexPath.row].quantity ?? 0)"
        
        return cell
    }
    
    
}
