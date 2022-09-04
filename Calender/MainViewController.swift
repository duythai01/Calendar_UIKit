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
        stackView.backgroundColor = .black
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
//        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.backgroundColor = .systemGreen
        return stackView
    }()
    
    private let headerCalendarStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.heightAnchor.constraint(equalToConstant:  (UIScreen.main.bounds.height/2.8) * 0.2).isActive = true
//        stackView.alignment = .fill
//        stackView.distribution = .fill
        return stackView
    }()
    
    private let bodyCalendarStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.layer.cornerRadius = 15
//        stackView.alignment = .fill
//        stackView.distribution = .fill
        return stackView
    }()
    
    private let spaceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.heightAnchor.constraint(equalToConstant:  (UIScreen.main.bounds.height/2.8) * 0.02).isActive = true

        return stackView
    }()
    
    //Tag view
    private let infDayStackView: UIStackView = {
        let stackView = UIStackView()
//        stackView.translatesAutoresizingMaskIntoConstraints = false

        stackView.layer.cornerRadius = 15
//
        stackView.backgroundColor = .systemYellow
        return stackView
    }()

    
   // itemTagView
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
    
    
    //Note view
    private let noteStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.cornerRadius = 15
        stackView.backgroundColor = .systemGray
        return stackView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        self.autoLayoutcalendarStackView()
        self.autoLayoutInfDayStackView()
//        self.autonoteStackView()
        view.addSubview(mainStackView)
        applyConstraints()
//        self.getInfInDay()

        
    }
    
    private func getInfInDay(){
        APICaller.shared.getInfInDay(){_ in
            
        }
    }

    private func applyConstraints(){
        let mainStackViewConstraints = [
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -12)
        
        ]
      
        NSLayoutConstraint.activate(mainStackViewConstraints)
    }
    
    private func autoLayoutcalendarStackView() {
        
        headerCalendarStackView.addArrangedSubview(headerView)
        bodyCalendarStackView.addArrangedSubview(calendarViewController.view)
        calendarStackView.addArrangedSubview(headerCalendarStackView)
        calendarStackView.addArrangedSubview(bodyCalendarStackView)
        calendarStackView.addArrangedSubview(spaceStackView)

//        bodyCalendarStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10).isActive = true
        mainStackView.addArrangedSubview(calendarStackView)
        
    }
    
    var infDayView = InfDayViewController()


    private func autoLayoutInfDayStackView(){
        
        mainStackView.addArrangedSubview(infDayStackView)
        infDayStackView.addArrangedSubview(infDayView.view)
//        tagStackView.heightAnchor.constraint(equalToConstant: 300).isActive = true
//        tagStackView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
    }
    
    private func autonoteStackView(){
        mainStackView.addArrangedSubview(noteStackView)
//        noteStackView.heightAnchor.constraint( equalToConstant: UIScreen.main.bounds.height/2.6).isActive = true
    }
    

}


