//
//  CurrencyViewModel.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/28/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation
class CurrencyViewModel {
    // MARK: - Properties
    private var currencyGetModel: [CurrencyGetModelCodable]? {
        didSet {
            guard let p = currencyGetModel else { return }
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
    
    var model : [CurrencyGetModelCodable]?
    private var dataServiceCurrency: DataServiceCurrency?
    
    // MARK: - Closures for callback, since we are not using the ViewModel to the View.
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    var didFinishFetch: (() -> ())?
    
    // MARK: - Constructor
    init(dataService: DataServiceCurrency) {
        self.dataServiceCurrency = dataService
        self.isLoading = true
    }
    
    
    // MARK: - Network call
    func getCurrency() {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        self.dataServiceCurrency?.currencyGet(completion: { (model, error) in
            if let error = error {
                self.error = error
                self.isLoading = false
                return
            }
            self.error = nil
            self.isLoading = false
            self.currencyGetModel = model
        })
    }
}
