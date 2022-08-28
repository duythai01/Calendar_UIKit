//
//  TagCollectionViewCell.swift
//  Calender
//
//  Created by Apple on 26/08/2022.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    static let identifier = "TagCollectionViewCell"
    
    let label:UILabel = {
       let lb = UILabel()
        	
        return lb
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = contentView.bounds
        
    }
    
    public func configure(with tag: String) {
        label.text = tag
    }
}
