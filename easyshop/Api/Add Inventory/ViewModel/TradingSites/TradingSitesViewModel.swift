//
//  TradingSitesViewModel.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/28/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation
class TradingSitesViewModel {
    // MARK: - Properties
    private var tradingSitesGetModel: [TradingSitesGetModelCodable]? {
        didSet {
            guard let p = tradingSitesGetModel else { return }
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
    
    var model : [TradingSitesGetModelCodable]?
    private var dataServiceTradingSites: DataServiceTradingSites?
    
    // MARK: - Closures for callback, since we are not using the ViewModel to the View.
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    var didFinishFetch: (() -> ())?
    
    // MARK: - Constructor
    init(dataService: DataServiceTradingSites) {
        self.dataServiceTradingSites = dataService
        self.isLoading = true
    }
    
    
    // MARK: - Network call
    func getTradingSites() {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        self.dataServiceTradingSites?.tradingSitesGet(completion: { (model, error) in
            if let error = error {
                self.error = error
                self.isLoading = false
                return
            }
            self.error = nil
            self.isLoading = false
            self.tradingSitesGetModel = model
        })
    }
}
