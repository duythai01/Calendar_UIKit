//
//  TagViewController.swift
//  Calender
//
//  Created by Apple on 24/08/2022.
//

import UIKit


var tagList:[String] = ["Do some thing","abcd1","abcd2","abcd3","abcd4","abcd5","abcd6","Do some thing","Do someasfasthing","Do some asf","Do some asf","Do some asf",]

class TagViewController: UIViewController {
    
    let tagCollectionView:UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.minimumInteritemSpacing = 5
    layout.scrollDirection = .vertical
    layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
          
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: TagCollectionViewCell.identifier)
    return collectionView
    }()
    override func viewDidLoad() {
      
        super.viewDidLoad()
        view.addSubview(tagCollectionView)
        tagCollectionView.backgroundColor = .magenta
        
        tagCollectionView.delegate = self
        tagCollectionView.dataSource = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tagCollectionView.frame = view.bounds
      
        
    }

}

extension  TagViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tagList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.identifier, for: indexPath) as? TagCollectionViewCell else { return UICollectionViewCell()}
        cell.backgroundColor = .white
        cell.layer.shouldRasterize = true
        cell.layer.rasterizationScale = UIScreen.main.scale
        cell.configure(with:  tagList[indexPath.row])

    
        return cell
        
    }
    
//    override func systemLayoutFittingSizeDidChange(forChildContentContainer container: UIContentContainer) {
//        <#code#>
//    }
    
    
}

//extension TagViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: Int((collectionView.frame.width - 20) / 4), height: Int(collectionView.frame.height) / 8)
//    }}
