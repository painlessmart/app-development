//
//  InventoryViewController.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/27/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import UIKit
import Alamofire
import JJFloatingActionButton

class InventoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var model : [InventoryItemsGetModelCodeble]?
    var refreshControl = UIRefreshControl()
    var selectedItemForEdit : InventoryItemsGetModelCodeble?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getInventoryItems()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControl)
        
        
        let actionButton = JJFloatingActionButton()
        actionButton.buttonColor = Tools.colorWithHexString(hex: "3B55E6")
        actionButton.handleSingleActionDirectly = true
        actionButton.addItem(title: "Add", image: nil) { (sender) in
            self.performSegue(withIdentifier: "addItem", sender: self)
        }
        actionButton.display(inViewController: self)
    }
    @objc func refresh(_ sender:AnyObject) {
        self.updateItems()
    }
    @IBAction func btnLogOut(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
  
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let addItem = segue.destination as? AddInventoryViewController else {
            return
        }
        addItem.delegate = self
        if sender == nil {
            addItem.isUpdate = true
            addItem.itemId = self.selectedItemForEdit?.id
            addItem.updateModel = self.selectedItemForEdit
        }
    }
    
    // MARK: - Networking In View Model
    private func getInventoryItems() {
        // MARK: - Injection
        let viewModel = InventoryViewModel(dataService: DataServiceInventory())
        
        viewModel.getInventory()
        viewModel.updateLoadingStatus = {
            let _ = viewModel.isLoading ? self.refreshControl.programaticallyBeginRefreshing(in: self.tableView) : self.refreshControl.endRefreshing()
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
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
    }
    
    // MARK: - Networking In View Model
    private func deleteItem(id : Int , indexPath : IndexPath) {
        // MARK: - Injection
        let viewModel = InventoryDeleteViewModel(dataService: DataServiceItemDelete())
        
        viewModel.delete(id: id)
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
                self.model?.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .fade)
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
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            self.deleteItem(id: self.model?[indexPath.row].id ?? 0 , indexPath : indexPath)
        }
        
        let share = UITableViewRowAction(style: .default, title: "Edit") { (action, indexPath) in
            self.selectedItemForEdit = self.model?[indexPath.row]
            self.performSegue(withIdentifier: "addItem", sender: nil)
        }
        
        share.backgroundColor = Tools.colorWithHexString(hex: "3B55E6")
        
        return [delete, share]
        
    }
    
    
}


extension InventoryViewController : UpdateInventoryItemsDelegate {
    func updateItems() {
        self.getInventoryItems()
    }
}

