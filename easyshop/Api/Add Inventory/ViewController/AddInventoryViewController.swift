//
//  AddInventoryViewController.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/28/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import UIKit
import Alamofire



class AddInventoryViewController: UIViewController {

    @IBOutlet weak var btnPublish: LoadingButton!
    @IBOutlet weak var txtBrand: UITextFieldEasyShop!
    @IBOutlet weak var txtTitle: UITextFieldEasyShop!
    @IBOutlet weak var txtCategory: UITextFieldEasyShop!
    @IBOutlet weak var txtPrice: UITextFieldEasyShop!
    @IBOutlet weak var txtCurrency: UITextFieldEasyShop!
    @IBOutlet weak var txtShipingCoast: UITextFieldEasyShop!
    @IBOutlet weak var txtQuantity: UITextFieldEasyShop!
    @IBOutlet weak var txtManufacturer: UITextFieldEasyShop!
    @IBOutlet weak var txtMaufacturerPartNumber: UITextFieldEasyShop!
    @IBOutlet weak var txtDescription: UITextView!
    var categories: [CategoriesGetCategories]?
    var pickerView = UIPickerView()
    var selectedItemCategory : CategoriesGetCategories?
    var currenceies : [CurrencyGetModelCodable]?
    var selectedCurrency : CurrencyGetModelCodable?
    var delegate : UpdateInventoryItemsDelegate?
    var isUpdate = false
    var itemId : Int?
    var updateModel : InventoryItemsGetModelCodeble?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        DispatchQueue.main.async {
            self.getCategories()
        }
        DispatchQueue.main.async {
            self.getCurrency()
        }
//        DispatchQueue.main.async {
//            self.getTradingSites()
//        }
        
        if isUpdate {
            self.btnPublish.setTitle("Update", for: .normal)
            self.txtTitle.text = updateModel?.title ?? ""
            self.txtBrand.text = updateModel?.brand ?? ""
            self.txtPrice.text = "\(updateModel?.price ?? 0)"
            self.txtShipingCoast.text = "\(updateModel?.shipping_cost ?? 0)"
            self.txtQuantity.text = "\(updateModel?.quantity ?? 0)"
            self.txtManufacturer.text = updateModel?.manufacturer ?? ""
            self.txtMaufacturerPartNumber.text = updateModel?.manufacturer_part_numbers ?? ""
        }
    }
    
    // MARK: - Networking In View Model
    private func getCurrency() {
        // MARK: - Injection
        let viewModel = CurrencyViewModel(dataService: DataServiceCurrency())
        
        viewModel.getCurrency()
        viewModel.updateLoadingStatus = {
//            let _ = viewModel.isLoading ? Loading.Start() : Loading.Stop()
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
                self.currenceies = viewModel.model
                if self.isUpdate {
                    let cur = viewModel.model?.first(where : {$0.id == self.updateModel?.cur_id ?? 0})
                    self.txtCurrency.text = cur?.currency ?? ""
                    self.selectedCurrency = cur
                }
            }
        }
    }
   
    
//    // MARK: - Networking In View Model
//    private func getTradingSites() {
//        // MARK: - Injection
//        let viewModel = TradingSitesViewModel(dataService: DataServiceTradingSites())
//
//        viewModel.getTradingSites()
//        viewModel.updateLoadingStatus = {
////            let _ = viewModel.isLoading ? Loading.Start() : Loading.Stop()
//        }
//        viewModel.showAlertClosure = {
//            if viewModel.error != nil{
//                guard let errorMessage = viewModel.error as? errorWithMessage else {
//                    guard let errorAf = viewModel.error as? Alamofire.AFError else {
//                        AlertShowWithoutView.sharedInstance.showAlert(title: "Error".localize() , message: "Error".localize() )
//                        return
//                    }
//                    AlertShowWithoutView.sharedInstance.showAlert(title: "Error".localize() , message: errorAf.localizedDescription )
//                    return
//                }
//                AlertShowWithoutView.sharedInstance.showAlert(title: "Error".localize() , message: errorMessage.localizedDescription )
//            }
//        }
//
//        viewModel.didFinishFetch = {
//            if viewModel.error == nil{
//                print(viewModel.model?.count)
//            }
//        }
//    }

    // MARK: - Networking In View Model
    private func getCategories() {
        // MARK: - Injection
        let viewModel = CategoriesViewModel(dataService: DataServiceCategories())
        
        viewModel.getCategories()
        viewModel.updateLoadingStatus = {
//            let _ = viewModel.isLoading ? Loading.Start() : Loading.Stop()
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
                self.categories = viewModel.model?.categories
                if self.isUpdate {
                    let cat = viewModel.model?.categories?.first(where : {$0.internalIdentifier == self.updateModel?.cat_id ?? 0})
                    self.txtCategory.text = cat?.name ?? ""
                    self.selectedItemCategory = cat
                }
            }
        }
    }
    
    // MARK: - Networking In View Model
    private func addInventory(request : AddInventoryRequest) {
        // MARK: - Injection
        let viewModel = AddInventoryViewModel(dataService: DataServiceAddInventory())
        
        viewModel.add(request: request)
        viewModel.updateLoadingStatus = {
            let _ = viewModel.isLoading ? self.btnPublish.showLoading() : self.btnPublish.hideLoading()
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
                self.delegate?.updateItems()
                self.navigationController?.popViewController(animated: true)
                AlertShowWithoutView.sharedInstance.showAlert(title: "Success".localize() , message: "Item successfully added")
            }
        }
    }
    
    // MARK: - Networking In View Model
    private func updateItemInventory(id : Int , requestData : AddInventoryRequest) {
        // MARK: - Injection
        let viewModel = InventoryItemUpdateViewModel(dataService: DataServiceInventoryUpdate())
        
        viewModel.update(id: id, requestData: requestData)
        viewModel.updateLoadingStatus = {
            let _ = viewModel.isLoading ? self.btnPublish.showLoading() : self.btnPublish.hideLoading()
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
                self.delegate?.updateItems()
                self.navigationController?.popViewController(animated: true)
                AlertShowWithoutView.sharedInstance.showAlert(title: "Success".localize() , message: "Item successfully updated")
            }
        }
    }
    
    @IBAction func btnCategory(_ sender: Any) {
        guard self.categories != nil else {
            return
        }
        self.showPickerView(.category)
    }
    @IBAction func btnCurrency(_ sender: Any) {
        guard self.currenceies != nil else {
            return
        }
        self.showPickerView(.currency)
    }
    
    @IBAction func btnPublish(_ sender: Any) {
        view.endEditing(true)
        self.validate()
    }
    
    func validate() {
        do {
            let title = try txtTitle.validatedText(validationType: ValidatorType.requiredField(field: txtTitle.placeHolder ))
            let brand = try txtBrand.validatedText(validationType: ValidatorType.requiredField(field: txtBrand.placeHolder ))
            let _ = try txtCategory.validatedText(validationType: ValidatorType.requiredField(field: txtCategory.placeHolder ))
            let price = try txtPrice.validatedText(validationType: ValidatorType.requiredField(field: txtPrice.placeHolder ))
            let _ = try txtCurrency.validatedText(validationType: ValidatorType.requiredField(field: txtCurrency.placeHolder ))
            let shipingCoast = try txtShipingCoast.validatedText(validationType: ValidatorType.requiredField(field: txtShipingCoast.placeHolder ))
            let quantity = try txtQuantity.validatedText(validationType: ValidatorType.requiredField(field: txtQuantity.placeHolder ))
            let manufacturer = try txtManufacturer.validatedText(validationType: ValidatorType.requiredField(field: txtManufacturer.placeHolder ))
            let maufacturerPartNumber = try txtMaufacturerPartNumber.validatedText(validationType: ValidatorType.requiredField(field: txtMaufacturerPartNumber.placeHolder ))

            let data = AddInventoryRequest(mainPicUrl: "", mainPicName: "", descriptionValue: txtDescription.text ?? "", quantity: Int(quantity), curId: self.selectedCurrency?.id ?? 0 , price: Float(price), brand: brand, shippingCost: Int(shipingCoast), title: title, userId: MyProperties.sharedInstance.getUserId(), catId: self.selectedItemCategory?.internalIdentifier ?? 0 , manufacturer: manufacturer, manufacturerPartNumbers: maufacturerPartNumber)
            if self.isUpdate {
                self.updateItemInventory(id: self.itemId ?? 0 , requestData: data)
            }else{
                self.addInventory(request: data)
            }
        } catch(let error) {
            AlertShowWithoutView.sharedInstance.showAlert(title: "Error".localize(), message: (error as! ValidationError).message)
        }
    }
}


extension AddInventoryViewController : UIPickerViewDelegate , UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if self.pickerView.tag == AddInventoryPickerType.category.hashValue{
            return self.categories?.count ?? 0
        }else {
            return self.currenceies?.count ?? 0
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if self.pickerView.tag == AddInventoryPickerType.category.hashValue{
            self.selectedItemCategory = self.categories?[0]
            return self.categories?[row].name ?? ""
        }else {
            self.selectedCurrency = self.currenceies?[0]
            return self.currenceies?[row].currency ?? ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if self.pickerView.tag == AddInventoryPickerType.category.hashValue{
            self.selectedItemCategory = self.categories?[row]
        }else {
            self.selectedCurrency = self.currenceies?[row]
        }
    }
    
    enum AddInventoryPickerType {
        case category
        case currency
    }
    
    func showPickerView(_ type : AddInventoryPickerType)  {
        self.pickerView = UIPickerView()
        
        var title = "Select Category"
        self.pickerView.tag = AddInventoryPickerType.category.hashValue
        if type == .currency {
            self.pickerView.tag = AddInventoryPickerType.currency.hashValue
            title = "Select Currency"
        }
        let alertView = UIAlertController(title: title , message: "\n\n\n\n\n\n\n\n\n\n", preferredStyle: UIAlertController.Style.actionSheet);
        
        pickerView.delegate = self
        pickerView.dataSource = self
        if !DeviceType.IS_IPAD{
            pickerView.center.x = self.view.center.x
        }
        alertView.view.addSubview(pickerView)
        if DeviceType.IS_IPAD{
            alertView.popoverPresentationController?.sourceView = self.view
            alertView.popoverPresentationController?.sourceRect = self.pickerView.bounds
        }
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default){
            UIAlertAction in
            if type == .category {
                self.pickerView.tag = AddInventoryPickerType.category.hashValue
                
                self.txtCategory.text = self.selectedItemCategory?.name ?? ""
            }else if type == .currency {
                self.pickerView.tag = AddInventoryPickerType.currency.hashValue
                
                self.txtCurrency.text = self.selectedCurrency?.currency ?? ""
            }
        }
        
        alertView.addAction(action)
        present(alertView, animated: true, completion: nil)
    }
    
}


protocol UpdateInventoryItemsDelegate {
    func updateItems()
}
