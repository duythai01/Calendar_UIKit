//
//  BodyView.swift
//  Calender
//
//  Created by Apple on 19/08/2022.
//

import UIKit

class CalendarView: UIView {

    private let calendarStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40).isActive = true
//        stackView.heightAnchor.constraint(equalToConstant:  (UIScreen.main.bounds.height/2.8)*0.2).isActive = true
//        stackView.axis = .vertical
        stackView.layer.cornerRadius = 15
 
        stackView.alignment = .top
//        stackView.distribution = .fill
        
        stackView.spacing = 10
        stackView.backgroundColor = .systemTeal
        return stackView
    }()
    
//    private lazy var headerView = HeaderView().self
//    private lazy var calendarViewController = CalendarViewController()
    
     init() {
         super.init(frame: CGRect.zero)
         
         addSubview(calendarStackView)
    }
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        calendarStackView.frame = view.bounds
//    }
    
//    private func autoLayoutView(){
//        calendarStackView.addArrangedSubview(headerView)
//        calendarStackView.addArrangedSubview(calendarViewController.view)
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
