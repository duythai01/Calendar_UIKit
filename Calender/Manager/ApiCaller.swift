//
//  ApiCaller.swift
//  Calender
//
//  Created by Apple on 31/08/2022.
//

import Foundation

enum APIError: Error{
    case failedToGetData
}


class APICaller{
    static let shared = APICaller()
    
    func getInfInDay(completion: @escaping (Result< Attendance , Error>) -> Void){
        guard let url = URL(string: "https://erp.icheck.vn/icheck_timesheet/644/8/2022") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(Attendance.self, from: data)
                print(results)
                
            }catch{
                print(error.localizedDescription)
                print(String(describing: error))
            }
        }
        task.resume()
    }
    
}
