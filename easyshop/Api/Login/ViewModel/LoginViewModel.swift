//
//  LoginViewModel.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/23/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation

class LoginViewModel {
    // MARK: - Properties
    private var loginResponseModel: LoginResponseModel? {
        didSet {
            guard let p = loginResponseModel else { return }
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
    
    var model : LoginResponseModel?
    private var dataServiceLogin: DataServiceLogin?
    
    // MARK: - Closures for callback, since we are not using the ViewModel to the View.
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    var didFinishFetch: (() -> ())?
    
    // MARK: - Constructor
    init(dataService: DataServiceLogin) {
        self.dataServiceLogin = dataService
        self.isLoading = true
    }
    
    
    // MARK: - Network call
    func Login(work_email : String , password : String ) {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        self.dataServiceLogin?.loginPost(work_email: work_email, password: password, completion: { (model, error) in
            if let error = error {
                self.error = error
                self.isLoading = false
                return
            }
            self.error = nil
            self.isLoading = false
            self.loginResponseModel = model
        })
    }
}
