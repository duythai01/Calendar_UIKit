//
//  TagView.swift
//  Calender
//
//  Created by Apple on 20/08/2022.
//

import UIKit

class TagView: UIView {

    private let addBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named:"addTag1"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 50
        return btn
        
    }()
    private let tagBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("do something", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.setImage(UIImage(systemName: "delete.left"), for: .normal)
        btn.semanticContentAttribute = .forceRightToLeft

        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 15
        return btn
        
    }()
    
//    private let labelTagView:UILabel = {
//        let lb = UILabel()
//        lb.text = "Do something"
//
////        lb.textAlignment = .center
//        return lb
//
//    }()
//
//    private let tagItemStackView:UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.backgroundColor = .systemOrange
//        stackView.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        stackView.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        stackView.layer.cornerRadius = 15
//        stackView.alignment = .center
////        stackView.spacing = 10
////        stackView.distribution = .equalSpacing
//
//        return stackView
//    }()
    
    init() {
        super.init(frame: CGRect.zero)
//        addSubview(tagStackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        autoLayoutAddBtn()
//        autoLayoutTagBtn()
    }
    
    private func autoLayoutAddBtn(){
//        tagStackView.addArrangedSubview(addBtn)
        addBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
    }
    
    private func autoLayoutTagBtn(){
//        tagItemStackView.addArrangedSubview(labelTagView)
//        tagItemStackView.addArrangedSubview(tagBtn)
//        tagStackView.addArrangedSubview(tagBtn)
//        tagStackView.addArrangedSubview(tagBtn)
//        tagStackView.addArrangedSubview(tagBtn)
//        tagStackView.addArrangedSubview(tagBtn)
//        tagStackView.addArrangedSubview(tagBtn)
////        tagItemConstraits()
//    }
    
//    private func tagItemConstraits(){
//        let labelTagViewConstraits = [
//            labelTagView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15)
//        ]
//
//        let tagBtnConstraits = [
//            tagBtn.leadingAnchor.constraint(equalTo: labelTagView.trailingAnchor, constant: 5),
//            tagBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
//        ]
//
//        NSLayoutConstraint.activate(labelTagViewConstraits)
////        NSLayoutConstraint.activate(tagBtnConstraits)
//
    }
}
