//
//  AddInventoryViewModel.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/28/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation
class AddInventoryViewModel {
    // MARK: - Properties
    private var addInventoryModel: AddInventoryModel? {
        didSet {
            guard let p = addInventoryModel else { return }
            self.model = p
            self.didFinishFetch?()
        }
    }
    
    var error: Error? {
        didSet { self.showAlertClosure?() }
    }
    var isLoading: Bool = false {
        didSet { self.updateLoadingStatus?() }
    }
    
    var model : AddInventoryModel?
    private var dataServiceAddInventory: DataServiceAddInventory?
    
    // MARK: - Closures for callback, since we are not using the ViewModel to the View.
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    var didFinishFetch: (() -> ())?
    
    // MARK: - Constructor
    init(dataService: DataServiceAddInventory) {
        self.dataServiceAddInventory = dataService
        self.isLoading = true
    }
    
    
    // MARK: - Network call
    func add(request : AddInventoryRequest) {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        self.dataServiceAddInventory?.add(request: request , completion: { (model, error) in
            if let error = error {
                self.error = error
                self.isLoading = false
                return
            }
            self.error = nil
            self.isLoading = false
            self.addInventoryModel = model
        })
    }
}
