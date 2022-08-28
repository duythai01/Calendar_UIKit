//
//  HeaderView.swift
//  Calender
//
//  Created by Apple on 18/08/2022.
//

import UIKit

class HeaderView: UIView {

    lazy var monthLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "Month"
        label.accessibilityTraits = .header
        label.isAccessibilityElement = true
       return label
    }()
    
    var baseDate = Date() {
      didSet {
        monthLabel.text = dateFormatter.string(from: baseDate)
      }
    }
    public func configureMonth(with month: Date) {
        monthLabel.text = dateFormatter.string(from: month)
        
    }
    
    lazy var previousMonthButton: UIButton = {
      let button = UIButton()
      button.translatesAutoresizingMaskIntoConstraints = false
      button.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
      button.titleLabel?.textAlignment = .left

      if let chevronImage = UIImage(systemName: "chevron.left.circle.fill") {
        let imageAttachment = NSTextAttachment(image: chevronImage)
        let attributedString = NSMutableAttributedString()

        attributedString.append(
          NSAttributedString(attachment: imageAttachment)
        )

        attributedString.append(
          NSAttributedString(string: " Previous")
        )

        button.setAttributedTitle(attributedString, for: .normal)
      } else {
          button.setTitle("Previous", for: .normal)
      }

      button.titleLabel?.textColor = .label

      button.addTarget(self, action: #selector(didTapPreviousMonthButton), for: .touchUpInside)
      return button
    }()

    lazy var nextMonthButton: UIButton = {
      let button = UIButton()
      button.translatesAutoresizingMaskIntoConstraints = false
      button.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
      button.titleLabel?.textAlignment = .right

      if let chevronImage = UIImage(systemName: "chevron.right.circle.fill") {
        let imageAttachment = NSTextAttachment(image: chevronImage)
        let attributedString = NSMutableAttributedString(string: "Next ")

        attributedString.append(
          NSAttributedString(attachment: imageAttachment)
        )

        button.setAttributedTitle(attributedString, for: .normal)
      } else {
        button.setTitle("Next", for: .normal)
      }

      button.titleLabel?.textColor = .label

      button.addTarget(self, action: #selector(didTapNextMonthButton), for: .touchUpInside)
      return button
    }()
    
    let didTapLastMonthCompletionHandler: (() -> Void)
    let didTapNextMonthCompletionHandler: (() -> Void)
    
    @objc func didTapPreviousMonthButton() {
      didTapLastMonthCompletionHandler()
    }

    @objc func didTapNextMonthButton() {
      didTapNextMonthCompletionHandler()
    }
    
    lazy var dayOfWeekStackView: UIStackView = {
      let stackView = UIStackView()
      stackView.translatesAutoresizingMaskIntoConstraints = false
      stackView.distribution = .fillEqually
      return stackView
    }()
    
    private lazy var dateFormatter: DateFormatter = {
      let dateFormatter = DateFormatter()
      dateFormatter.calendar = Calendar(identifier: .gregorian)
      dateFormatter.locale = Locale.autoupdatingCurrent
      dateFormatter.setLocalizedDateFormatFromTemplate("M y")
      return dateFormatter
    }()
    private lazy var  HeaderStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20).isActive = true
        stackView.heightAnchor.constraint(equalToConstant:  (UIScreen.main.bounds.height/2.8)*0.18).isActive = true
        stackView.alignment = .fill

        stackView.distribution = .equalSpacing

        return stackView
    }()
    
    private lazy var TopOfHeaderStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    init(didTapLastMonthCompletionHandler: @escaping (() -> Void),
         didTapNextMonthCompletionHandler: @escaping (() -> Void)){
        
        self.didTapLastMonthCompletionHandler = didTapLastMonthCompletionHandler
        self.didTapNextMonthCompletionHandler = didTapNextMonthCompletionHandler
        
        super.init(frame: CGRect.zero)
        
        addSubview(HeaderStackView)
        
        // days
      

        for dayNumber in 1 ... 7 {
            let dayLabel = UILabel()
            dayLabel.font = .systemFont(ofSize: 12, weight: .bold)
            dayLabel.textColor = .secondaryLabel
            dayLabel.textAlignment = .center
            dayLabel.text = dayOfWeekLetter(for: dayNumber)
            
            dayLabel.isAccessibilityElement = false
            dayOfWeekStackView.addArrangedSubview(dayLabel)
            
        }
    }
    
    private func dayOfWeekLetter(for dayNumber: Int) -> String {
      switch dayNumber {
      case 1:
        return "S"
      case 2:
        return "M"
      case 3:
        return "T"
      case 4:
        return "W"
      case 5:
        return "T"
      case 6:
        return "F"
      case 7:
        return "S"
      default:
        return ""
      }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        autoLayoutTopOfHeadStackView()
        autoLayoutDayOfWeekStackView()
//        monthLabel.frame = view.bounds
    }
    
    private func autoLayoutTopOfHeadStackView(){
        HeaderStackView.addArrangedSubview(TopOfHeaderStackView)
        TopOfHeaderStackView.addArrangedSubview(previousMonthButton)
        TopOfHeaderStackView.addArrangedSubview(monthLabel)
        TopOfHeaderStackView.addArrangedSubview(nextMonthButton)

       
    }
    
    private func autoLayoutDayOfWeekStackView() {
        HeaderStackView.addArrangedSubview(dayOfWeekStackView)
    }
    
  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
