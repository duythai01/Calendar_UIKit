//
//  TestViewController.swift
//  Calender
//
//  Created by Apple on 23/08/2022.
//

import UIKit

class TestViewController: UIViewController {
    private let tagBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("do something", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setImage(UIImage(systemName: "delete.left"), for: .normal)
        btn.semanticContentAttribute = .forceRightToLeft

        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .systemRed
        btn.layer.cornerRadius = 15
        return btn
        
    }()
    
    private let testBtn: UIButton = {
        let myButton = UIButton()
        myButton.translatesAutoresizingMaskIntoConstraints = false
//        myButton.buttonType.
        myButton.setTitle("My Button", for: .normal)
     	
//        btn.setTitleColor(UIColor.white, for: .normal)
        myButton.setImage(UIImage(systemName: "delete.left"), for: .normal)
        myButton.semanticContentAttribute = .forceRightToLeft
        myButton.setTitleColor(.white, for: .normal)
        myButton.backgroundColor = .red
        myButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        myButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return myButton
    }()
    
    private let mStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
     
        stackView.spacing = 10
        stackView.backgroundColor = .green
        return stackView
    }()
    private lazy var calendarViewController = CalendarViewController()
//    private lazy var headerView = HeaderView().self
    private let fStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.heightAnchor.constraint(equalToConstant:  UIScreen.main.bounds.height/2.2).isActive = true
        stackView.alignment = .fill
        stackView.distribution = .fill
     
        stackView.spacing = 10
        stackView.backgroundColor = .red
        return stackView
    }()
    private let faStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.heightAnchor.constraint(equalToConstant:  (UIScreen.main.bounds.height/2.2)*0.2).isActive = true
        stackView.alignment = .fill
        stackView.distribution = .fill
     
//        stackView.spacing = 10
        stackView.backgroundColor = .systemOrange
        return stackView
    }()
    private let fbStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
//        stackView.heightAnchor.constraint(equalToConstant:  UIScreen.main.bounds.height/2.2).isActive = true
        stackView.alignment = .fill
        stackView.distribution = .fill
     
//        stackView.spacing = 10
        stackView.backgroundColor = .systemPurple
        return stackView
    }()
    
    private let sStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
//        stackView.alignment = .fill
//        stackView.distribution = .fill
//
//        stackView.spacing = 10
        stackView.backgroundColor = .blue
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.addSubview(testBtn)
        view.addSubview(mStackView)
        mStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10).isActive = true
        mStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        mStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        mStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -12).isActive = true
        
//        testBtn.leadingAnchor.constraint(equalTo: tagBtn.trailingAnchor, constant: 20).isActive = true
        addStack()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        testBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
//        testBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
//        testBtn.widthAnchor.constraint(equalToConstant: 120).isActive = true
//        addStack()
    }
    
    func addStack() {
//        faStackView.addArrangedSubview(headerView)
        fbStackView.addArrangedSubview(calendarViewController.view)
        fStackView.addArrangedSubview(faStackView)
        fStackView.addArrangedSubview(fbStackView)
        mStackView.addArrangedSubview(fStackView)
        mStackView.addArrangedSubview(sStackView)
//        sStackView.addArrangedSubview(testBtn)
//        testBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
    }

  

}
