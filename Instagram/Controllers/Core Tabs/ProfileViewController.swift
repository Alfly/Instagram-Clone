//
//  ProfileViewController.swift
//  Instagram
//
//  Created by Alfly on 2020/11/12.
//  Copyright © 2020 Alfly. All rights reserved.
//

import UIKit

/// Profile view controller
final class ProfileViewController: UIViewController {

    private var collectionView: UICollectionView?
    
    private var userPost = [UserPost]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        configureNavigationBar()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)  //FlowLayout与旁边的间距padding
        
        let size = (view.width - 4)/3
        layout.itemSize = CGSize(width: size,height: size)
        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        
        collectionView?.backgroundColor = .systemBackground
        
        //cell
        collectionView?.register(PhotoCollectionViewCell.self,
                                 forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        collectionView?.register(ProfileInfoHeaderCollectionReusableView.self,
                                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                 withReuseIdentifier: ProfileInfoHeaderCollectionReusableView.identifier)
        collectionView?.register(ProfileTabsCollectionReusableView.self,
                                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                 withReuseIdentifier: ProfileTabsCollectionReusableView.identifier)
        
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        guard let collectionView = collectionView else {
            return
        }
        view.addSubview(collectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
    }
    
    private func configureNavigationBar(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"),
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapSettingButton))
    }
    
    @objc private func didTapSettingButton(){
        let vc = SettingsViewController()
        vc.title = "设置"
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        }
        //return userPost.count
        return 30                    // 30 rows for test
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //let model = UserPost[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
        
        cell.configure(with: "test")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        //let vc = PostViewController(model: nil)
        let vc = PostViewController()
        vc.title = "Post"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard kind == UICollectionView.elementKindSectionHeader else {
            // Footer
            return UICollectionReusableView()
        }
        
        if indexPath.section == 1 {
            // head tab bar
            let tabControlHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProfileTabsCollectionReusableView.identifier, for: indexPath) as! ProfileTabsCollectionReusableView
            
            return tabControlHeader
        }
        
        let profileHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProfileInfoHeaderCollectionReusableView.identifier, for: indexPath) as! ProfileInfoHeaderCollectionReusableView
        
        return profileHeader
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: collectionView.width,
                          height: collectionView.height/3)
        }
        
        //Size of section tab
        return CGSize(width: collectionView.width,
                      height:60)
    }
    
}
