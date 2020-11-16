//
//  RegistrationViewController.swift
//  Instagram
//
//  Created by Alfly on 2020/11/12.
//  Copyright © 2020 Alfly. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }
    
    private let usernameField: UITextField = {
        let field = UITextField()
        field.placeholder = "用户名..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0                                       //添加边框
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
       return field
    }()
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.placeholder = "邮箱..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0                                       //添加边框
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
       return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true      //不显示真实密码 显示*
        field.placeholder = "密码..."
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true                    //在子层需要添加此属性后才会显示圆角
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("注册", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        registerButton.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        usernameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        
        view.addSubview(usernameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(registerButton)
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        usernameField.frame = CGRect(x: 20, y: view.safeAreaInsets.top+100, width: view.width-40, height: 52)
        emailField.frame = CGRect(x: 20, y: usernameField.bottom + 10, width: view.width-40, height: 52)
        passwordField.frame = CGRect(x: 20, y: emailField.bottom + 10, width: view.width-40, height: 52)
        registerButton.frame = CGRect(x: 20, y: passwordField.bottom + 10, width: view.width-40, height: 52)
    }
    
    @objc private func didTapRegister(){
        emailField.resignFirstResponder()
        usernameField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let email = emailField.text, !email.isEmpty,
        let username = usernameField.text, !username.isEmpty,
            let password = passwordField.text, !password.isEmpty /* password.count >= 8 */else {
                return
        }
        
        AuthManager.shared.registerNewUser(username: username, email: email, password: password){ registered in
            DispatchQueue.main.async {
                if registered{
                    //register success
                    //login user automatically
                    
                    
                    //present home view
                    let loginVC = LoginViewController()
                    loginVC.modalPresentationStyle = .fullScreen
                    self.present(loginVC, animated: true) {
                        self.navigationController?.popToRootViewController(animated: false)
                        self.tabBarController?.selectedIndex = 0
                        
                    }
                }
                else{
                    
                }
            }
            
        }
    }
}

//Cannot assign value of type 'RegistrationViewController' to type 'UITextFieldDelegate?'
extension RegistrationViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField{
            emailField.becomeFirstResponder()
        }
        else if textField == emailField{
            passwordField.becomeFirstResponder()
        }
        else{
            didTapRegister()
        }
        return true
    }
}
