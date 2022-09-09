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
    
    func getInfInDay(with currentDate: String ,completion: @escaping (Result< Attendance , Error>) -> Void){
        print(currentDate)
        guard let url = URL(string: "https://erp.icheck.vn/icheck_timesheet/644/\(currentDate)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(Attendance.self, from: data)
//                print(results)
                completion(.success(results))
                
            }catch{
//                print(error.localizedDescription)
//                print(String(describing: error))
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
}
