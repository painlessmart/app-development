//
//  InventoryDeleteViewModel.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/28/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation
class InventoryDeleteViewModel {
    // MARK: - Properties
    private var inventoryItemDeleteModel : String? {
        didSet {
            guard let p = inventoryItemDeleteModel else { return }
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
    
    var model : String?
    private var dataServiceInventoryDelete: DataServiceItemDelete?
    
    // MARK: - Closures for callback, since we are not using the ViewModel to the View.
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    var didFinishFetch: (() -> ())?
    
    // MARK: - Constructor
    init(dataService: DataServiceItemDelete) {
        self.dataServiceInventoryDelete = dataService
        self.isLoading = true
    }
    
    
    // MARK: - Network call
    func delete(id : Int) {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        self.dataServiceInventoryDelete?.delete(id: id, completion:  { (model, error) in
            if let error = error {
                self.error = error
                self.isLoading = false
                return
            }
            self.error = nil
            self.isLoading = false
            self.inventoryItemDeleteModel = model
        })
    }
}
