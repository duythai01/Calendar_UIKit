//
//  CalendarViewController.swift
//  Calender
//
//  Created by Apple on 18/08/2022.
//

import UIKit

class CalendarViewController: UIViewController {

    private let collectionView: UICollectionView = {
      let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
//      layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
      let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView.register(CalendarDateCollectionViewCell.self, forCellWithReuseIdentifier: CalendarDateCollectionViewCell.identifier)
      return collectionView
    }()
    
    private let calendar = Calendar(identifier: .gregorian)
 
    private lazy var dateFormatter: DateFormatter = {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "d"
      return dateFormatter
    }()
    
    public lazy var headerView = HeaderView(
        didTapLastMonthCompletionHandler: { [weak self] in
        guard let self = self else { return }

        self.baseDate = self.calendar.date(
          byAdding: .month,
          value: -1,
          to: self.baseDate
          ) ?? self.baseDate
        },
        didTapNextMonthCompletionHandler: { [weak self] in
          guard let self = self else { return }

          self.baseDate = self.calendar.date(
            byAdding: .month,
            value: 1,
            to: self.baseDate
            ) ?? self.baseDate
        }).self
//    private var selectedDateChanged: ((Bool) -> Bool)
    private var baseDate: Date {
      didSet {
        days = generateDaysInMonth(for: baseDate)
        collectionView.reloadData()
        headerView.baseDate = baseDate
        
      }
    }
    
    private lazy var days = generateDaysInMonth(for: baseDate)
    private var numberOfWeeksInBaseDate: Int {
      calendar.range(of: .weekOfMonth, in: .month, for: baseDate)?.count ?? 0
    }

    
    let currentDate = Date()
    init( ) {
//        print(currentDate)
        
      self.baseDate = currentDate
//        self.selectedDateChanged = false

      super.init(nibName: nil, bundle: nil)

      modalPresentationStyle = .overCurrentContext
      modalTransitionStyle = .crossDissolve
      definesPresentationContext = true
    }

    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        collectionView.backgroundColor = .systemGreen
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        headerView.baseDate = baseDate

      
        
    }
    
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    
    }
    
    enum CalendarDataError: Error {
      case metadataGeneration
    }

    private lazy var toDayString: DateFormatter = {
      let dateFormatter = DateFormatter()
      dateFormatter.calendar = Calendar(identifier: .gregorian)
      dateFormatter.setLocalizedDateFormatFromTemplate("EEEE, MMMM d")
      return dateFormatter
    }()

    private lazy var workDay: DateFormatter = {
      let dateFormatter = DateFormatter()
      dateFormatter.calendar = Calendar(identifier: .gregorian)
      dateFormatter.setLocalizedDateFormatFromTemplate("M y")
      return dateFormatter
    }()

}

extension CalendarViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print(dateFormatter.string(from: currentDate))
//        print(type(of: days[1].date))
//        print(type(of: currentDate))
//        print(days.description.dataUsingEncoding(<#T##String.Encoding#>))
        print(days)
        print(workDay.string(from: days[1].date) )
        return days.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell( withReuseIdentifier: CalendarDateCollectionViewCell.identifier,for: indexPath) as! CalendarDateCollectionViewCell
        
        let day = days[indexPath.row]
//        cell.configureDay(with: day)
        if  toDayString.string(from: currentDate) == toDayString.string(from: day.date) {
            cell.contentView.backgroundColor = .red
        }else {
            cell.contentView.backgroundColor = .white
        }
        cell.day = day
//        cell.clipsToBounds = true
//        cell.layer.masksToBounds = true
//        cell.layer.cornerRadius = cell.frame.size.width / 2.56

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

      
    }

}

extension CalendarViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Int((collectionView.frame.width - 20) / 8), height: Int(collectionView.frame.height) / (numberOfWeeksInBaseDate + 2))
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let day = days[indexPath.row]
////        selectedDateChanged(day.date)
//        dismiss(animated: true, completion: nil)
//    }
    
}

private extension CalendarViewController {
    func monthMetadata(for baseDate: Date) throws -> MonthMetadata {
      // 2
      guard let numberOfDaysInMonth = calendar.range(
          of: .day,
          in: .month,
          for: baseDate)?.count,
        let firstDayOfMonth = calendar.date(
          from: calendar.dateComponents([.year, .month], from: baseDate))
        else {
          // 3
          throw CalendarDataError.metadataGeneration
      }

      // 4
      let firstDayWeekday = calendar.component(.weekday, from: firstDayOfMonth)

      // 5
      return MonthMetadata(
        numberOfDays: numberOfDaysInMonth,
        firstDay: firstDayOfMonth,
        firstDayWeekday: firstDayWeekday)
    }
    
    func generateDay(
      offsetBy dayOffset: Int,
      for baseDate: Date,
      isWithinDisplayedMonth: Bool
    ) -> Day {
      let date = calendar.date(
        byAdding: .day,
        value: dayOffset,
        to: baseDate)
        ?? baseDate

      return Day(
        date: date,
        number: dateFormatter.string(from: date),
        isSelected: false,
//        isSelected: calendar.isDate(date, inSameDayAs: selectedDate),
        isWithinDisplayedMonth: isWithinDisplayedMonth
      )
    }
    
    func generateDaysInMonth(for baseDate: Date) -> [Day] {
      // 2
      guard let metadata = try? monthMetadata(for: baseDate) else {
        preconditionFailure("An error occurred when generating the metadata for \(baseDate)")
      }

      let numberOfDaysInMonth = metadata.numberOfDays
      let offsetInInitialRow = metadata.firstDayWeekday
      let firstDayOfMonth = metadata.firstDay

      // 3
      var days: [Day] = (1..<(numberOfDaysInMonth + offsetInInitialRow))
        .map { day in
          // 4
          let isWithinDisplayedMonth = day >= offsetInInitialRow
          // 5
          let dayOffset =
            isWithinDisplayedMonth ?
            day - offsetInInitialRow :
            -(offsetInInitialRow - day)

          // 6
          return generateDay(
            offsetBy: dayOffset,
            for: firstDayOfMonth,
            isWithinDisplayedMonth: isWithinDisplayedMonth)
        }

      days += generateStartOfNextMonth(using: firstDayOfMonth)

      return days
    }
    
    func generateStartOfNextMonth(
      using firstDayOfDisplayedMonth: Date
      ) -> [Day] {
      // 2
      guard
        let lastDayInMonth = calendar.date(
          byAdding: DateComponents(month: 1, day: -1),
          to: firstDayOfDisplayedMonth)
        else {
          return []
      }

      // 3
      let additionalDays = 7 - calendar.component(.weekday, from: lastDayInMonth)
      guard additionalDays > 0 else {
        return []
      }

      // 4
      let days: [Day] = (1...additionalDays)
        .map {
          generateDay(
          offsetBy: $0,
          for: lastDayInMonth,
          isWithinDisplayedMonth: false)
        }

      return days
    }

 
}

