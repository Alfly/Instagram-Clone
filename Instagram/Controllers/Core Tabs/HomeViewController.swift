//
//  ViewController.swift
//  Instagram
//
//  Created by Alfly on 2020/11/12.
//  Copyright © 2020 Alfly. All rights reserved.
//

import UIKit
import LeanCloud

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        /* LeanCloud Storage Test
        do {
            let testObject = LCObject(className: "TestObject")
            try testObject.set("words", value: "Hello world!")
            let result = testObject.save()
            if let error = result.error {
                print(error)
            }
        } catch {
            print(error)
        }*/
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        handleNotAuthenticated()
    }
    
    private func handleNotAuthenticated(){
        //Check auth status
        if let user = LCApplication.default.currentUser {
            // 跳到首页
        } else {
            // 显示注册或登录页面
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
            
        }
    }
    

}

