//
//  InfDayCollectionViewCell.swift
//  Calender
//
//  Created by Apple on 30/08/2022.
//

import UIKit


class InfDayCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "InfDayCollectionViewCell"
    
    
    private lazy var label: UILabel = {
      let label = UILabel()
        label.text = "Some thing in here Some thing in here"
      label.textAlignment = .center
      label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
      label.textColor = .label
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(label)
        
        
    }
    public func configureLabel(with lb: String){
        label.text = lb
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
private extension CalendarDateCollectionViewCell {
    
  

}
