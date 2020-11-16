//
//  ProfileInfoHeaderCollectionReusableView.swift
//  Instagram
//
//  Created by Alfly on 2020/11/14.
//  Copyright © 2020 Alfly. All rights reserved.
//

import UIKit

class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileInfoHeaderCollectionReusableView"
    
    private let profilePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        //imageView.backgroundColor = .red
        imageView.image = UIImage(named:"profilePhoto")
        
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let postsButton: UIButton = {
        let button = UIButton()
        button.setTitle("发布", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let followersButton: UIButton = {
        let button = UIButton()
        button.setTitle("粉丝", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let followingButton: UIButton = {
        let button = UIButton()
        button.setTitle("关注", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let editProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("修改信息", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "龙飞的主页"
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.text = "刚来，什么都没有留下呢"
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        backgroundColor = .systemBackground
        clipsToBounds = true
    }
    
    private func addSubviews(){
        addSubview(profilePhotoImageView)
        addSubview(followersButton)
        addSubview(followingButton)
        addSubview(postsButton)
        addSubview(bioLabel)
        addSubview(nameLabel)
        addSubview(editProfileButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let profilePhotoSize = width/4
        profilePhotoImageView.frame  = CGRect(
            x: 5,
            y: 5,
            width: profilePhotoSize,
            height: profilePhotoSize
        ).integral
        
        profilePhotoImageView.layer.cornerRadius = profilePhotoSize/2
        
        let buttonHeight = profilePhotoSize/2
        let countButtonWidth = (width-10-profilePhotoSize)/3
        postsButton.frame  = CGRect(
            x: profilePhotoImageView.right,
            y: 5,
            width: countButtonWidth,
            height: buttonHeight
        ).integral
        
        followersButton.frame  = CGRect(
            x: postsButton.right,
            y: 5,
            width: countButtonWidth,
            height: buttonHeight
        ).integral
        
        followingButton.frame  = CGRect(
            x: followersButton.right,
            y: 5,
            width: countButtonWidth,
            height: buttonHeight
        ).integral
        
        editProfileButton.frame  = CGRect(
            x: profilePhotoImageView.right,
            y: 5+buttonHeight,
            width: countButtonWidth*3,
            height: buttonHeight
        ).integral
        
        nameLabel.frame  = CGRect(
            x: 5,
            y: 1+profilePhotoImageView.bottom,
            width: width-10,
            height: 50
        ).integral
        
        let bioLabelSize = bioLabel.sizeThatFits(frame.size)
        bioLabel.frame  = CGRect(
            x: 5,
            y: 5+nameLabel.bottom,
            width: width-10,
            height: bioLabelSize.height
        ).integral
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
