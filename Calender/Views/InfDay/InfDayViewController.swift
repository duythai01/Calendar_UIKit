//
//  InfDayViewController.swift
//  Calender
//
//  Created by Apple on 30/08/2022.
//

import UIKit


class InfDayViewController: UIViewController {
    
    private let infDayStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.backgroundColor = .blue
        return stackView
    }()
    
    private let collectionView: UICollectionView = {
      let layout = UICollectionViewFlowLayout()

        layout.sectionInset = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
//        
      let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView.register(InfDayCollectionViewCell.self, forCellWithReuseIdentifier: InfDayCollectionViewCell.identifier)
      return collectionView
    }()
    
    var infDaySelected:InfAtendance?
//    public func configInfDaySelected(with inf: InfAtendance){
//        self.infDaySelected = inf
//        DispatchQueue.main.async {[weak self] in
//            self?.collectionView.reloadData()
//        }
//
//
//    }
    var configInfDay: InfAtendance? {
        didSet{
            guard let inf = configInfDay else {return}
            self.infDaySelected = inf
            DispatchQueue.main.async {[weak self] in
                       self?.collectionView.reloadData()
    
                   }
            
        }
    }
    
//    private func getInf(){
//        self.infDaySelected = inf
//                DispatchQueue.main.async {
//                    self.collectionView.reloadData()
//                }
//    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionView)
        collectionView.backgroundColor = .opaqueSeparator
                collectionView.delegate = self
        collectionView.dataSource = self
//        NotificationCenter.default.addObserver(self, selector: #selector(
//        self.reloadCollectionview(notification:)), name: Notification.Name("reloadCollectionView"),
//        object: nil)
    }
    
//    @objc func reloadCollectionview(notification: Notification) {
//
//
//     self.collectionView.reloadData()
//
//    /// Table is IBoutlet name of your tableview
//    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }


}

extension InfDayViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("hehe")

        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell( withReuseIdentifier: InfDayCollectionViewCell.identifier,for: indexPath) as! InfDayCollectionViewCell
        if(infDaySelected != nil){
            switch indexPath.row{
                case 0:
                    cell.configureLabel(with: (infDaySelected?.date_check_in)!)
                case 1:
                    cell.configureLabel(with: String((infDaySelected?.early_check_out)!))
                case 2:
                    cell.configureLabel(with: String((infDaySelected?.late_check_in)!))
                case 3:
                    cell.configureLabel(with: String((infDaySelected?.total_work_paid)!))
                default:
                    print("loi")
            }
        
        }

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

extension InfDayViewController: CalendarDateCollectionViewCellDelegate{
    func getInf(with data: InfAtendance) {
        self.infDaySelected = data
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
        
    }
    
    
}
