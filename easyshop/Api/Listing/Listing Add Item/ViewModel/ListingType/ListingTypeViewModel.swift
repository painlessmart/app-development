//
//  ListingTypeDataModel.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/30/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation

class ListingTypeDataModel {
    // MARK: - Properties
    private var listingTypeModel: ListingTypeModel? {
        didSet {
            guard let p = listingTypeModel else { return }
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
    
    var model : ListingTypeModel?
    private var dataServiceListingType: DataServiceListingType?
    
    // MARK: - Closures for callback, since we are not using the ViewModel to the View.
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    var didFinishFetch: (() -> ())?
    
    // MARK: - Constructor
    init(dataService: DataServiceListingType) {
        self.dataServiceListingType = dataService
        self.isLoading = true
    }
    
    
    // MARK: - Network call
    func getListingType() {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        self.dataServiceListingType?.getListingType(completion: { (model, error) in
            if let error = error {
                self.error = error
                self.isLoading = false
                return
            }
            self.error = nil
            self.isLoading = false
            self.listingTypeModel = model
        })
    }
}
