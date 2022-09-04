//
//  InfDayViewController.swift
//  Calender
//
//  Created by Apple on 30/08/2022.
//

import UIKit

class InfDayViewController: UIViewController {
    
    private let collectionView: UICollectionView = {
      let layout = UICollectionViewFlowLayout()
//        layout.minimumInteritemSpacing = 5
//        layout.itemSize = CGSize(width: 140, height: 200)
//      layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
//        
      let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView.register(InfDayCollectionViewCell.self, forCellWithReuseIdentifier: InfDayCollectionViewCell.identifier)
      return collectionView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionView)
        collectionView.backgroundColor = .opaqueSeparator
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }


}

extension InfDayViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell( withReuseIdentifier: InfDayCollectionViewCell.identifier,for: indexPath) as! InfDayCollectionViewCell
        
    

//        cell.clipsToBounds = true
//        cell.layer.masksToBounds = true
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 30

        return cell
    }



}


extension InfDayViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Int((collectionView.frame.width - 30) / 2), height: Int(collectionView.frame.height - 30 ) / 2)
    }
    
    
}
