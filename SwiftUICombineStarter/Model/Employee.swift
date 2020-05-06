//
//  Employee.swift
//  SwiftUICombineStarter
//
//  Created by Khasnobis, Pritha on 06/05/20.
//  Copyright © 2020 Deloitte. All rights reserved.
//

import Foundation

struct EmployeeData {
    var data: [Employee]?
}

extension EmployeeData: Decodable {
    
    private enum EmployeeDataKeys: String, CodingKey {
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: EmployeeDataKeys.self)
        
        if let data = try container.decodeIfPresent([Employee].self, forKey: .data) {
            self.data = data
        }
    }
}

struct Employee {
    
    var id: String?
    var employeeName: String?
    var employeeSalary: String?
}

extension Employee: Decodable {

    private enum EmployeeKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: EmployeeKeys.self)
        
        if let id = try container.decodeIfPresent(String.self, forKey: .id) {
            self.id = id
        }
        if let employeeName = try container.decodeIfPresent(String.self, forKey: .employeeName) {
            self.employeeName = employeeName
        }
        if let employeeSalary = try container.decodeIfPresent(String.self, forKey: .employeeSalary) {
            self.employeeSalary = employeeSalary
        }
    }
}
