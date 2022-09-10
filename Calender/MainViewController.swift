//
//  ViewController.swift
//  Calender
//
//  Created by Apple on 17/08/2022.
//

import UIKit
import CalendarKit




class MainViewController: UIViewController {
    private let calendar = Calendar(identifier: .chinese)
    
    private let mainStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
     
//        stackView.spacing = 10
        stackView.backgroundColor = UIColor(#colorLiteral(red: 0.1715714931, green: 0.1356520951, blue: 0.2563252747, alpha: 1))
        return stackView
    }()
    private lazy var calendarViewController = CalendarViewController()
    private lazy var headerView = calendarViewController.headerView.self
    
    
    
    //Calendar view
    private let calendarStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.heightAnchor.constraint(equalToConstant:  UIScreen.main.bounds.height/2.8).isActive = true
        stackView.axis = .vertical
        stackView.layer.cornerRadius = 15

        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.backgroundColor = UIColor(#colorLiteral(red: 0.1715714931, green: 0.1356520951, blue: 0.2563252747, alpha: 1))
        return stackView
    }()
    
    private let headerCalendarStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.heightAnchor.constraint(equalToConstant:  (UIScreen.main.bounds.height/2.8) * 0.2).isActive = true

        return stackView
    }()
    
    private let bodyCalendarStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()
    
    private let spaceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.heightAnchor.constraint(equalToConstant:  (UIScreen.main.bounds.height/2.8) * 0.02).isActive = true

        return stackView
    }()
    

    private let infDayStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.layer.cornerRadius = 15
        return stackView
    }()


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(#colorLiteral(red: 0.1715714931, green: 0.1356520951, blue: 0.2563252747, alpha: 1))
        self.autoLayoutcalendarStackView()
        self.autoLayoutInfDayStackView()
        view.addSubview(mainStackView)
        applyConstraints()

        
    }
   

    private func applyConstraints(){
        let mainStackViewConstraints = [
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0)
        
        ]
      
        NSLayoutConstraint.activate(mainStackViewConstraints)
    }
    
    private func autoLayoutcalendarStackView() {
        
        headerCalendarStackView.addArrangedSubview(headerView)
        bodyCalendarStackView.addArrangedSubview(calendarViewController.view)
        calendarStackView.addArrangedSubview(headerCalendarStackView)
        calendarStackView.addArrangedSubview(bodyCalendarStackView)
        calendarStackView.addArrangedSubview(spaceStackView)

        mainStackView.addArrangedSubview(calendarStackView)
        
    }
    
    var infDayView = InfDayViewController()


    private func autoLayoutInfDayStackView(){
        
        mainStackView.addArrangedSubview(infDayStackView)
        infDayStackView.addArrangedSubview(infDayView.view)

        
    }
    
 
}


