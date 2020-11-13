//
//  LoginViewController.swift
//  Instagram
//
//  Created by Alfly on 2020/11/12.
//  Copyright © 2020 Alfly. All rights reserved.
//
import SafariServices
import UIKit

class LoginViewController: UIViewController {

    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }
    
    private let usernameEmailField: UITextField = {
        let field = UITextField()
        field.placeholder = "用户名或邮箱..."
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
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("登陆", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let termsButton: UIButton = {
        let button = UIButton()
        button.setTitle("关于", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let privacyButton: UIButton = {
        let button = UIButton()
        button.setTitle("隐私", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let CreateAccountButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("新建用户", for: .normal)
        return button
    }()
    
    private let headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true         //如果子视图的范围超出了父视图的边界，那么超出的部分就会被裁剪掉
        let backgroundImageView = UIImageView(image: UIImage(named: "gradient"))
        header.addSubview(backgroundImageView)
        return header
    }()
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginButton.addTarget(self,
                              action: #selector(didTapLoginButton),
                              for: .touchUpInside)                                       //相当于 storyboard 连接响应函数
        CreateAccountButton.addTarget(self,
                              action: #selector(didTapCreateAccountButton),
                              for: .touchUpInside)
        termsButton.addTarget(self,
                              action: #selector(didTapTermsButton),
                              for: .touchUpInside)
        privacyButton.addTarget(self,
                              action: #selector(didTapPrivacyButton),
                              for: .touchUpInside)
    
        usernameEmailField.delegate = self
        passwordField.delegate = self
        
        addSubviews()
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //assign frams
        headerView.frame = CGRect(
            x: 0,
            y: 0,                   //y: view.safeAreaInsets.top,不能填充状态栏
            width: view.width,
            height: view.height/3.0
        )
        usernameEmailField.frame = CGRect(
            x: 25,
            y: headerView.bottom + 40,
            width: view.width - 50,
            height: 52
        )
        passwordField.frame = CGRect(
            x: 25,
            y: usernameEmailField.bottom + 10,
            width: view.width - 50,
            height: 52
        )
        loginButton.frame = CGRect(
            x: 25,
            y: passwordField.bottom + 10,
            width: view.width - 50,
            height: 52
        )
        CreateAccountButton.frame = CGRect(
            x: 25,
            y: loginButton.bottom + 10,
            width: view.width - 50,
            height: 52
        )
        
        termsButton.frame = CGRect(
            x: 10,
            y: view.height - view.safeAreaInsets.bottom - 100,
            width: view.width-20,
            height: 50
        )
        privacyButton.frame = CGRect(
            x: 10,
            y: view.height - view.safeAreaInsets.bottom - 50,
            width: view.width-20,
            height: 50
        )
        
        configureHeaderView()
    }
    
    private func configureHeaderView(){
        guard headerView.subviews.count == 1 else {
            return
        }
        
        guard let backgroudView = headerView.subviews.first else {
            return
        }
        backgroudView.frame = headerView.bounds
    
        // Add logo
        let imageView = UIImageView(image: UIImage(named: "text"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(
            x: headerView.width/4.0,
            y: view.safeAreaInsets.top,
            width: headerView.height/1.5,
            height: headerView.height - view.safeAreaInsets.top
        )
    }
    
    private func addSubviews(){
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(privacyButton)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(CreateAccountButton)
        view.addSubview(headerView)
        
    }
    
    @objc private func didTapLoginButton(){
        usernameEmailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let usernamrEmail = usernameEmailField.text, !usernamrEmail.isEmpty,
            let password = passwordField.text, !password.isEmpty ,password.count >= 8 else {
            return
        }
        
        // login functionality
        
    }
    
    @objc private func didTapTermsButton(){
        guard let url = URL(string: "https://baike.baidu.com/item/Instagram/8550544") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @objc private func didTapPrivacyButton(){
        guard let url = URL(string: "https://www.baidu.com/duty/yinsiquan-policy.html") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @objc private func didTapCreateAccountButton(){
        let vc = RegistrationViewController()
        present(vc, animated: true)
    }
  
}

//confrom delegate
extension LoginViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameEmailField{                     //用户名输入完毕 焦点跳到密码框
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField{                     //密码输入完毕 响应点击登陆
            didTapLoginButton()
        }
        return true
    }
}
