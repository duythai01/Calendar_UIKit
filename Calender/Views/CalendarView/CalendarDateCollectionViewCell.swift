//
//  CalendarDateCollectionViewCell.swift
//  Calender
//
//  Created by Apple on 26/08/2022.
//

import UIKit



class CalendarDateCollectionViewCell: UICollectionViewCell {
    static let identifier = "CalendarDateCollectionViewCell"
    
 
    private lazy var toDayString: DateFormatter = {
      let dateFormatter = DateFormatter()
      dateFormatter.calendar = Calendar(identifier: .gregorian)
      dateFormatter.setLocalizedDateFormatFromTemplate("dd-MM-yyyy")
      return dateFormatter
    }()
    var currentDate = Date()
    private lazy var infDay = InfDayViewController()
    var dataInf: InfAtendance = InfAtendance(date_check_in: "no data", late_check_in: 0, early_check_out: 0, total_work_paid: 0.0)
//    public func getInfDay(with infDay: InfAtendance){
//        self.infDay = infDay
//    }

   
    override var isSelected: Bool {
            didSet {

                
                if(isSelected){
                    print(day?.number)
//                    xxx.configInfDay = day?.attendace
                    let notification = Notification(name: .getInfData, object: day?.attendace, userInfo: nil )
                    NotificationCenter.default.post(notification)


//                    if(contentView.backgroundColor ==  .red){
//                        contentView.backgroundColor =  .red
//                    } else {
//                        contentView.backgroundColor =  .white
//                    }
                    contentView.layer.borderColor = UIColor(#colorLiteral(red: 0.8882840276, green: 0.4336869717, blue: 0.2047311664, alpha: 1)).cgColor

                   
                }else {
//                        contentView.backgroundColor =  .white
                    contentView.layer.borderColor = UIColor(#colorLiteral(red: 0.1715714931, green: 0.1356520951, blue: 0.2563252747, alpha: 1)).cgColor
                }
            }
        
        }

    //date
    private lazy var numberLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.textAlignment = .center
      label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
      label.textColor = .label
        
              return label
    }()
    
    //Date selected
    private lazy var selectionBackgroundView: UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
//      view.clipsToBounds = true
        view.layer.masksToBounds = true
      view.backgroundColor = .systemBlue
      return view
    }()
    
    private lazy var accessibilityDateFormatter: DateFormatter = {
      let dateFormatter = DateFormatter()
      dateFormatter.calendar = Calendar(identifier: .gregorian)
      dateFormatter.setLocalizedDateFormatFromTemplate("EEEE, MMMM d")
      return dateFormatter
    }()
    
    var day: Day? {
      didSet {
        guard let day = day else { return }

        numberLabel.text = day.number
        accessibilityLabel = accessibilityDateFormatter.string(from: day.date)
//        updateSelectionStatus()
          applyDefaultStyle(isWithinDisplayedMonth: day.isWithinDisplayedMonth)

//          updateSelectionStatus()
      }
    }
    public func configureDay(with day: Day){
        numberLabel.text = day.number
        accessibilityLabel = accessibilityDateFormatter.string(from: day.date)
    }
    
    override init(frame: CGRect) {
      super.init(frame: frame)

      isAccessibilityElement = true
      accessibilityTraits = .button
        contentView.backgroundColor = .white
        contentView.layer.borderWidth = 3
        contentView.layer.borderColor = UIColor(#colorLiteral(red: 0.1715714931, green: 0.1356520951, blue: 0.2563252747, alpha: 1)).cgColor
        contentView.layer.cornerRadius = 12
        //      contentView.addSubview(selectionBackgroundView)
      contentView.addSubview(numberLabel)
    
       
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        numberLabel.frame = contentView.bounds
        

    }
    

    
    public func dateBackGroundView( currentDay: Bool){
        if currentDay {
            selectionBackgroundView.backgroundColor = .red
        }else{
            selectionBackgroundView.backgroundColor = .white
        }
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension CalendarDateCollectionViewCell {
    func applyDefaultStyle(isWithinDisplayedMonth: Bool) {
      accessibilityTraits.remove(.selected)
      accessibilityHint = "Tap to select"

      numberLabel.textColor = isWithinDisplayedMonth ? .label : .secondaryLabel
      selectionBackgroundView.isHidden = true
    }
//
//    func updateSelectionStatus() {
//      guard let day = day else { return }
//
//      if day.isSelected {
//        applySelectedStyle()
//      } else {
//        applyDefaultStyle(isWithinDisplayedMonth: day.isWithinDisplayedMonth)
//      }
//    }
//
//    func applySelectedStyle() {
//      accessibilityTraits.insert(.selected)
//      accessibilityHint = nil
//        numberLabel.backgroundColor = .systemPurple
//
//    }

}


extension Notification.Name {
    static let getInfData = Notification.Name("getInfData")
  
}
