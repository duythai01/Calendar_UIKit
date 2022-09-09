//
//  InfDayMainViewController.swift
//  Calender
//
//  Created by Apple on 04/09/2022.
//

import UIKit

class MainInfDay: UIViewController {
    private let infDayStackView: UIStackView = {
        let stackView = UIStackView()
//        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
//        stackView.alignment = .center
        return stackView
    }()
    
    private let infDayrSCStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .magenta
        return stackView
    }()
    private lazy var InfDayView = InfDayViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        infDayStackView.backgroundColor = .blue
        view.addSubview(infDayStackView)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        infDayStackView.frame = view.bounds
        infDayStackView.addArrangedSubview(InfDayView.view)
        layoutSC()
    }

    private func layoutSC() {
        infDayStackView.addArrangedSubview(infDayrSCStackView)
        let infDayrSCStackViewConstraits = [
            infDayrSCStackView.heightAnchor.constraint(equalToConstant: 50),
            infDayrSCStackView.widthAnchor.constraint(equalToConstant: 50),
            
        ]
        NSLayoutConstraint.activate(infDayrSCStackViewConstraits)
    }

}
