//
//  TagButton.swift
//  Calender
//
//  Created by Apple on 24/08/2022.
//

import UIKit

class TagButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        setTitleColor(.black, for: .normal)
        backgroundColor = .lightGray
        layer.cornerRadius = 12
        
    }

}
