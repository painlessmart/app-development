//
//  CategoriesViewModel.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/28/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation
class CategoriesViewModel {
    // MARK: - Properties
    private var categoriesGetModel: CategoriesGetModel? {
        didSet {
            guard let p = categoriesGetModel else { return }
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
    
    var model : CategoriesGetModel?
    private var dataServiceCategories: DataServiceCategories?
    
    // MARK: - Closures for callback, since we are not using the ViewModel to the View.
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    var didFinishFetch: (() -> ())?
    
    // MARK: - Constructor
    init(dataService: DataServiceCategories) {
        self.dataServiceCategories = dataService
        self.isLoading = true
    }
    
    
    // MARK: - Network call
    func getCategories() {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        self.dataServiceCategories?.categoriesGet(completion: { (model, error) in
            if let error = error {
                self.error = error
                self.isLoading = false
                return
            }
            self.error = nil
            self.isLoading = false
            self.categoriesGetModel = model
        })
    }
}
