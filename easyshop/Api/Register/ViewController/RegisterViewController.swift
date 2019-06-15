//
//  RegisterViewController.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/23/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var txtBrandName: UITextField!
    @IBOutlet weak var txtBusinessName: UITextField!
    @IBOutlet weak var chbTerms: M13Checkbox!
    var delegateChangeSegment : ChangeSegmentIndexProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnSignUp(_ sender: Any) {
        validate()
    }
    
    
    
    func validate() {
        do {
            let firstName = try txtName.validatedText(validationType: ValidatorType.requiredField(field: txtName.placeholder ?? ""))
            let lastName = try txtLastName.validatedText(validationType: ValidatorType.requiredField(field: txtLastName.placeholder ?? ""))
            let email = try txtEmail.validatedText(validationType: ValidatorType.email)
            let phone = try txtPhone.validatedText(validationType: ValidatorType.requiredField(field: txtPhone.placeholder ?? ""))
            let password = try txtPassword.validatedText(validationType: ValidatorType.password)
            let _ = try txtConfirmPassword.validatedText(validationType: .rePassword(password: txtPassword.text ?? ""))
            let brandName = try txtBrandName.validatedText(validationType: ValidatorType.requiredField(field: txtBrandName.placeholder ?? ""))
            let businessName = try txtBusinessName.validatedText(validationType: .requiredField(field: txtBusinessName.placeholder ?? ""))
            let data = RegisterData(firstName: firstName, lastName: lastName, eMail: email, phone: phone, password: password, brandName: brandName, businessName: businessName)
            if chbTerms.checkState == .checked {
                self.register(registerData: data)
            }else{
                AlertShowWithoutView.sharedInstance.showAlert(title: "Error".localize(), message: "Please accept the terms and conditions")
            }
        } catch(let error) {
            AlertShowWithoutView.sharedInstance.showAlert(title: "Error".localize(), message: (error as! ValidationError).message)
        }
    }
    
    // MARK: - Networking In View Model
    private func register(registerData : RegisterData) {
        // MARK: - Injection
        let viewModel = RegisterViewModel(dataService: DataServiceRegister())
        
        viewModel.register(registerData: registerData)
        viewModel.updateLoadingStatus = {
            let _ = viewModel.isLoading ? Loading.Start() : Loading.Stop()
        }
        viewModel.showAlertClosure = {
            if viewModel.error != nil{
                guard let errorMessage = viewModel.error as? errorWithMessage else {
                    guard let errorAf = viewModel.error as? Alamofire.AFError else {
                        AlertShowWithoutView.sharedInstance.showAlert(title: "Error".localize() , message: "Error".localize() )
                        return
                    }
                    AlertShowWithoutView.sharedInstance.showAlert(title: "Error".localize() , message: errorAf.localizedDescription )
                    return
                }
                AlertShowWithoutView.sharedInstance.showAlert(title: "Error".localize() , message: errorMessage.localizedDescription )
            }
        }
        
        viewModel.didFinishFetch = {
            if viewModel.error == nil{
                self.txtConfirmPassword.text = ""
                self.txtPassword.text = ""
                self.txtName.text = ""
                self.txtLastName.text = ""
                self.txtEmail.text = ""
                self.txtPhone.text = ""
                self.txtBrandName.text = ""
                self.txtBusinessName.text = ""
                self.chbTerms.checkState = .unchecked
                self.delegateChangeSegment?.changeSegmentIndex(0)
                AlertShowWithoutView.sharedInstance.showAlert(title: "Success".localize() , message: "You are now successfully registered")
            }
        }
    }

}


protocol ChangeSegmentIndexProtocol {
    func changeSegmentIndex(_ index : Int)
}
