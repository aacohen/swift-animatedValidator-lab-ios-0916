//
//  ValidatorViewController.swift
//  animated-validator-swift
//
//  Created by Flatiron School on 6/27/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ValidatorViewController: UIViewController, UITextFieldDelegate {
    
    var emailValid: Bool = false
    var emailConfirmValid: Bool = false
    var phoneTextFieldValid: Bool = false
    var passwordValid: Bool = false
    var passwordConfirmValid: Bool = false

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailConfirmationTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    
    @IBAction func emailTextFieldAction(_ sender: AnyObject) {
        if !(emailTextField.text?.contains("@"))! && !(emailTextField.text?.contains("."))! {
            //make the field flash red and pulse (quickly grow bigger/smaller).
            self.emailTextField.backgroundColor = UIColor.white
            UIView.animate(withDuration: 1.0, delay: 0.0, options: .repeat , animations: {
                self.emailTextField.backgroundColor = UIColor.red
                self.view.layoutIfNeeded()
                }, completion: nil )
        }
        else {
            self.emailTextField.backgroundColor = UIColor.white
            self.emailValid = true
            print(" emailVaild Status: \(emailValid)")
            if validCheck() == true {
                submitButton.isEnabled = true
                submitButtonAnimate()
                
            }
            
        }
    }
    
    @IBAction func emailConfirmationTextFieldAction(_ sender: AnyObject) {
        if emailConfirmationTextField.text != emailTextField.text {
            self.emailConfirmationTextField.backgroundColor = UIColor.white
            UIView.animate(withDuration: 1.0, delay: 0.0, options: .repeat , animations: {
                self.emailConfirmationTextField.backgroundColor = UIColor.red
                self.view.layoutIfNeeded()
                }, completion: nil )
        }
        else {
            self.emailConfirmationTextField.backgroundColor = UIColor.white
            self.emailConfirmValid = true
            print(" email confirm Status: \(emailConfirmValid)")
            if validCheck() == true {
                submitButton.isEnabled = true
                submitButtonAnimate()
            }
        }
    }
    @IBAction func phoneTextFieldAction(_ sender: AnyObject) {
        if phoneTextField.text?.characters.count == 7  {
            self.phoneTextField.backgroundColor = UIColor.white
            UIView.animate(withDuration: 1.0, delay: 0.0, options: .repeat , animations: {
                self.phoneTextField.backgroundColor = UIColor.red
                self.view.layoutIfNeeded()
                }, completion: nil )
        }
        
        else {
            self.phoneTextField.backgroundColor = UIColor.white
            self.phoneTextFieldValid = true
            print(" phone text field valid Status: \(phoneTextFieldValid)")
            if validCheck() == true {
                submitButton.isEnabled = true
                submitButtonAnimate()
            }
        }
    }

    @IBAction func passwordTextFieldAction(_ sender: AnyObject) {
        if (passwordTextField.text?.characters.count)! < 6 {
            self.passwordTextField.backgroundColor = UIColor.white
            UIView.animate(withDuration: 1.0, delay: 0.0, options: .repeat , animations: {
                self.passwordTextField.backgroundColor = UIColor.red
                self.view.layoutIfNeeded()
                }, completion: nil )
        }
        else {
            self.passwordTextField.backgroundColor = UIColor.white
            self.passwordValid = true
            print(" password valid Status: \(passwordValid)")
            if validCheck() == true {
                submitButton.isEnabled = true
                submitButtonAnimate()
            }
        }
    }
    @IBAction func passwordConfirmTextFieldAction(_ sender: AnyObject) {
        if !(passwordConfirmTextField.text == passwordTextField.text) {
            self.passwordConfirmTextField.backgroundColor = UIColor.white
            UIView.animate(withDuration: 1.0, delay: 0.0, options: .repeat , animations: {
                self.passwordConfirmTextField.backgroundColor = UIColor.red
                self.view.layoutIfNeeded()
                }, completion: nil )
        }
        else {
            self.passwordConfirmTextField.backgroundColor = UIColor.white
            self.passwordConfirmValid = true
            print(" pasword confirm valid Status: \(passwordConfirmValid)")
            if validCheck() == true {
                submitButton.isEnabled = true
                submitButtonAnimate()
            }
        }
    }
    
    
//    @IBAction func emailEditingChanged(_ sender: AnyObject) {
//        
//        switch UITextField.text(<#T##UITextField#>) {
//            case emailTextField.text
//        }
//    }
    
    // create function that checks all fields are valid - add to end of each statement.
    // add submit button animation function - add in after validation function.
    
    func validCheck() -> Bool {
        let valid: Bool = false
        if (emailValid == true) && (emailConfirmValid == true) && (phoneTextFieldValid == true) && (passwordValid == true) && (passwordConfirmValid == true) {
            let valid = true
            print("valid Check status: \(valid)")
            return valid
        }
        return valid
    }
    
    func submitButtonAnimate() {
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .transitionFlipFromBottom, animations: {
            
           self.submitButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.submitButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            self.view.layoutIfNeeded()
            print("submitButton Animate called - inside animate function")
            }, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view, typically from a nib.
        self.submitButton.accessibilityLabel = Constants.SUBMITBUTTON
        self.emailTextField.accessibilityLabel = Constants.EMAILTEXTFIELD
        self.emailConfirmationTextField.accessibilityLabel = Constants.EMAILCONFIRMTEXTFIELD
        self.phoneTextField.accessibilityLabel = Constants.PHONETEXTFIELD
        self.passwordTextField.accessibilityLabel = Constants.PASSWORDTEXTFIELD
        self.passwordConfirmTextField.accessibilityLabel = Constants.PASSWORDCONFIRMTEXTFIELD
        
        self.submitButton.isEnabled = false
        
    }

    
    
}
