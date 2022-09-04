//
//  Attendance.swift
//  Calender
//
//  Created by Apple on 31/08/2022.
//

import Foundation

struct StatusDay {
    var dayWork: String
    var dayOff: Bool
    enum statusDay {
        case dayWork
        case dayOff
    }

}
struct Attendance: Codable {
    let attendance: [InfAtendance]?
    let total_work_paid: Float
    let work_month: Int
    let resource_calendar: [ResourceCalendar]
}

struct InfAtendance: Codable {
    
//    let  id: StatusDay.statusDay
////    let check_in: String?
//    let check_out: String?
    let date_check_in: String?
    let late_check_in: Int?
    let early_check_out: Int?
    let total_work_paid: Float
//    let checkout_expected: String?
//        let employee_id: [String]
//        let leave_ids: [String]?
}

struct ResourceCalendar: Codable{
    let id : Int
    let name: String
    let day_period : String
    let dayofweek : String
    let  hour_from : String
    let  hour_to : String
    
}
