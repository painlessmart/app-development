//
//  InventoryItemUpdateViewModel.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/28/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation
class InventoryItemUpdateViewModel {
    // MARK: - Properties
    private var inventoryItemUpdateModel : String? {
        didSet {
            guard let p = inventoryItemUpdateModel else { return }
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
    private var dataServiceInventoryUpdate: DataServiceInventoryUpdate?
    
    // MARK: - Closures for callback, since we are not using the ViewModel to the View.
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    var didFinishFetch: (() -> ())?
    
    // MARK: - Constructor
    init(dataService: DataServiceInventoryUpdate) {
        self.dataServiceInventoryUpdate = dataService
        self.isLoading = true
    }
    
    
    // MARK: - Network call
    func update(id : Int , requestData : AddInventoryRequest) {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        self.dataServiceInventoryUpdate?.update(id: id, requestData: requestData, completion: { (model, error) in
            if let error = error {
                self.error = error
                self.isLoading = false
                return
            }
            self.error = nil
            self.isLoading = false
            self.inventoryItemUpdateModel = model
        })
    }
}
