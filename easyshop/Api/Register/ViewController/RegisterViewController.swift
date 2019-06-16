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

    @IBOutlet weak var txtName: UITextFieldEasyShop!
    @IBOutlet weak var txtLastName: UITextFieldEasyShop!
    @IBOutlet weak var txtEmail: UITextFieldEasyShop!
    @IBOutlet weak var txtPhone: UITextFieldEasyShop!
    @IBOutlet weak var txtPassword: UITextFieldEasyShop!
    @IBOutlet weak var txtConfirmPassword: UITextFieldEasyShop!
    @IBOutlet weak var txtBrandName: UITextFieldEasyShop!
    @IBOutlet weak var txtBusinessName: UITextFieldEasyShop!
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
            let firstName = try txtName.validatedText(validationType: ValidatorType.requiredField(field: txtName.placeHolder ))
            let lastName = try txtLastName.validatedText(validationType: ValidatorType.requiredField(field: txtLastName.placeHolder ))
            let email = try txtEmail.validatedText(validationType: ValidatorType.email)
            let phone = try txtPhone.validatedText(validationType: ValidatorType.requiredField(field: txtPhone.placeHolder ))
            let password = try txtPassword.validatedText(validationType: ValidatorType.password)
            let _ = try txtConfirmPassword.validatedText(validationType: .rePassword(password: txtPassword.text ?? ""))
            let brandName = try txtBrandName.validatedText(validationType: ValidatorType.requiredField(field: txtBrandName.placeHolder ))
            let businessName = try txtBusinessName.validatedText(validationType: .requiredField(field: txtBusinessName.placeHolder ))
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
