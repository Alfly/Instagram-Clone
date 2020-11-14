//
//  AuthManagger.swift
//  Instagram
//
//  Created by Alfly on 2020/11/12.
//  Copyright © 2020 Alfly. All rights reserved.
//
import UIKit
import LeanCloud

public class AuthManager: UIViewController{
     
    static let shared = AuthManager()       //单例模式
    
    //MARK - Public
    public func registerNewUser(username: String, email: String, password: String, completion:@escaping (Bool)->Void){
        /*
         - check username
         - check email
         */

        /*
          - creat account
          - insert account to database
          */
        //如果收到 202 错误码，意味着 _User 表里已经存在使用同一 username 的账号，此时应提示用户换一个用户名。除此之外，每个用户的 email 和 mobilePhoneNumber 也需要保持唯一性，否则会收到 203 或 214 错误。
        do {
            // 创建实例
            let user = LCUser()

            // 等同于 user.set("username", value: "Tom")
            user.username = LCString(username)
            user.password = LCString(password)

            // 可选
            user.email = LCString(email)
            //user.mobilePhoneNumber = LCString("+8618200008888")

            // 设置其他属性的方法跟 LCObject 一样
            try user.set("gender", value: "secret")
          
            _ = user.signUp { (result) in
                switch result {
                case .success:
                    completion(true)
                    break
                case .failure(error: let error):
                    print(error)
                    completion(false)
                }
            }
        } catch {
            print(error)
            completion(false)
        }
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion:@escaping (Bool)->Void){
        /*if let email = email {
            //email login
            _ = LCUser.logIn(email: email, password: password) { result in  //匿名函数
                switch result {
                case .success(object: let user):
                    print(user)
                    completion(true)
                case .failure(error: let error):
                    print(error)
                    completion(false)
                }
            }
            }*/
        if let username = username {
            //uaername login
            _ = LCUser.logIn(username: username, password: password) { result in
                switch result {
                case .success(object: let user):
                    print(user)
                    completion(true)
                case .failure(error: let error):
                    print(error)
                    completion(false)
                }
            }
        }
    }
    
    /// Attempt to log out LeanCloud user
    public func logOut(completion: (Bool)->Void){
        //会话信息会长期有效，直到用户主动登出
        LCUser.logOut()
        
        // currentUser 变为 nil
        let currentUser = LCApplication.default.currentUser
        
        if (currentUser == nil) {
            completion(true)
            return
        }
        else {
            completion(false)
            return
        }
    }
    
}
