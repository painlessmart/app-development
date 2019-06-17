  //
//  InventoryViewModel.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/27/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation

class InventoryViewModel {
    // MARK: - Properties
    private var inventoryItemsGetModel: [InventoryItemsGetModelCodeble]? {
        didSet {
            guard let p = inventoryItemsGetModel else { return }
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
    
    var model : [InventoryItemsGetModelCodeble]?
    private var dataServiceInventory: DataServiceInventory?
    
    // MARK: - Closures for callback, since we are not using the ViewModel to the View.
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    var didFinishFetch: (() -> ())?
    
    // MARK: - Constructor
    init(dataService: DataServiceInventory) {
        self.dataServiceInventory = dataService
        self.isLoading = true
    }
    
    
    // MARK: - Network call
    func getInventory() {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        self.dataServiceInventory?.inventoryItemsGet(completion: { (model, error) in
            if let error = error {
                self.error = error
                self.isLoading = false
                return
            }
            self.error = nil
            self.isLoading = false
            self.inventoryItemsGetModel = model
        })
    }
  }
