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

        layout.sectionInset = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
//        
      let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView.register(InfDayCollectionViewCell.self, forCellWithReuseIdentifier: InfDayCollectionViewCell.identifier)
        collectionView.layer.cornerRadius = 20

      return collectionView
    }()
    
    var infDaySelected:InfAtendance?
    
    
    var configInfDay: InfAtendance? {
        didSet{
            guard let inf = configInfDay else {return}
            self.infDaySelected = inf
            DispatchQueue.main.async {[weak self] in
                       self?.collectionView.reloadData()
    
                   }
            
        }
    }
    



   
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
                collectionView.delegate = self
        collectionView.dataSource = self
        NotificationCenter.default.addObserver(self, selector: #selector(handlegetInfData(notification:)), name: .getInfData, object: nil)

    }
    
    @objc func handlegetInfData(notification: Notification) {
        if let inf = notification.object as? InfAtendance {
            self.infDaySelected = inf
            collectionView.reloadData()
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }


}

extension InfDayViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("hehe")
        print(infDaySelected)
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell( withReuseIdentifier: InfDayCollectionViewCell.identifier,for: indexPath) as! InfDayCollectionViewCell
        if(infDaySelected != nil){
            
            switch indexPath.row{
                case 0:
                    cell.configureLabel(with: "Ngày check in: \((infDaySelected?.date_check_in)!)")
                case 1:
                    cell.configureLabel(with: "Vào sớm: \(String((infDaySelected?.early_check_out)!))")
                case 2:
                    cell.configureLabel(with: "Vào muộn: \(String((infDaySelected?.late_check_in)!))")
                case 3:
                    cell.configureLabel(with: "Công: \(String((infDaySelected?.total_work_paid)!))")
                default:
                    print("loi")
            }
        
        }
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.black.cgColor


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


