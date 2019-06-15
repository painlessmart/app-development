//
//  RegisterViewModel.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/24/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation

class RegisterViewModel {
    // MARK: - Properties
    private var registerResponseModel: RegisterResponseModel? {
        didSet {
            guard let p = registerResponseModel else { return }
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
    
    var model : RegisterResponseModel?
    private var dataServiceRegister: DataServiceRegister?
    
    // MARK: - Closures for callback, since we are not using the ViewModel to the View.
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    var didFinishFetch: (() -> ())?
    
    // MARK: - Constructor
    init(dataService: DataServiceRegister) {
        self.dataServiceRegister = dataService
        self.isLoading = true
    }
    
    
    // MARK: - Network call
    func register(registerData : RegisterData) {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        self.dataServiceRegister?.registerPost(registerData: registerData , completion: { (model, error) in
            if let error = error {
                self.error = error
                self.isLoading = false
                return
            }
            self.error = nil
            self.isLoading = false
            self.registerResponseModel = model
        })
    }
}
