//
//  PhotoCollectionViewCell.swift
//  
//
//  Created by Alfly on 2020/11/14.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    static let identifier = "PhotoCollectionViewCell"
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill      //等比拉伸 填充满
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        photoImageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(photoImageView)
        contentView.clipsToBounds = true
        accessibilityLabel = "发布的图片"
        accessibilityHint = "双击打开"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: UserPost){
        // let url = model.thumbnailImag
        // Part8 15:00
    }
    
    public func configure(with imageName: String){
        photoImageView.image = UIImage(named: imageName)
    }
    
}

