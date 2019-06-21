//
//  ListingAddItemViewModel.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/30/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation

class ListingAddItemViewModel {
    // MARK: - Properties
    private var addLinstingModel: ListingAddItemModel? {
        didSet {
            guard let p = addLinstingModel else { return }
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
    
    var model : ListingAddItemModel?
    private var dataServiceAddListingItem: DataServiceAddListingItem?
    
    // MARK: - Closures for callback, since we are not using the ViewModel to the View.
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    var didFinishFetch: (() -> ())?
    
    // MARK: - Constructor
    init(dataService: DataServiceAddListingItem) {
        self.dataServiceAddListingItem = dataService
        self.isLoading = true
    }
    
    
    // MARK: - Network call
    func add(request : ListingAddItemRequest) {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        self.dataServiceAddListingItem?.add(request: request ,  completion: { (model, error) in
            if let error = error {
                self.error = error
                self.isLoading = false
                return
            }
            self.error = nil
            self.isLoading = false
            self.addLinstingModel = model
        })
    }
}
