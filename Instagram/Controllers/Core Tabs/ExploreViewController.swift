//
//  ExploreViewController.swift
//  Instagram
//
//  Created by Alfly on 2020/11/12.
//  Copyright © 2020 Alfly. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController {
    
    private var collectionView: UICollectionView?
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.backgroundColor = .systemBackground
        return searchBar
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.topItem?.titleView = searchBar
        
        let layout = UICollectionViewFlowLayout()
         layout.scrollDirection = .vertical
         layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)  //padding between sections
         layout.itemSize = CGSize(width: view.width/3, height: view.height/3)
         collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
         
         collectionView?.delegate = self
         collectionView?.dataSource = self
         
         guard let collectionView = collectionView else {
             return
         }
         view.addSubview(collectionView)
    }
    
}

extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
