//
//  SingleTask.swift
//  Tasks
//
//  Created by Ivan Konishchev on 25.08.2022.
//

import Foundation


final class SingleTask: Task {

    var task: String
    var content: [Task] = []
 
    init(task: String) {
        self.task = task
    }
    
    func open() -> [Task] {
        return content
    }

    func addFolder(_ task: [Task]) {
        self.content = task
    }
}
