//
//  JobModel.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 26.12.2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import Foundation

class Job : NSObject, NSCoding {
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "jobName")
        coder.encode(salary, forKey: "jobSalary")
        coder.encode(deadline, forKey: "jobDeadline")
    }
    
    required convenience init(coder: NSCoder) {
        let name = coder.decodeObject(forKey: "jobName") as! String
        let salary = coder.decodeInteger(forKey: "jobSalary")
        let deadline = coder.decodeInteger(forKey: "jobDeadline")
        
        self.init(name: name, salary: salary, deadline: deadline)
    }
    
    init(name: String, salary: Int, deadline: Int) {
        self.name = name
        self.salary = salary
        self.deadline = deadline
    }
    
    var name : String = ""
    var salary : Int
    var deadline : Int
}
