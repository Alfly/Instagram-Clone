//
//  SettingsViewController.swift
//  Instagram
//
//  Created by Alfly on 2020/11/12.
//  Copyright © 2020 Alfly. All rights reserved.
//

import UIKit

struct SettingCellModel {
    let title: String
    let handler: (() -> Void)                   //注意这里
}


/// View Chontroller to show user settings
final class SettingsViewController: UIViewController {

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return tableView
    }()
    
    private var data = [[SettingCellModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureModels()
        
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func  configureModels() {
        data.append([
            SettingCellModel(title: "修改信息"){[weak self] in self?.didTapLogout()},
            SettingCellModel(title: "邀请朋友"){[weak self] in self?.didTapLogout()},
            SettingCellModel(title: "恢复初始数据"){[weak self] in self?.didTapLogout()} //Save Original Post
        ])
        
        data.append([
            SettingCellModel(title: "服务"){[weak self] in self?.didTapLogout()},
            SettingCellModel(title: "隐私"){[weak self] in self?.didTapLogout()},
            SettingCellModel(title: "反馈"){[weak self] in self?.didTapLogout()},
            SettingCellModel(title: "帮助"){[weak self] in self?.didTapLogout()}
        ])
        
        data.append([
            SettingCellModel(title: "退出登陆"){[weak self] in self?.didTapLogout()}
        ])
    }
    
    private func didTapLogout() {
        let actionSheet = UIAlertController(title: "退出", message: "确定退出？", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "退出", style: .destructive, handler: { _ in
            AuthManager.shared.logOut { (success) in
                DispatchQueue.main.async {
                    if success {
                        //present log in
                        let loginVC = LoginViewController()
                        loginVC.modalPresentationStyle = .fullScreen
                        self.present(loginVC, animated: true) {
                            self.navigationController?.popToRootViewController(animated: false)
                            self.tabBarController?.selectedIndex = 0
                        }
                    }
                    else {
                        //error occured
                        fatalError("Could not log out user")
                    }
                }
            }
        }))
        
        actionSheet.popoverPresentationController?.sourceView = tableView       // For iPad not to crash
        actionSheet.popoverPresentationController?.sourceRect = tableView.bounds
        
        present(actionSheet, animated: true)
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        cell.accessoryType = .disclosureIndicator                    //cell's has a '>'
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //handle selection
        data[indexPath.section][indexPath.row].handler()
    }

}
