//
//  EmployeeObservable.swift
//  SwiftUICombineStarter
//
//  Created by Khasnobis, Pritha on 06/05/20.
//  Copyright © 2020 Deloitte. All rights reserved.
//

import Foundation

final class EmployeeObservable: ObservableObject {

    static let shared = EmployeeObservable()
    private init() {
       // fetchEmployees()
    }
    
    var employeeArray = [Employee]()
    var error = ""
    var isLoading = false

    private func fetchEmployees() {
    
        isLoading = true
        
        guard let url = URL(string: "http://dummy.restapiexample.com/api/v1/employees") else {
            
            self.error = "Invalid URL"
            return
        }

        let task = URLSession.shared.dataTask(with: url) { [unowned self] (data, response, error) in
            self.isLoading = false
            guard let data = data else {
                self.error = error?.localizedDescription ?? "Error occured!"
                return
            }
            
            let jsonDecoder = JSONDecoder()
            do {
                let employeeData = try jsonDecoder.decode(EmployeeData.self, from: data)
                if let data = employeeData.data {
                    self.employeeArray = data
                }
            } catch {
                self.error = error.localizedDescription
            }
        }
        task.resume()
    }
}
