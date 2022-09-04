//
//  CalendarDateCollectionViewCell.swift
//  Calender
//
//  Created by Apple on 26/08/2022.
//

import UIKit

class CalendarDateCollectionViewCell: UICollectionViewCell {
    static let identifier = "CalendarDateCollectionViewCell"
    
    override var isSelected: Bool {
            didSet {
                contentView.backgroundColor = isSelected ? .blue : .white
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
//          applyDefaultStyle(isWithinDisplayedMonth: day.isWithinDisplayedMonth)
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
//        contentView.backgroundColor = .blue
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
//    func applyDefaultStyle(isWithinDisplayedMonth: Bool) {
//      accessibilityTraits.remove(.selected)
//      accessibilityHint = "Tap to select"
//
//      numberLabel.textColor = isWithinDisplayedMonth ? .label : .secondaryLabel
//      selectionBackgroundView.isHidden = true
//    }
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
