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

    override func viewDidLoad() {
        super.viewDidLoad()

        
        DispatchQueue.main.async {
            self.getCategories()
        }
        DispatchQueue.main.async {
            self.getCurrency()
        }
        DispatchQueue.main.async {
            self.getTradingSites()
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
                print(viewModel.model?.count)
            }
        }
    }
   
    
    // MARK: - Networking In View Model
    private func getTradingSites() {
        // MARK: - Injection
        let viewModel = TradingSitesViewModel(dataService: DataServiceTradingSites())
        
        viewModel.getTradingSites()
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
                print(viewModel.model?.count)
            }
        }
    }

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
                print(viewModel.model?.categories?.count)
            }
        }
    }
}
